package repair;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
} // CLASS END LINE
