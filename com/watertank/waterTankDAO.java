package watertank;

import java.sql.Connection;
import java.beans.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.stream.Stream;



import util.DBCon;

public class waterTankDAO {

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

	public String getTankCnt(String farmID) {

		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;

		String tankCnt = null;

		ResultSet rs = null;
		int farid_Int = Integer.parseInt(farmID);

		try {
			con = dbcp.getConnection();

			sql = "select count(*) from watertank where farmid=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, farid_Int);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				tankCnt = Integer.toString(rs.getInt(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbcp.close(con, pstmt, rs);
		}

		return tankCnt;
	}
	/**************************************
	    * @name waterTankSelect()
	    * @author �옣�빐由�
	    * @param tankID, farmid
	    * @return ArrayList
	    * @remark �뼇�떇�옣 �닔議� �젙蹂� 異쒕젰 - farm/farmwtUpdateForm.jsp
	    **************************************/
	   public ArrayList waterTankSelect(String tankID, int farmid) throws NullPointerException, SQLException {

	      ArrayList wtselectlist = new ArrayList();
	      Connection con = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;

	      try {
	         con = DBCon.getConnection();
	         String sql = " select w.tankid, nvl(f.fishname, ' ') as fishname, nvl(w.userid,' ') as userid, nvl(w.dosensor,' ') as dosensor, nvl(w.phsensor,' ') as phsensor, nvl(w.psusensor, ' ') as psusensor, nvl(w.wtsensor, ' ') as wtsensor,"
	               + " nvl(w.nh4sensor, ' ') as nh4sensor , nvl(w.no2sensor, ' ' ) as no2sensor from watertank w, fish f where w.farmid = ? and w.farmid = f.farmid and f.fishid = w.fishid and w.tankid = ? ";

	         pstmt = con.prepareStatement(sql);
	         pstmt.setInt(1, farmid);
	         pstmt.setString(2, tankID);
	         rs = pstmt.executeQuery();

	         while (rs.next()) {
	            waterTankDTO vo = new waterTankDTO();
	            vo.setTankId(rs.getString("tankid"));
	            vo.setRemark(rs.getString("fishname"));
	            vo.setUserId(rs.getString("userid"));
	            vo.setDoSensor(rs.getString("dosensor"));
	            vo.setPhSensor(rs.getString("phsensor"));
	            vo.setPsuSensor(rs.getString("psusensor"));
	            vo.setWtSensor(rs.getString("wtsensor"));
	            vo.setNh4Sensor(rs.getString("nh4sensor"));
	            vo.setNo2Sensor(rs.getString("no2sensor"));

	            wtselectlist.add(vo);
	         }

	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         DBCon.close(con, pstmt, rs);
	      }

	      return wtselectlist;
	   }
	/***********************************
	 * @name waterTankSearch
	 * @author Hwang Seon Ju
	 * @param ID, search, searchinput
	 * @return ArrayList<waterTankTableDTO>
	 ***********************************/

	public ArrayList<waterTankDTO> waterTankSearch(String ID, String search, String searchinput)
			throws NullPointerException, SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql1 = null;
		String sql2 = null;
		ArrayList<waterTankDTO> wtlist = new ArrayList<waterTankDTO>();

