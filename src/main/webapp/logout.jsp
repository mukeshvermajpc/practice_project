<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Marimba TFS</title>
</head>
<body>
<p>You have been successfully logout</p>
<% session.invalidate(); 
   response.sendRedirect("index.jsp");
%>
</body>
</html>