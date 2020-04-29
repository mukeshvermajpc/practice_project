<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="com.marimba.service.*" %>
<%
  String email=request.getParameter("email");
  String pwd=request.getParameter("password");
  String cnfPwd=request.getParameter("confirmpassword");
    if(pwd.equals(cnfPwd))
    {
    	ForgetPasswordService service=new ForgetPasswordService();
    	int status=service.updatePassword(email.trim(), pwd.trim());
    	if(status>0)
    	{
    		session.setAttribute("updatePassword","success");
    		response.sendRedirect("index.jsp");
    	}
    	else{
    		session.setAttribute("updatePassowr","fail");
    		response.sendRedirect("forget-password.jsp");
    	}
    }
    
%>