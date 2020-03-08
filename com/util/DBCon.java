
package util;

import java.sql.*;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBCon {

	public static Connection getConnection() throws SQLException, NullPointerException {
		try {

			Context inictx = new InitialContext();
			Context envctx = (Context) inictx.lookup("java:comp/env");
			DataSource ds = (DataSource) envctx.lookup("jdbc/saf");
			Connection con = ds.getConnection();
			con.setAutoCommit(true);
			return con;

		} catch (SQLException e) {
			System.out.println("aaa" + e);
			throw new NullPointerException();
		} catch (Exception e) {
			System.out.println(e);
			throw new NullPointerException();
		}
	}

	public static void close(Connection con, PreparedStatement psmt, ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (con != null) {
				con.close();
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
	}
}
