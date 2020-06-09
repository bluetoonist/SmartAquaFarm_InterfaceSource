package repair;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import main.StringUtil;
import repair.repairDTO;

import util.DBCon;

public class repairDAO {
	DBCon dbcp = new DBCon();

	/*
	 * @Date : 2019.08.13
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
	public String retRepSeq(String farmID, String tankID) {

		Connection con = null;
		String countSQL = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String Counter1 = null;
		String Counter2 = null;

		int TypeToFarmID = Integer.parseInt(farmID);
		try {

			con = DBCon.getConnection();
			countSQL = "select COUNT(*) COMPARE from  repair where farmid=? and tankid= ? " + " union ALL "
					+ " select COUNT(*) COMPARE from  repair as of TIMESTAMP(SYSTIMESTAMP-INTERVAL '10' SECOND)  where farmid=? and tankid=?";

			pstmt = con.prepareStatement(countSQL);

			pstmt.setInt(1, TypeToFarmID);
			pstmt.setString(2, tankID);
			pstmt.setInt(3, TypeToFarmID);
			pstmt.setString(4, tankID);

			rs = pstmt.executeQuery();

			rs.next();
			Counter1 = rs.getString(1);
			rs.next();
			Counter2 = rs.getString(1);

			int Counter_1 = Integer.parseInt(Counter1);
			int Counter_2 = Integer.parseInt(Counter2);

			if (Counter_1 != Counter_2) {
				return "조치가 완료되었습니다.";

			} else {
				return "";
			}

		} catch (

		Exception e) {
			e.printStackTrace();
		} finally {
			DBCon.close(con, pstmt, rs);
		}
		return "";

	}
	
	/**************************************
	 * @name repairRec()
	 * @author 臾몄씤李�
	 * @param repairDTO
	 *            -
	 * @return ArrayList<repairDTO>
	 * @remark �빐�떦 �뼇�떇�옣怨� 寃��깋議곌굔�뿉 留욌뒗 議곗튂湲곕줉 寃��깋
	 * 		   �궗�슜泥� - waterTank/repairRec.jsp
	 **************************************/
	
	public ArrayList<repairDTO> repairRec(repairDTO indto) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		ArrayList<repairDTO> adto = new ArrayList<repairDTO>();
		StringUtil str = new StringUtil();
		
		sql = "select repairseq, recSeq, tankid, fishname, state ,yrcode, "
				+ "to_char(sensordate, 'yyyy-mm-dd hh24:mi') as sensordate, repaircontents, "
				+ "lastuptid, to_char(lastuptdate, 'yyyy-mm-dd hh24:mi') as lastuptdate "
				+ "from repair r, (select distinct groupcode, fishname from fish) f "
				+ "where r.fishId = f.groupcode and farmId = " + indto.getFarmId() + " ";
		
		if( !indto.getSensorDate().equals("") ) {
			sql += " and " + indto.getSensorDate();
		}
		
		if( !indto.getLastUptdate().equals("") ) {
			sql += " and " + indto.getLastUptdate();
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
		
		sql += " order by repairseq desc ";
		
		try {
			con =  dbcp.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) 
			{
				repairDTO outdto = new repairDTO();
				outdto.setRepairSeq(rs.getInt("repairseq"));
				outdto.setRecSeq(rs.getInt("recseq"));
				outdto.setTankId(rs.getString("tankid"));
				outdto.setRemark(rs.getString("fishname"));
				if(rs.getString("state").equals("G"))				// �긽�깭 媛� 寃곗젙
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
				outdto.setYrCode(rs.getString("yrcode"));
				outdto.setSensorDate(rs.getString("sensordate"));
				outdto.setRepairContents(str.nullToBlank(rs.getString("repaircontents")));
				outdto.setLastUptId(str.nullToBlank(rs.getString("lastuptid")));
				outdto.setLastUptdate(rs.getString("lastuptdate"));
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
	
	//--------------------------------------------------------------
	
	/**************************************
	 * @name getRepairContents
	 * @author 臾몄씤李�
	 * @param repairSeq, recSeq
	 *            -
	 * @return String
	 * @remark 湲� repairContents �궡�슜�씠 �엳�쓣 �닔�룄 �엳�뼱�꽌 repairSeq, recSeq瑜� 諛쏆븘�꽌 �뵲濡� 戮묒븘�샂
	 * 		   �궗�슜泥� - waterTank/wtCautionUpdateForm.jsp
	 **************************************/
	
	public String getRepairContents(int repairSeq, int recSeq) throws NullPointerException, SQLException {
		PreparedStatement psmt = null;
		ResultSet rs = null;
		Connection con = null;
		String sql = null;
		String contents = null;
		StringUtil str = new StringUtil();
		
		try {
			con = DBCon.getConnection();
			sql = "select repaircontents from repair where repairSeq = ? and recSeq = ?";
			
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, repairSeq);
			psmt.setInt(2, recSeq);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				contents = rs.getString("repaircontents");
				contents = str.nullToBlank(contents);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			DBCon.close(con, psmt, rs);
		}
		
		return contents;
	}
	
	/**************************************
	 * @name repairContentsUpdate
	 * @author �눧紐꾩뵥筌∽옙
	 * @param repairSeq, contents
	 *            -
	 * @return 
	 * @remark wtCautionUpdateFormPrc.jsp 占쎈퓠占쎄퐣 鈺곌퀣�뒄占쎄땀占쎌뒠 占쎈씜占쎈쑓占쎌뵠占쎈뱜 占쎌뒠占쎈즲
	 **************************************/
	
	public void repairContentsUpdate(String repairSeq, String contents) throws NullPointerException, SQLException {
		PreparedStatement psmt = null;
		ResultSet rs = null;
		Connection con = null;
		String sql = null;
		
		try {
			con = DBCon.getConnection();
			sql = "update repair set repaircontents = ?, lastuptdate = sysdate where repairSeq = ? ";

			psmt = con.prepareStatement(sql);
			psmt.setString(1, contents);
			psmt.setString(2, repairSeq);
			
			psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			//占쎈염野껓옙 占쎄괌疫뀐옙
			DBCon.close(con, psmt, rs);
		}
	}
	
} // CLASS END LINE
