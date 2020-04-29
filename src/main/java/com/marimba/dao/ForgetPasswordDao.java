package com.marimba.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.marimba.util.ConnectionProvider;

public class ForgetPasswordDao {
    Connection con=null;
    PreparedStatement ps=null;
	public boolean checkEmailId(String email)
     {
		boolean present=false; 
    	try {
    		con=ConnectionProvider.getConnection();
			ps=con.prepareStatement("select * from [marimba_tfs].[dbo].[user] where email=?");
		    ps.setString(1, email);
		    ResultSet rs=ps.executeQuery();
		    if(rs.next()) {present=true;}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	 return present;
     }
	public int updatePassword(String emailId,String password)
	{
		System.out.println("email id is:"+emailId);
		System.out.println("password is:"+password);
		String sqlUpdate = "UPDATE [marimba_tfs].[dbo].[user] "
                + "SET password = ? "
                + "WHERE email = ?";
		con=ConnectionProvider.getConnection();
		int status=0;
		try {
			ps=con.prepareStatement(sqlUpdate);
			ps.setString(1, password);
			ps.setString(2, emailId);
		    status=ps.executeUpdate();
		    System.out.println("status1 is:"+status);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("after update status is: "+status);
		return status;
	}
	public static void main(String args[])
	{
		ForgetPasswordDao dao=new ForgetPasswordDao();
		String email="mukesh.kumar20@harman.com";
		String password="123456";
	    int status=dao.updatePassword(email, password);
	    System.out.println("status is: "+status);
	}
}
