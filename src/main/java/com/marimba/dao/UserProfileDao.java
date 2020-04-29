package com.marimba.dao;
import com.marimba.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.marimba.bean.*;
import com.marimba.util.ConnectionProvider;
public class UserProfileDao {
	Connection con=null;
	PreparedStatement ps=null;
    public User getUser(int userId)
    {
    	con=ConnectionProvider.getConnection();
    	User user=new User();
    	try {
			ps=con.prepareStatement("select *from [marimba_tfs].[dbo].[user] where userid=?");
		    ps.setInt(1, userId);
		    ResultSet rs=ps.executeQuery();
		    if(rs.next())
		    {
		    	
		    	user.setId(rs.getInt(1));
		    	user.setName(rs.getString(2));
		    	user.setEmail(rs.getString(3));
		    	user.setUserType(rs.getString(5));
		    	user.setTeam(rs.getString(6));
		    }
    	} catch (SQLException e) {
			e.printStackTrace();
		}
    	return user;
    }
    public int userProfileUpdate(User user)
    {
    	con=ConnectionProvider.getConnection();
    	int status = 0;
    	try {
			ps=con.prepareStatement("update [marimba_tfs].[dbo].[user] set name=?,email=?,team=? where userid=?");
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getTeam());
			ps.setInt(4, user.getId());
			status=ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	return status;
    }
}
