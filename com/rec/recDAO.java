package rec;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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
				System.out.println(tankidArray.get(i));
				sql = "select TANKID, STATE,YRCODE,FISHID,DOREC,WTREC,PHREC,NH4REC,NO2REC,RECSEQ"
						+ " from ( select * from rec order by ROWNUM DESC)" + " where  ROWNUM=1 and tankid= ? and farmid = ?";
				System.out.println(sql);
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
} // Class End Line
