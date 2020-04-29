package com.marimba.service;

import java.util.Map;
import java.util.StringJoiner;

import com.marimba.dao.HomeDao;

public class HomeService {
	 HomeDao dao=new HomeDao();
     public int getDailyEffort(int userId,String date)
     {
    	 int dailyEffort=dao.getDayEffort(date, userId);
    	 return dailyEffort;
     }
     public int getWeeklyEffort(int userId)
     {
    	 int weeklyEffort=dao.getWeeklyEffort(userId);
    	 return weeklyEffort;
     }
     public int getMonthlyEffort(String date,int userId)
     {
    	 int montlyEffort=dao.getMonthlyEffort(date, userId);
    	 return montlyEffort;
     }
     public String getWeeklyGraphData(String date,int userId)
     {
    	 StringJoiner sb = new StringJoiner(",", "[", "]");
    	 Map<Integer,Integer>map=dao.getGraphWeekData(date,userId);
    	 for(int i=1;i<=5;i++)
    	 {
    		 if(map.containsKey(i))
    		 {
    			sb.add(map.get(i).toString());
    		 }
    		 else
    		 {
    			 sb.add("0".toString());
    		 }
    	 }
    	 return sb.toString();
     }
    public String getMonthlyGraphData(int userId)
    {
    	 StringJoiner sb = new StringJoiner(",", "[", "]");
    	 Map<Integer,Integer>map=dao.getGraphMonthData(userId);
    	 for(int i=1;i<=12;i++)
    	 {
    		 if(map.containsKey(i))
    		 {
    			 sb.add(map.get(i).toString());
    		 }
    		 else
    		 {
    			 sb.add("0".toString());
    		 }
    	 }
    	return sb.toString();
    }
    public static void main(String[] args) {
		HomeDao dao=new HomeDao();
		System.out.println("this user monthly effort is:"+12345);
		System.out.println(dao.getGraphMonthData(22594));
		System.out.println("weekly effort is:"+dao.getGraphWeekData("2020/03/31", 12352));
	}
    
    
}
