package com.marimba.service;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import com.marimba.dao.MissingEffortDateDao;
public class MissingEffortDateService {
       public List<java.util.Date>getMissingDate(int userid,java.sql.Date date)
       {
    	   MissingEffortDateDao dao=new MissingEffortDateDao();
    	   List<java.util.Date>lst=new ArrayList<>();
    	   List<java.util.Date>list=dao.getMissingEffortDate(userid,date);
    	   for(java.util.Date dt:list)
    	   {
    		   int day=dt.getDay();
    		   if(day==0||day==6)
    		   {
    			   continue;
    		   }
    		   else {
    			   lst.add(dt);
    		   }
    	   }
    	   return lst;
       }
}
