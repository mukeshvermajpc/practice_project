package com.marimba.util;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class ConnectionProvider {
	private static Connection con = null;
	public static Connection getConnection() {
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			con = DriverManager.getConnection("jdbc:sqlserver://HIPUNL54732:1433;databaseName=marimba_tfs","sa","1234@gcet");
		} catch (Exception exe) {
			exe.printStackTrace();
		}
		return con;
	}
}
