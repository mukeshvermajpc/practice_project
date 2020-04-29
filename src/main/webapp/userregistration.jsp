<%@page import="com.marimba.dao.UserDao"%>
<%@page import="com.marimba.bean.User" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="user" class="com.marimba.bean.User"></jsp:useBean>
<jsp:setProperty property="*" name="user"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Marimba Task Tracker User Registration</title>
</head>
<body>
   <%
   	  UserDao obj=new UserDao();
      boolean already=obj.alreadyRegister(user.getId(),user.getEmail());
      if(!already)
      {
    	   int status=obj.userRegistration(user);
       	   if(status>0)
       	   {
       		session.setAttribute("new_registration","success");
        	response.sendRedirect("index.jsp");
       	   }
       	   else
       	   {
       		   session.setAttribute("registration_fail","fail");
       		   response.sendRedirect("register.jsp");
       	   }
      }
      else{
    	  session.setAttribute("status","already registered");
    	  response.sendRedirect("register.jsp");
      }
   %>
</body>
</html>