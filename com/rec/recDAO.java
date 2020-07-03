package rec;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import farm.farmDTO;
import main.StringUtil;
import util.DBCon;
import rec.recDTO;

public class recDAO {
	DBCon dbcp = new DBCon();

	/*
	 * @Date : 2020.03.06
	 * 
	 * @Method : getTankCnt
	 * 
	 * @author : Kojian
	 * 
	 * @param : farmID
	 * 
	 * @return : tankCnt
	 * 
	 * @remark : "LogDataRequest.java"
	 */
	public ArrayList<recDTO> wtRecRet(String farmID) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String tankCnt = null;
		String countSQL = null;
		String sql = null;

		ArrayList<recDTO> wtList = new ArrayList<recDTO>();

		try {
			con = dbcp.getConnection();
			String tankid_account_query = "select tankid from watertank where farmid= ?";
			pstmt = con.prepareStatement(tankid_account_query);
			pstmt.setString(1, farmID);

			rs = pstmt.executeQuery();

			ArrayList<String> tankidArray = new ArrayList<>();

			while (rs.next()) {
				tankidArray.add(rs.getString("tankid"));
			}
			
			for (int i = 0; i < tankidArray.size(); i++) {
				recDTO tempbean = new recDTO();
				
				sql = "select TANKID, STATE,YRCODE,FISHID,DOREC,WTREC,PHREC,NH4REC,NO2REC,RECSEQ"
						+ " from ( select * from rec order by ROWNUM DESC)" + " where  ROWNUM=1 and tankid= ? and farmid = ?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, tankidArray.get(i));
				pstmt.setString(2,farmID);
				rs = pstmt.executeQuery();		
						
				while (rs.next()) {
					tempbean.setTankId(rs.getString("TANKID"));
					tempbean.setState(rs.getString("STATE"));
					tempbean.setYrCode(rs.getString("YRCODE"));
					tempbean.setFishId(rs.getInt("FISHID"));
					tempbean.setDoRec(rs.getDouble("DOREC"));
					tempbean.setWtRec(rs.getDouble("WTREC"));
					tempbean.setPhRec(rs.getDouble("PHREC"));
					tempbean.setNh4Rec(rs.getDouble("NH4REC"));
					tempbean.setNo2Rec(rs.getDouble("NO2REC"));
					tempbean.setRecSeq(rs.getInt("RECSEQ"));

					wtList.add(tempbean);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbcp.close(con, pstmt, rs);

		}
		return wtList;
	}
	/*
	 * @Date : 2020.07.02
	 * 
	 * @Method : RecList
	 * 
	 * @author : kimsunghyun
	 * 
	 * @param : recDTO
	 * 
	 * @return : recDTO
	 * 
	 * @remark :
	 */
	public ArrayList<recDTO> RecList(recDTO indto) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		StringUtil str = new StringUtil();
		
		ArrayList<recDTO> adto = new ArrayList<recDTO>();
		
		sql = "select * "
				+ "from "
				+ "(select rownum,to_char(sensordate, 'yyyy-mm-dd hh24:mi') as sensordate, tankid, fishid, state, yrcode, dorec, wtrec, psurec, phrec, nh4rec, no2rec,farmid,recseq  from rec) a, "
				+ "(select distinct fishname, groupcode from fish) b "
				+ "where a.fishid = b.groupcode "
				+ "and rownum >= 1 and rownum <= 10  "
				+ "and a.farmid = " + indto.getFarmId() + " ";
		
		if( !indto.getSensorDate().equals("") ) {
			sql += " and " + indto.getSensorDate();
		}
		
		if( !indto.getTankId().equals("")) {
			sql += " and tankID like '%" + indto.getTankId() + "%'";
		}
		
		if( !indto.getRemark().equals("")) {
			sql += " and fishName like '%" + indto.getRemark() + "%'";
		}
		
		if(!indto.getState().equals("")) {
			sql += " and state like '%" + indto.getState() + "%'";
		}
		
		System.out.println(sql);
		sql += " order by recseq desc ";
		
		try {
			con =  dbcp.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) 
			{
				recDTO outdto = new recDTO();
				outdto.setSensorDate(rs.getString("sensordate"));	
				outdto.setTankId(rs.getString("tankid"));			
				outdto.setRemark(rs.getString("fishname"));			
				if(rs.getString("state").equals("G"))				
				{
					outdto.setState("정상");	
				}
				else if(rs.getString("state").equals("Y"))
				{
					outdto.setState("경고");
				}
				else if(rs.getString("state").equals("R"))
				{
					outdto.setState("위험");
				}
				outdto.setYrCode(str.nullToBlank(rs.getString("yrcode")));			
				outdto.setDoRec(rs.getDouble("dorec"));				
				outdto.setWtRec(rs.getDouble("wtrec"));				
				outdto.setPsuRec(rs.getDouble("psurec"));			
				outdto.setPhRec(rs.getDouble("phrec"));				
				outdto.setNh4Rec(rs.getDouble("nh4rec"));			
				outdto.setNo2Rec(rs.getDouble("no2rec"));			
				adto.add(outdto);				
			}
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		} 
		finally 
		{
			dbcp.close(con, pstmt, rs);
		}
		
		return adto;
	}
	
	   /*
		 * @ Author : kim sung hyun
		 * 
		 * @ PAGE : farmSearch.jsp
		 *
		 * @ Parameter : String ID, String Auth, String farmname
		 * 
		 * @ Description : ArrayList<farmDTO>
		 * 
		 * @ DATE : 2020-06-09
		 * 
		 */
		public ArrayList<farmDTO> farmSearch(String ID, String Auth, String farmname)
		{
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			ResultSet rs = null;
			
			ArrayList<farmDTO> adto = new ArrayList<farmDTO>();		
			
			try
			{
				con = dbcp.getConnection();
				
				sql = "select farmid, farmname, address from farm ";
				
				if(Auth.equals("전체관리자"))
				{	
					if(!farmname.equals(""))
					{
						sql += "where farmname like '%" + farmname + "%' ";
					}
				}
				else
				{	
					sql += "where userid = '"+ ID +"' ";
					
					if(Auth.equals("일반관리자"))
					{	
						if(!farmname.equals(""))
						{
							sql += "and farmname like '%" + farmname + "%' ";
						}
					}
				}
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next())
				{
					farmDTO dto = new farmDTO();
					dto.setFarmId(rs.getInt("farmid"));						
					dto.setFarmName(rs.getString("farmname"));				
					String address[] = rs.getString("address").split(" ");	
					dto.setAddress(address[0] + " " + address[1]);			
					adto.add(dto);											
				}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			finally 
			{
				dbcp.close(con, pstmt, rs);
			}
			
			return adto;
		}
	
} // Class End Line
