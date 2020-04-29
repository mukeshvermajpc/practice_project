<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.marimba.service.*" %>
<%@page import="com.marimba.bean.*" %>
<jsp:useBean id="user" class="com.marimba.bean.User"></jsp:useBean>
<jsp:setProperty property="*" name="user"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Marimba Task Management System</title>
</head>
<body>
<% 
UserProfileService service=new UserProfileService();
int status=service.userProfileUpdateService(user);
if(status>0)	
{
	session.setAttribute("team", user.getTeam());
	session.setAttribute("update","success");
}
else
	session.setAttribute("update","fail");
response.sendRedirect("userprofile.jsp");

%>
</body>
</html>