<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page import="com.marimba.service.*" %>
<%
String email=request.getParameter("email");
out.println("email id is: "+email);
ForgetPasswordService service=new ForgetPasswordService();
boolean present=service.emailStatus(email);
if(present)
{
  session.setAttribute("email",email);
  response.sendRedirect("recover-password.jsp");
}
else
{
   session.setAttribute("present_email","fail");
   response.sendRedirect("forgot-password.jsp");
}
%>