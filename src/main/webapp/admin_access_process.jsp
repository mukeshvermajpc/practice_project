<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.marimba.service.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Marimba Task Management System</title>
</head>
<body>
<%
String id=request.getParameter("user");
String userType=request.getParameter("userType");
AdminAccessService service=new AdminAccessService();
int status=service.adminAccessService(Integer.parseInt(id), userType);
if(status>0)
	session.setAttribute("update","success");
else 
	session.setAttribute("update","fail");
response.sendRedirect("adminaccess.jsp");
%>
</body>
</html>