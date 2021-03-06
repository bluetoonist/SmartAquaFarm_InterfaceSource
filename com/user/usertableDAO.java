package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import farm.farmDTO;
import util.DBCon;

public class usertableDAO {

	DBCon dbcp = new DBCon();

	/*
	 * @ Author : Kojian
	 * 
	 * @ PAGE : auth/login.jsp
	 * 
	 * @ Parameter : user_id, user_password
	 * 
	 * @ Description : return to login result (success or fail)
	 * 
	 * @ DATE : 2020-03-02
	 */
	public usertableDTO login_action(String user_id, String user_password) {

		// setting DB Conncetion
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;

		// dto declare
		usertableDTO dto = new usertableDTO();

		ResultSet rs = null;

		try {
			con = dbcp.getConnection();

			sql = "select username, userid, userauth from usertable where userid= ? and userpw = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setString(2, user_password);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto.setUserName(rs.getString("username"));
				dto.setUserId(rs.getString("userid"));
				dto.setUserAuth(rs.getString("userauth"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbcp.close(con, pstmt, rs);
		}

		return dto;
	}
//	why not doesn't Here
	
	public usertableDTO farmSelect(String ID) throws NullPointerException, SQLException {

	      Connection con = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      String sql = null;

	      usertableDTO bean = new usertableDTO();

	      try {
	         con = dbcp.getConnection();

	         // sql query declare
	         sql = "select farmid from usertable where userid='sysadmin'";
	         pstmt = con.prepareStatement(sql);
	         
	         // 1, user ,select farmid from usertable where userid=user;
//	         pstmt.setString(1, ID);
	         rs = pstmt.executeQuery();
	         if (rs.next()) {
	            bean.setFarmId(rs.getString("farmid"));
	        
	      
	         }

	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         dbcp.close(con, pstmt, rs);
	      }

	      return bean;

	   }


	
	
	
	
	/*
	 * @ Author : Kim Sung hyun
	 * 
	 * @ PAGE : user/userinfo.jsp
	 * 
	 * @ Parameter : user_id
	 * 
	 * @ Description : return to farmid and usertel and username 
	 * 
	 * @ DATE : 2020-03-03
	 */

	public usertableDTO getuser(String user_ID) {

		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;

		usertableDTO dto = new usertableDTO();

		ResultSet rs = null;

		try {
			con = dbcp.getConnection();

			sql = "select farmid, userid, userpw, usertel, username, userauth from usertable where userid = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_ID);
			rs = pstmt.executeQuery();

			if (rs.next()) {

				if (rs.getString("farmid") == null) {
					dto.setUserId(rs.getString("userid"));
					dto.setUserPw(rs.getString("userpw"));
					dto.setUserName(rs.getString("username"));
					dto.setFarmId("");
					dto.setUserTel(rs.getString("usertel"));
					dto.setUserAuth(rs.getString("userauth"));

				} else {
					dto.setUserId(rs.getString("userid"));
					dto.setUserPw(rs.getString("userpw"));
					dto.setUserName(rs.getString("username"));
					dto.setFarmId(rs.getString("farmid"));
					dto.setUserTel(rs.getString("usertel"));
					dto.setUserAuth(rs.getString("userauth"));

				}

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbcp.close(con, pstmt, rs);
		}

		return dto;
	}

	/*
	 * @ Author : Kojian
	 * 
	 * @ PAGE : main/index.jsp
	 * 
	 * @ Parameter : user_auth
	 * 
	 * @ Description : return to (user_name and user_id)
	 * 
	 * @ DATE : 2020-03-03
	 */

	public ArrayList<usertableDTO> select_user(String user_auth) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = null;

		ArrayList<usertableDTO> bean = new ArrayList<usertableDTO>();

		try {
			con = dbcp.getConnection();

			// 전체 관리자일 떄 조회 기능
			if (user_auth.equals("sysadmin")) {
				sql = "select username ,userid from usertable where userauth = 'admin'";

				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					usertableDTO temp_bean = new usertableDTO();
					temp_bean.setUserName(rs.getString("USERNAME"));
					temp_bean.setUserId(rs.getString("USERID"));
					bean.add(temp_bean);
				}

				// 일반 관리자일 떄 조회 기능
			} else if (user_auth.equals("admin")) {

			} else if (user_auth.equals("user")) {

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbcp.close(con, pstmt, rs);
		}

		return bean;
	}

	/*
	 * @ Author : sunghyun
	 * 
	 * @ PAGE : userInfo.jsp
	 * 
	 * @ Parameter : user_auth
	 * 
	 * @ Description : return to (user_name and user_id)
	 * 
	 * @ DATE : 2020-03-03
	 */

	public ArrayList<usertableDTO> select_(String user_auth) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = null;

		ArrayList<usertableDTO> bean = new ArrayList<usertableDTO>();

		try {
			con = dbcp.getConnection();

			// 전체 관리자일 떄 조회 기능
			if (user_auth.equals("sysadmin")) {
				sql = "select username ,userid from usertable where userauth = 'admin' or userauth = 'user' ";

				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					usertableDTO temp_bean = new usertableDTO();
					temp_bean.setUserName(rs.getString("USERNAME"));
					temp_bean.setUserId(rs.getString("USERID"));
					bean.add(temp_bean);
				}

				// 일반 관리자일 떄 조회 기능
			} else if (user_auth.equals("admin")) {

			} else if (user_auth.equals("user")) {

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbcp.close(con, pstmt, rs);
		}

		return bean;
	}
	/*
	 * @ Author : Kim Sung Hyun
	 * 
	 * @ PAGE : user/userInsertPrc.jsp
	 * 
	 * @ Parameter : usertable DTO
	 * 
	 * @ Description : user
	 * 
	 * @ DATE : 2020-03-02
	 */

	/**************************************
	 * @name userInsert()
	 * @author 김성현
	 * @param usertableDTO bean
	 * @return void
	 * @remark 사용자 추가 , 사용처 - userInsertPrc.jsp
	 **************************************/
	// 사용자 정보 추가 용도
	public void userInsert(usertableDTO bean) throws NullPointerException, SQLException {
		// DB 연결에 필요한 변수
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;

		try {

			con = dbcp.getConnection();

			sql = "insert into usertable values(?,?,?,?,?,?,sysdate,?,sysdate,?)";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getUserId());
			pstmt.setString(2, bean.getUserPw());
			pstmt.setString(3, bean.getUserName());
			pstmt.setString(4, bean.getUserTel());
			pstmt.setString(5, bean.getUserAuth());
			pstmt.setString(6, bean.getFarmId());
			pstmt.setString(7, bean.getUserAuth());
			pstmt.setString(8, bean.getUserAuth());

			// executeUpdate() - select 구문 제외 수행 int 값 반환
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbcp.close(con, pstmt, null);
		}
	}

