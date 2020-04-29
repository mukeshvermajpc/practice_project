<%@page import="com.marimba.bean.UserLogin"%>
<%@page import="com.marimba.dao.UserDao"%>
<%@page import="com.marimba.bean.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:useBean id="login" class="com.marimba.bean.UserLogin"></jsp:useBean>
<jsp:setProperty property="*" name="login" />
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Marimba Task Management System</title>
</head>
<body>
	<%
		UserDao dao = new UserDao();
		User us = dao.userLogin(login);
		System.out.println(us.getName());
		System.out.println(us.getEmail());
		if ((us.getName()!= null)&&(us.getUserType()!=null)) {
			out.println("user output is:");
			int id = us.getId();
			String name = us.getName();
			String email = us.getEmail();
			String userType = us.getUserType();
			String team=us.getTeam();
			session.setAttribute("Id", id);
			session.setAttribute("name", name);
			session.setAttribute("email", email);
			session.setAttribute("userType", userType);
			session.setAttribute("team", team);
			session.setAttribute("loggedIn",true);
			if (userType.equals("Admin")){
				response.sendRedirect("usermanager.jsp");
			}else {
				response.sendRedirect("home.jsp");
			}
		} else {
			session.setAttribute("login","fail");
			response.sendRedirect("index.jsp");
		}
	%>
</body>
</html>