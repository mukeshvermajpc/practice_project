<%@page import="com.marimba.service.*" %>
<%@page import="com.marimba.bean.*" %>
<%@page import="java.util.*" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.marimba.dao.*" %>
<%@page import="com.marimba.bean.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
   <% 
   int empId=(Integer)session.getAttribute("Id");
   out.println("Employee id is: "+empId);
   Date date = new Date();  
   SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");  
   String strDate= formatter.format(date);
   java.sql.Date dt=new java.sql.Date(date.getTime());
   String st[]=strDate.split("/");
   Random random=new Random();
   List<Task>list=new ArrayList<>();
   for(int i=0;i<10;i++)
   {
	   Task taskObj=new Task();
	   String task=request.getParameter("dynamic_form[dynamic_form]["+i+"][usertask]");
	   String hour=request.getParameter("dynamic_form[dynamic_form]["+i+"][hour]");
	   String description=request.getParameter("dynamic_form[dynamic_form]["+i+"][description]");
	   if(task==null ||hour==null)
	   {
		   break;
	   }
	   else
	   {
		int x=random.nextInt(900)+100;
		int taskId=Integer.parseInt(st[0]+x);
		taskObj.setTaskId(taskId);
	    taskObj.setTaskName(task);
	    taskObj.setHour(Double.parseDouble(hour));
	    taskObj.setDescription(description);
	    taskObj.setDate(dt.toString());
	    taskObj.setEmployeeId(empId);
	    list.add(taskObj);
	   }
   }
     out.println("size of list is:"+list.size()+"<br>");
     TaskDao dao=new TaskDao();
      int status[]=dao.addTask(list);
		 boolean insertStatus=true;
		for(int n:status){ if(n==0)insertStatus=false;break;}
		if(insertStatus){session.setAttribute("status", "success");}
		else{session.setAttribute("status", "fail");}
		response.sendRedirect("addtask.jsp");
     %>
</body>
</html>