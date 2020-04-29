package com.marimba.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.marimba.util.ConnectionProvider;

public class HomeDao {
   private Connection con=null;
   private PreparedStatement ps=null;
   public int getDayEffort(String date,int userId)
   {
	   con=ConnectionProvider.getConnection();
	   int dailyEffort=0;
	   try {
		ps=con.prepareStatement("select sum(hour) from [marimba_tfs].[dbo].[usertask] where userId=? and date =?");
		ps.setInt(1, userId);
		ps.setString(2, date);
		ResultSet rs=ps.executeQuery();
	   if(rs.next())
	   {
		   dailyEffort=rs.getInt(1);
	   }
		
	} catch (SQLException e) {
		e.printStackTrace();
	}
	   return dailyEffort;
   }
   public int getMonthlyEffort(String date,int userId)
   {
	   String dt=date.substring(0, 7);
	   int monthlyEffort = 0;
	   con=ConnectionProvider.getConnection();
	   try {
		ps=con.prepareStatement("select sum(hour) from [marimba_tfs].[dbo].[usertask] where userId=? and date like ?");
		ps.setInt(1, userId);
		ps.setString(2, "%"+dt+"%");
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			monthlyEffort=rs.getInt(1);
		}
	   	} catch (SQLException e) {
	   		e.printStackTrace();
	   	}
	   return monthlyEffort;
   }
   public int getWeeklyEffort(int userId)
   {
	   con=ConnectionProvider.getConnection();
	   int weekEffort=0;
	   try {
		ps=con.prepareStatement("SELECT SUM(hour) FROM [marimba_tfs].[dbo].[usertask] WHERE (date >= DATEADD(day, 0 - DATEPART(dw, GETDATE()), CONVERT(date, GETDATE()))) AND (date < DATEADD(day, 7 - DATEPART(dw, GETDATE()), CONVERT(date, GETDATE()))) AND userid=?");
		ps.setInt(1, userId);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			weekEffort=rs.getInt(1);
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	   return weekEffort;
   }
   public Map<Integer,Integer>getGraphWeekData(String date,int userId)
   { 
	   Map<Integer,Integer>map=new HashMap<>();
	   int count=1;
	   String st[]=date.split("/");
	   int month=Integer.parseInt(st[1]);
	   con=ConnectionProvider.getConnection();
	   try {
		ps=con.prepareStatement("select sum(hour) from [marimba_tfs].[dbo].[usertask] where DATEPART(MONTH,date)=? and userid=? GROUP BY DATEPART(WK,date)");
	    ps.setInt(1, month);
	    ps.setInt(2, userId);
	    ResultSet rs=ps.executeQuery();
	    while(rs.next())
	    {
	    	map.put(count,rs.getInt(1));
	        count++;
	    }
	   } catch (SQLException e) {
		e.printStackTrace();
	}
	   return map;
   }
   public Map<Integer,Integer>getGraphMonthData(int userId)
   {
	   Map<Integer,Integer>map=new HashMap<>();
	   con=ConnectionProvider.getConnection();
	   try {
		ps=con.prepareStatement("select MONTH(date)as Month,sum(hour)as Task from [marimba_tfs].[dbo].[usertask] where userid=? group by MONTH(date) order by Month(date)");
		ps.setInt(1, userId);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			map.put(rs.getInt(1), rs.getInt(2));
		}
	   } catch (SQLException e) {
		e.printStackTrace();
	}
	   return map;
   }
}
