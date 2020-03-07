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
		ResultSet rs =null;
		
		String tankCnt = null;
		String countSQL = null;
		String sql = null;
		
		ArrayList<recDTO> wtList = new ArrayList<recDTO>();
		
		try {
			//DB ????
			con =  dbcp.getConnection();
			countSQL = "select count(recseq) as CNT from REC where farmid= ?";
			
			pstmt = con.prepareStatement(countSQL);
			pstmt.setString(1,farmID);
			pstmt.executeUpdate();
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				recDTO tempbean = new recDTO();
				
				tempbean.setRemark(rs.getString("CNT"));
				wtList.add(tempbean);
			}
			
			sql = "select TANKID, STATE,YRCODE,FISHID,DOREC,WTREC,PHREC,NH4REC,NO2REC,RECSEQ"
					+ " from REC "
					+ " where farmid= ?"
					+ " order by recseq ASC";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, farmID);
			pstmt.executeUpdate();
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				recDTO tempbean = new recDTO();
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
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbcp.close(con, pstmt, rs);
	
		}
		return wtList;
	}
} // Class End Line