		try {
			con = DBCon.getConnection();

			sql1 = "select farmid from usertable where userid=?";
			pstmt = con.prepareStatement(sql1);
			pstmt.setString(1, ID);
			rs = pstmt.executeQuery();

			String farmid = "";

			if (rs.next()) {
				farmid = rs.getString("farmid");
			}

			sql2 = "select w.tankid, f.fishname, nvl(w.userid, ' ') as userid, nvl(w.dosensor, ' ') as dosensor, nvl(w.phsensor, ' ') as phsensor, nvl(w.psusensor, ' ') as psusensor, nvl(w.wtsensor, ' ') as wtsensor, nvl(w.nh4sensor, ' ') as nh4sensor, nvl(w.no2sensor, ' ') as no2sensor, w.lastuptid, "
					+ " to_char(w.lastuptdate, 'YY/MM/DD HH24:MI:SS') as lastuptdate from watertank w, fish f where w.farmid = ? "
					+ " and w.farmid = f.farmid and f.fishid = w.fishid";

			if (searchinput != null && !searchinput.equals("") && search != "null" && !search.equals("null")) {
				sql2 += " and w." + search.trim() + " LIKE '%" + searchinput.trim() + "%' order by w.tankid";
			} else {
				// 紐⑤뱺 �젙蹂� 異쒕젰
				sql2 += " order by w.tankid";
			}

			pstmt = con.prepareStatement(sql2);
			pstmt.setString(1, farmid);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// watertank DTO
				waterTankDTO vo = new waterTankDTO();
				vo.setTankId(rs.getString("tankid"));
				vo.setRemark(rs.getString("fishname"));
				vo.setUserId(rs.getString("userid"));
				vo.setDoSensor(rs.getString("dosensor"));
				vo.setPhSensor(rs.getString("phsensor"));
				vo.setPsuSensor(rs.getString("psusensor"));
				vo.setWtSensor(rs.getString("wtsensor"));
				vo.setNh4Sensor(rs.getString("nh4sensor"));
				vo.setNo2Sensor(rs.getString("no2sensor"));
				vo.setLastUptId(rs.getString("lastuptid"));
				vo.setLastUptdate(rs.getString("lastuptdate"));
				wtlist.add(vo);
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} finally {
			DBCon.close(con, pstmt, rs);
		}

		return wtlist;

	}
	/***********************************
	    * @name    waterTankSearch
	    * @author  Hwang Seon Ju
	    * @param   farmid, search, searchinput
	    * @return  ArrayList<waterTankTableDTO>
	    * @remark  
	    ***********************************/

	   public ArrayList<waterTankDTO> waterTankSearch(int farmid, String search, String searchinput) throws NullPointerException, SQLException {
	      Connection con = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      String sql2 = null;
	      ArrayList<waterTankDTO> wtlist = new ArrayList<waterTankDTO>();

	      try {
	         con = DBCon.getConnection();
	         sql2 = "select w.tankid, f.fishname, nvl(w.userid, ' ') as userid, nvl(w.dosensor, ' ') "
	         		+ "as dosensor, nvl(w.phsensor, ' ') as phsensor, nvl(w.psusensor, ' ') "
	         		+ "as psusensor, nvl(w.wtsensor, ' ') as wtsensor, nvl(w.nh4sensor, ' ') "
	         		+ "as nh4sensor, nvl(w.no2sensor, ' ') as no2sensor, w.lastuptid, to_char(w.lastuptdate, 'YY/MM/DD HH24:MI:SS') "
	         		+ "as lastuptdate from watertank w ,fish f where w.farmid = ? and w.fishid = f.fishid";

	         if (searchinput != null && !searchinput.equals("") && search != "null" && !search.equals("null")) {
	            sql2 += " and w." + search.trim() + " LIKE '%" + searchinput.trim() + "%' order by w.tankid";
	            
	         } else {
	            sql2 += " order by w.tankid";
	         }
	         	         
	         pstmt = con.prepareStatement(sql2);
	         pstmt.setInt(1, farmid);
	         rs = pstmt.executeQuery();

	         while (rs.next()) {
	            waterTankDTO vo = new waterTankDTO();
	            vo.setTankId(rs.getString("tankid"));
	            vo.setRemark(rs.getString("fishname"));
	            vo.setUserId(rs.getString("userid"));
	            vo.setDoSensor(rs.getString("dosensor"));
	            vo.setPhSensor(rs.getString("phsensor"));
	            vo.setPsuSensor(rs.getString("psusensor"));
	            vo.setWtSensor(rs.getString("wtsensor"));
	            vo.setNh4Sensor(rs.getString("nh4sensor"));
	            vo.setNo2Sensor(rs.getString("no2sensor"));
	            vo.setLastUptId(rs.getString("lastuptid"));
	            vo.setLastUptdate(rs.getString("lastuptdate"));
	            wtlist.add(vo);
	         }

	      } catch (NumberFormatException e) {
	         e.printStackTrace();
	      } finally {
	         DBCon.close(con, pstmt, rs);
	      }
	      return wtlist;
	   }
}
