package com.marimba.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.marimba.util.ConnectionProvider;

public class MissingEffortDateDao {
    Connection conn=null;
    PreparedStatement ps=null;
	public List<Date>getMissingEffortDate(int userId,java.sql.Date date)
    {
    	conn=ConnectionProvider.getConnection();
        List<Date>list=new ArrayList<>();
        LocalDate localDate = date.toLocalDate();
        int month=localDate.getMonthValue();
    	int year=localDate.getYear();
    	String query="select distinct DATE from [marimba_tfs].[dbo].[Dates] dt where Date not in ( select distinct date from [marimba_tfs].[dbo].[usertask] where MONTH(date)=? and YEAR(date)=? and userid=?) and Month(date)=? and Year(date)=? and dt.Date<?";
    	try {
			ps=conn.prepareStatement(query);
			ps.setInt(1, month);
			ps.setInt(2, year);
			ps.setInt(3, userId);
			ps.setInt(4, month);
			ps.setInt(5, year);
			ps.setDate(6, date);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
	      list.add(rs.getDate(1));
		}
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	return list;
    }
}
