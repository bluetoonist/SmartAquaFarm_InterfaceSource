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

			sql = "select farmid, userid, userpw, usertel, username from usertable where userid = ? ";
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

				} else {
					dto.setUserId(rs.getString("userid"));
					dto.setUserPw(rs.getString("userpw"));
					dto.setUserName(rs.getString("username"));
					dto.setFarmId(rs.getString("farmid"));
					dto.setUserTel(rs.getString("usertel"));

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

			// ��ü �������� �� ��ȸ ���
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

				// �Ϲ� �������� �� ��ȸ ���
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
	 * @author �輺��
	 * @param usertableDTO bean
	 * @return void
	 * @remark ����� �߰� , ���ó - userInsertPrc.jsp
	 **************************************/
	// ����� ���� �߰� �뵵
	public void userInsert(usertableDTO bean) throws NullPointerException, SQLException {
		// DB ���ῡ �ʿ��� ����
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

			// executeUpdate() - select ���� ���� ���� int �� ��ȯ
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbcp.close(con, pstmt, null);
		}
	}

	/**************************************
	 * @name updateMember()
	 * @author �輺��
	 * @param usertableDTO bean
	 * @return void
	 * @throws SQLException
	 * @remark ����� ���� ����, ���ó - updatePrc.jsp
	 **************************************/

	// ȸ������ �����ϱ�
	public void updateMember(usertableDTO bean) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;

		try {
			con = dbcp.getConnection();
			// sql�� �ۼ�(������)
			sql = "update usertable set username=?, usertel = ? where userid= ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getUserName()); // userDTO�� ����� ����� �̸�
			pstmt.setString(2, bean.getUserTel()); // userDTO�� ����� ����� ��ȭ��ȣ
			pstmt.setString(3, bean.getUserId()); // userDTO�� ����� ����� id
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
	 * @author �輺��
	 * @param usertableDTO bean
	 * @return void
	 * @throws SQLException
	 * @remark ����� ���� ����, ���ó - updatePrc.jsp
	 **************************************/

	// ȸ������ �����ϱ�
	public void updatePw(usertableDTO dto) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;

		try {
			con = dbcp.getConnection();
			// sql�� �ۼ�(������)
			sql = "update usertable set userPW = ? where userid= ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getUserPw()); // userDTO�� ����� ����� ��й�ȣ
			pstmt.setString(2, dto.getUserId()); // userDTO�� ����� ����� id
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
	 * @author �輺��
	 * @param id -
	 * @return Bean
	 * @remark ����� �������� ������ ȭ�鿡 ������, ���ó - userInfo.jsp
	 **************************************/

	// ȸ�� ����ȸ
	public usertableDTO getMb(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;

		// ��ȯ ���� Bean����
		usertableDTO bean = new usertableDTO();

		try {
			con = dbcp.getConnection();

			// bean�� ������ date��ȸ
			sql = "select * from usertable where userid = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id); // �Ű������� ���� id
			rs = pstmt.executeQuery();

			// �ش�ID ������ ���� ������ ����
			if (rs.next()) {
				bean.setUserId(rs.getString("userid")); // DB�� ����Ǿ� �ִ� userID������ Bean����
				bean.setUserPw(rs.getString("userpw")); // DB�� ����Ǿ� �ִ� userPW������ Bean����
				bean.setUserName(rs.getString("username")); // DB�� ����Ǿ� �ִ� userName������ Bean����
				bean.setUserTel(rs.getString("usertel")); // DB�� ����Ǿ� �ִ� userTel������ Bean����
				bean.setUserAuth(rs.getString("userauth")); // DB�� ����Ǿ� �ִ� userAuth������ Bean����
				bean.setFarmId(rs.getString("farmid")); // DB�� ����Ǿ� �ִ� farmId������ Bean����
				bean.setRegDate(rs.getString("regdate")); // DB�� ����Ǿ� �ִ� regDate������ Bean����
				bean.setRegId(rs.getString("regid")); // DB�� ����Ǿ� �ִ� regId������ Bean����
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
	 * @author �輺��
	 * @param String ID
	 * @return boolean flag
	 * @remark ���̵� �ߺ�Ȯ�� , ���ó - userIDCheck.jsp
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

			// executeQuery() - select �� ���� resultset ��ü �� ��ȯ
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
	 * @author �輺��
	 * @param
	 * @return vlist
	 * @remark ����� ���� â���� ����帮��Ʈ�� ������, ���ó - userInfo.jsp
	 **************************************/
	public ArrayList<usertableDTO> getFarm() {
		DBCon cdd = new DBCon();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;

		// ��ȯ ���� ArrayList
		ArrayList<usertableDTO> vlist = new ArrayList<usertableDTO>();

		try {
			// DB����
			con = cdd.getConnection();

			sql = "select * from usertable";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			// ���� id/�̸� ������ list�� ������ �� �������� �̵�
			while (rs.next()) {
				usertableDTO bean = new usertableDTO();
				bean.setFarmId(rs.getString("farmid")); // DB�� ����Ǿ� �ִ� farmid������ Bean����

				vlist.add(bean); // return ArrayList�� �߰�
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
	 * @author �輺��
	 * @param String fid(farmid), String id(userid)
	 * @return
	 * @remark ����� �������� ����������� ����, ���ó - userFarmDeletePrc.jsp
	 **************************************/
	public void delFarm(String fid, String id) {
		DBCon cdd = new DBCon();
		Connection con = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstm = null;
		String sql = null; // select ��
		String sqll = null; // update ��
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

			// farmid ���ں��� �迭 ����
			String ar[] = farmlist.split(",");

			if (ar.length == 1) {
				dto.setFarmId(farmlist);
				sqll = "update usertable set farmid=? where userid = ?";
				pstmt = con.prepareStatement(sqll);
				pstmt.setString(1, null);
				pstmt.setString(2, id);
				pstmt.executeUpdate();
			}

			// farmid �´� �� ���� �� farmNewList �迭�� ����
			for (int i = 0; i < ar.length; i++) {
				if (!ar[i].contains(fid)) {
					farmNewList += ar[i].concat(",");
				}
			}

			// ���ڿ� �ڿ� , �����ִ� ��Ȱ
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
	 * @author �輺��
	 * @param String fid(farmid)
	 * @return
	 * @remark ��ü �����ڰ� ����� ����, ���ó - userFarmDeletePrc.jsp
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
	 * @author �輺��
	 * @param id -
	 * @return Bean
	 * @remark ����� �̸�, �ּ�, id ��� - userInfo.jsp
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
	 * @author �����
	 * @param userauth(String)
	 * @return userlist
	 * @remark ��ü �������� ��� ����� ��� ��� ���ó-userManagement.jsp
	 ***********************************/
	// ���ǿ� ���� ����� ��ȸ�ϱ�(�˻�)
	public ArrayList<usertableDTO> sysuserselect(String userauth) throws NullPointerException, SQLException {

		ArrayList<usertableDTO> userlist = new ArrayList<usertableDTO>();
		Connection con = dbcp.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";

		try {

			String sql1 = "select USERID, USERPW , USERNAME ,nvl(usertel, 'X') as usertel, USERAUTH"
					+ "     , decode(userauth, 'sysadmin', '��ü������', 'admin', '�Ϲݰ�����', 'user', '�����', '') as authname"
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
	 * @author �輺��
	 * @param farmid(String)
	 * @return farmlist
	 * @remark farmid�� farmname���� ����-userManagement.jsp
	 ***********************************/
	// ���ǿ� ���� ����� ��ȸ�ϱ�(�˻�)
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
			
				// farmid�� farmName�� �ٲٴ� �۾�
				String sql1 = "select farmname from farm where farmid = ?";
			    pstmt= con.prepareStatement(sql1);
	    
			    pstmt.setString(1, farmSplit[i]);
			    rs = pstmt.executeQuery();

			    if(rs.next()) {	
			    	farmDTO dto = new farmDTO();
			    	farmName = rs.getString("farmname");
			    	System.out.println(farmName);
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
	 * @author �����
	 * @param userauth(String)
	 * @return userlist
	 * @remark �Ϲ� �������� ��� ����� ��� ��� ���ó-userManagement.jsp
	 ***********************************/
	// ���ǿ� ���� ����� ��ȸ�ϱ�(�˻�)
	public ArrayList<usertableDTO> adminuserselect(String userauth) throws NullPointerException, SQLException {

		ArrayList<usertableDTO> userlist = new ArrayList<usertableDTO>();
		Connection con = dbcp.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";

		try {
			/* ����ڰ� ������ �ִ� farmid�� ��µǰ��ϴ� �κ� */
			/* String sql1 = "�α����� user�� farmid�� �޾ƿͼ� "; */

			String sql2 = " select USERID" + "     , USERPW" + "     , USERNAME" + "     ,nvl(usertel, 'X') as usertel"
					+ "     , USERAUTH"
					+ "     , decode(userauth, 'sysadmin', '��ü������', 'admin', '�Ϲݰ�����', 'user', '�����', '') as authname"
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
	 * @author ���ظ�
	 * @param userID, userAuth
	 * @return void
	 * @remark ����� ���� ������ ����, ���ó - user/userDeletePrc.jsp
	 **************************************/
	public void usertableDelete(String userID, String userAuth, String farmID) {

		// DB ���ῡ �ʿ��� ����
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		// ����� ���̵� �������� ��� ������ farmSplit �迭�� ����
		String[] farmSplit = farmID.split(",");

		try {
			// DB����
			con = dbcp.getConnection();

			// ������ ������� ��å�� user�� ��� (�� ����ڸ� �����Ѵ�)
			if (userAuth.equals("�����")) {
				String sql1 = " delete from usertable where userid = ? ";
				pstmt = con.prepareStatement(sql1);
				pstmt.setString(1, userID); // �Ű������� ���� ID
				pstmt.executeUpdate();
			}

			// ������ ������� ��å�� admin�� ��� (admin�� ������ ����忡 ���� ��� ������ �����Ѵ�)
			if (userAuth.equals("�Ϲݰ�����")) {

				// ���õ� ������� ����� ����
				String sql2 = " delete from farm where userid = ? ";
				pstmt = con.prepareStatement(sql2);
				pstmt.setString(1, userID); // �Ű������� ���� ID
				pstmt.executeUpdate();

				// ���õ� ����� ����
				String sql3 = " delete from usertable where userid = ? ";
				pstmt = con.prepareStatement(sql3);
				pstmt.setString(1, userID); // �Ű������� ���� ID
				pstmt.executeUpdate();

				// userid�� �ƴ� farmid�� �������� ����ؾ� �ϴ� sql��
				for (int i = 0; i < farmSplit.length; i++) {
					/*
					 * // ������� ����� String sql4 = " select FARMID from farm where farmid = ? "; pstmt
					 * = con.prepareStatement(sql4); pstmt.setString(1, farmSplit[i]);
					 * pstmt.executeQuery();
					 */

					String sql4 = " delete from fish where farmid = ? ";
					pstmt = con.prepareStatement(sql4);
					pstmt.setString(1, farmSplit[i]);
					pstmt.executeQuery();

					// rec ���̺��� farmid�� ��ġ�� ���
					String sql5 = " delete from rec where farmid = ? ";
					pstmt = con.prepareStatement(sql5);
					pstmt.setString(1, farmSplit[i]);
					pstmt.executeQuery();

					// repair ���̺��� farmid�� ��ġ�� ���
					String sql6 = " delete from repair where farmid = ? ";
					pstmt = con.prepareStatement(sql6);
					pstmt.setString(1, farmSplit[i]);
					pstmt.executeQuery();

					// watertank ���̺��� farmid�� ��ġ�� ��� ����
					String sql7 = " delete from waterTank where farmid = ? ";
					pstmt = con.prepareStatement(sql7);
					pstmt.setString(1, farmSplit[i]);
					pstmt.executeQuery();

					// userTable ���̺��� farmid�� ��ġ�� ��� ����
					String sql8 = " delete from usertable where farmid = ? ";
					pstmt = con.prepareStatement(sql8);
					pstmt.setString(1, farmSplit[i]);
					pstmt.executeQuery();
				}
			}

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
	 * @remark ����� ��ȸ�ϱ�, ���ó - farmwtUserForm.jsp
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
	 * @remark ������ ����� ����� ���� ���� ���� data �ҷ�����, ���ó - farmwt
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
