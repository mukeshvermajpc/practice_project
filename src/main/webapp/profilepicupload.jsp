<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>
<%@ page import="org.apache.commons.io.output.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		File file;
		int maxFileSize = 5000 * 1024;
		int maxMemSize = 5000 * 1024;
		//String filePath = "D:\\profile\\";
		String contentType = request.getContentType();
		ServletContext context = pageContext.getServletContext();
		   String filePath = context.getInitParameter("upload_profile");
		   String pt=request.getPathInfo();
		   System.out.println("request path information "+pt);
		   if ((contentType.indexOf("multipart/form-data") >= 0)) {
			DiskFileItemFactory factory = new DiskFileItemFactory();
			System.out.println("factory path"+factory);
			factory.setSizeThreshold(maxMemSize);
			factory.setRepository(new File("C:\\Temp\\"));
			ServletFileUpload upload = new ServletFileUpload(factory);
			upload.setSizeMax(maxFileSize);
			try {
				List fileItems = upload.parseRequest(request);
				Iterator i = fileItems.iterator();
				out.println("<html>");
				out.println("<body>");
				while (i.hasNext()) {
					FileItem fi = (FileItem) i.next();
					System.out.println(fi);
					if (!fi.isFormField()) {
						String fieldName = fi.getFieldName();
						String fileName = fi.getName();
						boolean isInMemory = fi.isInMemory();
						long sizeInBytes = fi.getSize();
						System.out.println(fieldName);
						System.out.println(fileName);
						String name=(String)session.getAttribute("name");
						name=name.replaceAll(" ", "");
						String path=filePath +name+".jpg";
						file = new File(path);
						fi.write(file);
						session.setAttribute("path", path);
						out.println("Uploaded Filename: " + filePath + fileName + "<br>");
					}
				}
				out.println("</body>");
				out.println("</html>");
				session.setAttribute("msg","success");
				response.sendRedirect("home.jsp");
			} catch (Exception ex) {
				System.out.println(ex);
			}
		} else {
			session.setAttribute("msg","fail");
			response.sendRedirect("home.jsp");
		}
	%>
</body>
</html>