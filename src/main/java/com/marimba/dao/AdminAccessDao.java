package com.marimba.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.marimba.util.ConnectionProvider;

public class AdminAccessDao {
	Connection con=null;
    PreparedStatement ps=null;
	public int getAdminAccess(int userId,String userType)
    {
    	con=ConnectionProvider.getConnection();
    	int status=0;
    	try {
			ps=con.prepareStatement("update [marimba_tfs].[dbo].[user] set usertype=? where userid=?");
			ps.setString(1, userType);
			ps.setInt(2, userId);
			status=ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	return status;
    }
}
