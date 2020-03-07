package util;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class DBtest {

	DBCon cd = new DBCon();

	public void dbconnection() throws NullPointerException, SQLException {

		// DB 연결에 필요한 변수
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;

		try {
			con = cd.getConnection();
						
			sql = "select * from book";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				System.out.println(rs.getString(2));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NullPointerException e) {
			e.printStackTrace();
		}

	}
}
