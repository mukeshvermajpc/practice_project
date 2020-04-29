package com.marimba.dao;
import com.marimba.bean.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.marimba.util.ConnectionProvider;
public class UserDao {
	Connection con=ConnectionProvider.getConnection();
	PreparedStatement ps=null;
	public int userRegistration(User user)
   {
	   int status=0;
	  
	  if(user.getUserType()==null)
	  {
		  user.setUserType("User");
	  } 
	  try {
		PreparedStatement ps=con.prepareStatement("insert into [marimba_tfs].[dbo].[user] values(?,?,?,?,?,?)");
		ps.setInt(1,user.getId());
		ps.setString(2, user.getName());
		ps.setString(3, user.getEmail());
		ps.setString(4, user.getPassword());
		ps.setString(5, user.getUserType());
		ps.setString(6, user.getTeam());
	    status=ps.executeUpdate();
	  } catch (SQLException e) {
		e.printStackTrace();
	}
	 return status;
   }
   public User userLogin(UserLogin userLogin)
   {
	   User user =new User();
	   try {
		ps=con.prepareStatement("select * from [marimba_tfs].[dbo].[user] where email=? and password=?");
		ps.setString(1, userLogin.getEmail());
		ps.setString(2, userLogin.getPassword());
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			user.setId(rs.getInt("userid"));
			user.setName(rs.getString("name"));
			user.setEmail(rs.getString("email"));
			user.setUserType(rs.getString("userType"));
			user.setTeam(rs.getString("Team"));
		}	
	} catch (Exception e) {
		e.printStackTrace();
	}
	   return user;
   }
   public boolean alreadyRegister(int userId,String email)
   {
	
	   try {
		ps=con.prepareStatement("select *from [marimba_tfs].[dbo].[user] where userid=? or email=? ");
		ps.setInt(1, userId);
		ps.setString(2, email);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			return true;
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	   return false;
   }
}
