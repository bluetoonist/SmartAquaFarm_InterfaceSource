package farm;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import farm.farmDTO;

import util.DBCon;

public class farmDAO {

	DBCon dbcp = new DBCon();

	/***********************************
	 * @name farmSelect
	 * @author Hwang Seon Ju
	 * @param ID
	 * @return ArrayList<farmDTO>
	 * @remark 양식장 이름 출력(권한 : 사용자) , 사용처 - main.jsp ,farmwtSearch.jsp
	 ***********************************/

	public ArrayList<farmDTO> farmSelect(String ID) throws NullPointerException, SQLException {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql1 = null;
		String sql2 = null;
		ArrayList<farmDTO> farmnamelist = new ArrayList<farmDTO>();

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

			sql2 = "select farmname from farm where farmid = ?";
			pstmt = con.prepareStatement(sql2);
			pstmt.setString(1, farmid);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				farmDTO vo = new farmDTO();
				vo.setFarmName(rs.getString("farmname"));
				farmnamelist.add(vo);
			}

		} catch (NumberFormatException e) {
			e.printStackTrace();
		} finally {
			DBCon.close(con, pstmt, rs);
		}
		return farmnamelist;
	}
	//--------------------------------------------------------------
	  
	   /**************************************
	    * @name  getFarm()
	    * @author  源��꽦�쁽
	    * @param   FarmID from FarmTable
	    * @return  list
	    * @remark  �궗�슜�옄 �젙蹂댁뿉�꽌 �뼇�떇�옣 媛믪쓣 媛��졇�삩�떎 - userInfo.jsp
	    ****************** ********************/
	   
	   
	   public ArrayList<farmDTO> getFarm(int arr[])  throws NullPointerException, SQLException {
	      Connection con = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      String sql = null;

	      ArrayList list = new ArrayList();

	      try {
	         con = DBCon.getConnection();

	         for (int i = 0; i < arr.length; i++) {

	            sql = "select farmid, farmname, address " + "from farm " + "where farmid = ?";

	            pstmt = con.prepareStatement(sql);
	            pstmt.setInt(1, arr[i]);
	            rs = pstmt.executeQuery();
	            farmDTO bean = new farmDTO();

	            while (rs.next()) {
	               bean.setFarmId(rs.getInt("farmid"));
	               bean.setFarmName(rs.getString("farmname"));
	               bean.setAddress(rs.getString("address"));
	               list.add(bean);
	            }
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         DBCon.close(con, pstmt, rs);
	      }
	      return list;

	   }
	   
	   /*
		 * @ Author : kimsunghyun
		 * 
		 * @ PAGE : user/userinfo.jsp , main/index.jsp
		 *
		 * @ Parameter : user_id
		 * 
		 * @ Description : return to farmname or address
		 * 
		 * @ DATE : 2020-03-03
		 */
		
		   public  ArrayList<farmDTO> getuserData(String farm_ID,String user_ID) {
			  			   
		      Connection con = null;
		      PreparedStatement pstmt = null;
		      String sql = null;

		      ResultSet rs = null;

		      ArrayList<farmDTO> vlist = new ArrayList<farmDTO>();
		      try {
		         con = dbcp.getConnection();
		         
		         sql = "select farmid,farmname, address "
		         		+ "from farm "
		         		+ "where farmid = ? or userid= ?";
		         pstmt = con.prepareStatement(sql);
		         pstmt.setString(1, farm_ID); 
		         pstmt.setString(2, user_ID); 
		         rs = pstmt.executeQuery();

		         while (rs.next()) {		    
		        	 farmDTO temp_bean = new farmDTO();
			
		        	 temp_bean.setFarmName(rs.getString("farmname"));		        	 
		        	 temp_bean.setAddress(rs.getString("address"));		       
		        	 temp_bean.setFarmId(rs.getInt("farmid"));
		        	 
		        	 vlist.add(temp_bean);
		         }
		      } catch (Exception e) {
		         e.printStackTrace();
		      } finally {
		         dbcp.close(con, pstmt, rs);
		      }

		      return vlist;
		   }
	

}
