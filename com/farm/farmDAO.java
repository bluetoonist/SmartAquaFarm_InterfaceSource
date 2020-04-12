package farm;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.stream.Stream;
import java.util.*;

import farm.farmDTO;

import util.DBCon;

public class farmDAO {

	DBCon dbcp = new DBCon();

	/***********************************
	 * @name farmSelect
	 * @author Hwang Seon Ju
	 * @param  String ID
	 * @return ArrayList<farmDTO>
	 * @remark main.jsp ,farmwtSearch.jsp
	 ***********************************/

	public ArrayList<farmDTO> farmSelect(String ID) throws NullPointerException, SQLException {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String _farmid_account_sql = null;
		String _farmName_account_sql = null;
		ArrayList<farmDTO> farmnamelist = new ArrayList<farmDTO>();

		try {
			con = DBCon.getConnection();
			_farmid_account_sql = "select farmid from usertable where userid=?";
			pstmt = con.prepareStatement(_farmid_account_sql);
			pstmt.setString(1, ID);
			rs = pstmt.executeQuery();
			String farmid = "";

			if (rs.next()) {
				farmid = rs.getString("farmid");
			}

			 _farmName_account_sql = "select farmname from farm where farmid = ?";
			pstmt = con.prepareStatement( _farmName_account_sql);
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
	
	/***********************************
	    * @name   farmSelect()
	    * @author Hwang Seon Ju
	    * @param  farmid
	    * @return ArrayList<farmDTO>
	    * @remark main.jsp ,farmwtSearch.jsp
	    ***********************************/

	   public String farmSelect(int farmid) throws NullPointerException, SQLException {
	      
	      Connection con = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      String _farmName_account_sql = null;
	      
	      String farmname = null;
	      
	      try {
	         con = DBCon.getConnection();
	         _farmName_account_sql = "select farmname from farm where farmid = ?";
	         pstmt = con.prepareStatement(_farmName_account_sql);
	         pstmt.setInt(1, farmid);
	         rs = pstmt.executeQuery();

	         while (rs.next()) {
	            farmDTO vo = new farmDTO();	            
	            farmname = rs.getString("farmname");
	         }
	         
	      } catch (NumberFormatException e) {
	         e.printStackTrace();
	      } finally {
	         DBCon.close(con, pstmt, rs);
	      }
	      return farmname;
	   }
	  
	   /**************************************
	    * @name  getFarm()
	    * @author  Kim Seong-Hyun
	    * @param   FarmID from FarmTable
	    * @return  list
	    * @remark  userInfo.jsp
	    ****************** ********************/
	   public ArrayList<farmDTO> getFarm(String auth, String farmid)  throws NullPointerException, SQLException {
	      Connection con = DBCon.getConnection();
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      String _farm_info_sql = null;

	      ArrayList list = new ArrayList();

	      try {
	    	  if(auth.equals("sysadmin")) {// 전체 관리자일 경우
	    		  _farm_info_sql = "select farmid, farmname, address from farm";
	    		  pstmt = con.prepareStatement(_farm_info_sql);
	    		  rs = pstmt.executeQuery();
	    		  
	    	  }else if(auth.equals("admin")) {// 일반 관리자일 경우
	    		  // ,를 기점으로 값 나눠 배열에 넣기
	              int arr[] = Stream.of(farmid.split(",")).mapToInt(Integer::parseInt).toArray();
	 	         for (int i = 0; i < arr.length; i++) {
	 	        	_farm_info_sql = "select farmid, farmname, address from farm where farmid = ?";
	    		  pstmt = con.prepareStatement(_farm_info_sql);
	    		  pstmt.setInt(1, arr[i]);
	    		  rs = pstmt.executeQuery();
	    		  
	    	      while (rs.next()) {
	    	          farmDTO bean = new farmDTO();
		               bean.setFarmId(rs.getInt("farmid"));
		               bean.setFarmName(rs.getString("farmname"));
		               bean.setAddress(rs.getString("address"));
		               list.add(bean);
		            }
	 	         }
	    	  }else if(auth.equals("user")) {// 사용자일 경우
	    		  _farm_info_sql = "select farmid, farmname, address from farm where farmid = ?";
	    		  pstmt = con.prepareStatement(_farm_info_sql);
	    		  pstmt.setString(1, farmid);
	    		  rs = pstmt.executeQuery();

	    	  }
    		  
	    	  if(!auth.equals("admin")) {
	    		  while (rs.next()) {
	    	          farmDTO bean = new farmDTO();
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
		 * 
		 */
		
		   public  ArrayList<farmDTO> getuserData(String farm_ID,String user_ID) {
			  			   
		      Connection con = null;
		      PreparedStatement pstmt = null;
		      String _farm_info_sql = null;

		      ResultSet rs = null;

		      ArrayList<farmDTO> vlist = new ArrayList<farmDTO>();
		      
		      try {
		         con = dbcp.getConnection();
		         
		         _farm_info_sql = "select farmid,farmname, address "
		         		+ "from farm "
		         		+ "where farmid = ? or userid= ?";
		         pstmt = con.prepareStatement(_farm_info_sql);
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
	
		   /*
			 * @ Author : Kojian
			 * 
			 * @ PAGE : main/index.jsp
			 *
			 * @ Parameter : user_id
			 * 
			 * @ Description : return to farmname or address or farmid
			 * 
			 * @ DATE : 2020-03-03
			 * 
			 */
			
			   public  ArrayList<farmDTO> getuserFarmData(String user_ID) {
				  			   
			      Connection con = null;
			      PreparedStatement pstmt = null;
			      String sql = null;

			      ResultSet rs = null;

			      ArrayList<farmDTO> vlist = new ArrayList<farmDTO>();			      
			      ArrayList<Integer> farm_arr = new ArrayList<>();
			      
			      try {
			         con = dbcp.getConnection();
			         
			         sql = "select farmid from usertable where userid= ?";
			         pstmt = con.prepareStatement(sql);
			         pstmt.setString(1, user_ID);
			         
			         rs = pstmt.executeQuery();
			    
			         while (rs.next()) {	
			        	 String[] farm_index = rs.getString("farmid").split(",");
			        	 for(int i=0; i<farm_index.length; i++) {
			        		 farm_arr.add(Integer.parseInt(farm_index[i]));
			        	 }
	
			         }
			         
			         for(int farm_id : farm_arr) {
			        	 
			        	 String sql_farm = "select farmid,farmname,address from farm where farmid= ?";
				         
			        	 pstmt = con.prepareStatement(sql_farm);
			        	 pstmt.setInt(1,farm_id);
			        	 rs = pstmt.executeQuery();
			        	 
			        	 while(rs.next()) {
			        		 farmDTO temp_bean = new farmDTO();
			        		 temp_bean.setFarmName(rs.getString("farmname"));		        	 
			        		 temp_bean.setAddress(rs.getString("address"));		       
				        	 temp_bean.setFarmId(rs.getInt("farmid"));
				        	 vlist.add(temp_bean);
			        	 }			        	 
			         }
			      } catch (Exception e) {
			         e.printStackTrace();
			      } finally {
			         dbcp.close(con, pstmt, rs);
			      }
			      return vlist;
			   }
		
}