	/**************************************
	 * @name updateMember()
	 * @author 김성현
	 * @param usertableDTO bean
	 * @return void
	 * @throws SQLException
	 * @remark 사용자 정보 수정, 사용처 - updatePrc.jsp
	 **************************************/

	// 회원정보 수정하기
	public void updateMember(usertableDTO bean) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;

		try {
			con = dbcp.getConnection();
			// sql문 작성(수정문)
			sql = "update usertable set username=?, usertel = ?, userpw = ? where userid= ?";

			System.out.println("updateData");
			System.out.println(bean.getUserName());
			System.out.println(bean.getUserTel());
			System.out.println(bean.getUserId());
			System.out.println(bean.getUserPw());
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getUserName()); // userDTO에 저장된 사용자 이름
			pstmt.setString(2, bean.getUserTel()); // userDTO에 저장된 사용자 전화번호
			pstmt.setString(3, bean.getUserPw()); // userDTO에 저장된 사용자 pw
			pstmt.setString(4, bean.getUserId()); // userDTO에 저장된 사용자 id
			pstmt.executeQuery();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			con.setAutoCommit(true);
			dbcp.close(con, pstmt, null);
		}
	}
	

	/**************************************
	 * @name updatePw()
	 * @author 김성현
	 * @param usertableDTO bean
	 * @return void
	 * @throws SQLException
	 * @remark 사용자 정보 수정, 사용처 - updatePrc.jsp
	 **************************************/

	// 회원정보 수정하기
	public void updatePw(usertableDTO dto) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;

		try {
			con = dbcp.getConnection();
			// sql문 작성(수정문)
			sql = "update usertable set userPW = ? where userid= ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getUserPw()); // userDTO에 저장된 사용자 비밀번호
			pstmt.setString(2, dto.getUserId()); // userDTO에 저장된 사용자 id
			pstmt.executeQuery();
			con.commit();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			con.setAutoCommit(true);
			dbcp.close(con, pstmt, null);
		}
	}

	/**************************************
	 * @name getMb()
	 * @author 김성현
	 * @param id -
	 * @return Bean
	 * @remark 사용자 상세정보를 가져와 화면에 보여줌, 사용처 - userInfo.jsp
	 **************************************/

	// 회원 상세조회
	public usertableDTO getMb(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;

		// 반환 받을 Bean선언
		usertableDTO bean = new usertableDTO();

		try {
			con = dbcp.getConnection();

			// bean에 저장할 date조회
			sql = "select * from usertable where userid = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id); // 매개변수로 들어온 id
			rs = pstmt.executeQuery();

			// 해당ID 유저의 정보 가지고 오기
			if (rs.next()) {
				bean.setUserId(rs.getString("userid")); // DB에 저장되어 있는 userID정보를 Bean저장
				bean.setUserPw(rs.getString("userpw")); // DB에 저장되어 있는 userPW정보를 Bean저장
				bean.setUserName(rs.getString("username")); // DB에 저장되어 있는 userName정보를 Bean저장
				bean.setUserTel(rs.getString("usertel")); // DB에 저장되어 있는 userTel정보를 Bean저장
				bean.setUserAuth(rs.getString("userauth")); // DB에 저장되어 있는 userAuth정보를 Bean저장
				bean.setFarmId(rs.getString("farmid")); // DB에 저장되어 있는 farmId정보를 Bean저장
				bean.setRegDate(rs.getString("regdate")); // DB에 저장되어 있는 regDate정보를 Bean저장
				bean.setRegId(rs.getString("regid")); // DB에 저장되어 있는 regId정보를 Bean저장
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbcp.close(con, pstmt, rs);
		}

		return bean;
	}

	/**************************************
	 * @name userIDCheck()
	 * @author 김성현
	 * @param String ID
	 * @return boolean flag
	 * @remark 아이디 중복확인 , 사용처 - userIDCheck.jsp
	 **************************************/

	public boolean userIDCheck(String ID) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;

		boolean flag = true;

		try {
			con = dbcp.getConnection();

			sql = "select * from usertable where userID = ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ID);

			// executeQuery() - select 문 수행 resultset 객체 값 반환
			rs = pstmt.executeQuery();

			if (rs.next()) {
				flag = false;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbcp.close(con, pstmt, rs);
		}

		return flag;
	}

	/**************************************
	 * @name getFarm()
	 * @author 김성현
	 * @param
	 * @return vlist
	 * @remark 사용자 정보 창에서 양식장리스트를 보여줌, 사용처 - userInfo.jsp
	 **************************************/
	public ArrayList<usertableDTO> getFarm() {
		DBCon cdd = new DBCon();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;

		// 반환 받을 ArrayList
		ArrayList<usertableDTO> vlist = new ArrayList<usertableDTO>();

		try {
			// DB접속
			con = cdd.getConnection();

			sql = "select * from usertable";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			// 열에 id/이름 저장후 list에 더해준 후 다음열로 이동
			while (rs.next()) {
				usertableDTO bean = new usertableDTO();
				bean.setFarmId(rs.getString("farmid")); // DB에 저장되어 있는 farmid정보를 Bean저장

				vlist.add(bean); // return ArrayList에 추가
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			cdd.close(con, pstmt, rs);
		}

		return vlist;
	}

	/**************************************
	 * @name delFarm()
	 * @author 김성현
	 * @param String fid(farmid), String id(userid)
	 * @return
	 * @remark 사용자 정보에서 양식장정보를 삭제, 사용처 - userFarmDeletePrc.jsp
	 **************************************/
	public void delFarm(String fid, String id) {
		DBCon cdd = new DBCon();
		Connection con = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstm = null;
		String sql = null; // select 문
		String sqll = null; // update 문
		String farmlist = null;
		String farmNewList = "";
		ResultSet rs = null;

		try {
			con = cdd.getConnection();
			sql = "select farmid from usertable where userid=? ";

			pstm = con.prepareStatement(sql);
			pstm.setString(1, id);
			rs = pstm.executeQuery();

			while (rs.next()) {
				farmlist = rs.getString("farmid");
			}

			usertableDTO dto = new usertableDTO();

			// farmid 숫자별로 배열 삽입
			String ar[] = farmlist.split(",");

			if (ar.length == 1) {
				dto.setFarmId(farmlist);
				sqll = "update usertable set farmid=? where userid = ?";
				pstmt = con.prepareStatement(sqll);
				pstmt.setString(1, null);
				pstmt.setString(2, id);
				pstmt.executeUpdate();
			}

			// farmid 맞는 것 맞춘 후 farmNewList 배열에 삽입
			for (int i = 0; i < ar.length; i++) {
				if (!ar[i].contains(fid)) {
					farmNewList += ar[i].concat(",");
				}
			}

			// 문자열 뒤에 , 지워주는 역활
			String str = farmNewList.substring(0, farmNewList.length() - 1);

			dto.setFarmId(str);
			sqll = "update usertable set farmid=? where userid = ?";
			pstmt = con.prepareStatement(sqll);
			pstmt.setString(1, dto.getFarmId());
			pstmt.setString(2, id);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			cdd.close(con, pstmt, null);
		}
	}

	/**************************************
	 * @name sysdelFarm()
	 * @author 김성현
	 * @param String fid(farmid)
	 * @return
	 * @remark 전체 관리자가 양식장 삭제, 사용처 - userFarmDeletePrc.jsp
	 **************************************/
	public void sysdelFarm(String fid) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;

		try {
			con = DBCon.getConnection();
			sql = "delete from farm where farmid=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, fid);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBCon.close(con, pstmt, rs);
		}
	}

	/**************************************
	 * @name getFarmlist()
	 * @author 김성현
	 * @param id -
	 * @return Bean
	 * @remark 양식장 이름, 주소, id 출력 - userInfo.jsp
	 **************************************/

	public ArrayList<farmDTO> getFarmlist() {
		DBCon cdd = new DBCon();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		String farmlst = null;

		ArrayList<farmDTO> list = new ArrayList<farmDTO>();

		try {

			con = DBCon.getConnection();

			sql = "select farmid, farmname, address from farm";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				farmDTO bean = new farmDTO();
				bean.setFarmId(rs.getInt("farmid"));

				bean.setFarmName(rs.getString("FARMNAME"));

				bean.setAddress(rs.getString("address"));
				list.add(bean);

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBCon.close(con, pstmt, rs);
		}

		return list;
	}

	/***********************************
	 *
	 * @name sysuserselect
	 * @author 김수아
	 * @param userauth(String)
	 * @return userlist
	 * @remark 전체 관리자일 경우 사용자 목록 출력 사용처-userManagement.jsp
	 ***********************************/
	// 조건에 따라 양식장 조회하기(검색)
	public ArrayList<usertableDTO> sysuserselect(String userauth) throws NullPointerException, SQLException {

		ArrayList<usertableDTO> userlist = new ArrayList<usertableDTO>();
		Connection con = dbcp.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";

		try {

			String sql1 = "select USERID, USERPW , USERNAME ,nvl(usertel, 'X') as usertel, USERAUTH"
					+ "     , decode(userauth, 'sysadmin', '전체관리자', 'admin', '일반관리자', 'user', '사용자', '') as authname"
					+ "     , nvl(farmid, 'X') as farmid"
					+ "     , to_char(REGDATE, 'yyyy/mm/dd hh24:mi:ss') as REGDATE, REGID"
					+ "     , LASTUPTDATE, LASTUPTID"
					+ "  from usertable where Not userauth In ('sysadmin') ";

			pstmt = con.prepareStatement(sql1);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				usertableDTO vo = new usertableDTO();
				vo.setUserId(rs.getString("userid"));
				vo.setUserPw(rs.getString("userpw"));
				vo.setUserName(rs.getString("username"));
				vo.setUserTel(rs.getString("usertel"));
				vo.setUserAuth(rs.getString("authname"));
				vo.setFarmId(rs.getString("farmid"));

				vo.setRegDate(rs.getString("regdate"));
				userlist.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbcp.close(con, pstmt, rs);
		}
		return userlist;
	}

	
	
	
	
	
	
	
	
	
	
	
	/***********************************
	 *
	 * @name adminuserselect
	 * @author 김성현
	 * @param farmid(String)
	 * @return farmlist
	 * @remark farmid를 farmname으로 수정-userManagement.jsp
	 ***********************************/
	// 조건에 따라 양식장 조회하기(검색)
	public ArrayList<farmDTO> changename(String farmid) throws NullPointerException, SQLException {
		ArrayList<farmDTO> farmlist = new ArrayList<farmDTO>();
		Connection con = dbcp.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
	    
	    String farmName= null;
		
		try {
			String[] farmSplit = farmid.split(",");

			for(int i=0; i<farmSplit.length; i++) {				
			
				// farmid을 farmName로 바꾸는 작업
				String sql1 = "select farmname from farm where farmid = ?";
			    pstmt= con.prepareStatement(sql1);
	    
			    pstmt.setString(1, farmSplit[i]);
			    rs = pstmt.executeQuery();

			    if(rs.next()) {	
			    	farmDTO dto = new farmDTO();
			    	dto.setFarmName(rs.getString("farmname"));
			    	farmlist.add(dto);
			    }
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbcp.close(con, pstmt, rs);
		}
		return farmlist;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	/***********************************
	 *
	 * @name adminuserselect
	 * @author 김수아
	 * @param userauth(String)
	 * @return userlist
	 * @remark 일반 관리자일 경우 사용자 목록 출력 사용처-userManagement.jsp
	 ***********************************/
	// 조건에 따라 양식장 조회하기(검색)
	public ArrayList<usertableDTO> adminuserselect(String userauth) throws NullPointerException, SQLException {

		ArrayList<usertableDTO> userlist = new ArrayList<usertableDTO>();
		Connection con = dbcp.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";

		try {
			/* 사용자가 가지고 있는 farmid만 출력되게하는 부분 */
			/* String sql1 = "로그인한 user의 farmid를 받아와서 "; */

			String sql2 = " select USERID" + "     , USERPW" + "     , USERNAME" + "     ,nvl(usertel, 'X') as usertel"
					+ "     , USERAUTH"
					+ "     , decode(userauth, 'sysadmin', '전체관리자', 'admin', '일반관리자', 'user', '사용자', '') as authname"
					+ "     , nvl(farmid, 'X') as farmid"
					+ "     , to_char(REGDATE, 'yyyy/mm/dd hh24:mi:ss') as REGDATE " + "     , REGID"
					+ "     , LASTUPTDATE" + "     , LASTUPTID"
					+ "  from usertable where Not userauth In ('admin', 'sysadmin')";

			pstmt = con.prepareStatement(sql2);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				usertableDTO vo = new usertableDTO();

				vo.setUserId(rs.getString("userid"));

				vo.setUserPw(rs.getString("userpw"));

				vo.setUserName(rs.getString("username"));

				vo.setUserTel(rs.getString("usertel"));

				vo.setUserAuth(rs.getString("authname"));

				vo.setFarmId(rs.getString("farmid"));

				vo.setRegDate(rs.getString("regdate"));
				userlist.add(vo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbcp.close(con, pstmt, rs);
		}
		return userlist;
	}

	/**************************************
	 * @name usertableDelete()
	 * @author 장해리
	 * @param userID, userAuth
	 * @return void
	 * @throws SQLException 
	 * @throws NullPointerException 
	 * @remark 사용자 관련 정보들 삭제, 사용처 - user/userDeletePrc.jsp
	 **************************************/
	public void usertableDelete(String userID) throws NullPointerException, SQLException {
		// DB 연결에 필요한 변수
		Connection con = dbcp.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql1 = " delete from usertable where userid = ? ";
			pstmt = con.prepareStatement(sql1);
			pstmt.setString(1, userID); // 매개변수로 받은 ID
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbcp.close(con, pstmt, rs);
		}
	}

	/***********************************
	 * @name usertableSearch
	 * @author Hwang Seon Ju
	 * @param - ID, searchuser, searchuserinput
	 * @return ArrayList
	 * @remark 담당자 조회하기, 사용처 - farmwtUserForm.jsp
	 ***********************************/

	public ArrayList<usertableDTO> usertableSearch(String farmid, String searchuser, String searchuserinput)
			throws NullPointerException, SQLException {

		Connection con = DBCon.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql2 = null;
		ArrayList<usertableDTO> userlist = new ArrayList();
		
		try {
			sql2 = "select userid, username from usertable where farmid like '%' ||?|| '%'";
			
	        if (searchuserinput != null && !searchuserinput.equals("") && searchuser != null
	              && !searchuser.equals("null")) {
	        	
	        	if(searchuser.equals("userid")) {
	        		sql2 += "and userid LIKE '%' ||?|| '%' order by username";
	        	}else {
	        		sql2 += "and username LIKE '%' ||?|| '%' order by username";	
	        	}
	        }
	        
			pstmt = con.prepareStatement(sql2);
			pstmt.setString(1, farmid);
			
			if(searchuserinput != null && !searchuserinput.equals("") && searchuser != null
	              && !searchuser.equals("null")) {
			pstmt.setString(2, searchuserinput);
			}
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				usertableDTO vo = new usertableDTO();
				vo.setUserId(rs.getString("userid"));
				vo.setUserName(rs.getString("username"));
				userlist.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBCon.close(con, pstmt, rs);
		}
		return userlist;
	}

	/***********************************
	 * @name usertableSelect
	 * @author Hwang Seon Ju
	 * @param - userid
	 * @return ArrayList
	 * @remark 선택한 담당자 양식장 정보 수정 폼에 data 불러오기, 사용처 - farmwt
	 ***********************************/

	public ArrayList<usertableDTO> usertableSelect(String userid) throws NullPointerException, SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		ArrayList<usertableDTO> userAddlist = new ArrayList<usertableDTO>();

		try {
			con = DBCon.getConnection();
			sql = "select userid from usertable where userid=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userid);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				usertableDTO vo = new usertableDTO();
				vo.setUserId(rs.getString("userid"));
				userAddlist.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBCon.close(con, pstmt, rs);
		}

		return userAddlist;
	}
}
