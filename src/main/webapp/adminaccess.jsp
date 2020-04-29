<%
HttpSession status=request.getSession(false);
if(status==null || status.getAttribute("loggedIn") == null)
{
	 response.sendRedirect("index.jsp"); 
}
%>
<%@page import="com.marimba.service.*" %>
<%@page import="java.util.*" %>
<%@ page import="com.marimba.bean.*" %>>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Marimba Task Management System</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
  <!-- Select2 -->
   <link rel="stylesheet" href="plugins/select2/css/select2.min.css">
  <link rel="stylesheet" href="plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
  <link rel="stylesheet" href="plugins/bootstrap4-duallistbox/bootstrap-duallistbox.min.css">
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
      <jsp:include page="header.jsp" />
  </nav>
  <!-- /.navbar -->
  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <% String user = (String) session.getAttribute("userType");
		if((status!=null)&&(user!=null)){		
       if (user.equals("User")){%>
			<jsp:include page="sidebaruser.jsp" />
			<%} else {%>
			<jsp:include page="sidebarmanager.jsp" />
			<%}}%>
  </aside>
<% 
AdminHomeService service = new AdminHomeService();
List<User>list=service.getUsers();
request.setAttribute("list", list);
%>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Admin access form</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="user.jsp">Home</a></li>
              <li class="breadcrumb-item active">Usertask</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <!-- left column -->
          <div class="col-md-12">
            <!-- jquery validation -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Grant user access</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form role="form" id="quickForm" action="admin_access_process.jsp" method="POST">
                <div class="card-body">
                  <div class="row">
                  <div class="col-lg-2">
                  </div>
                  <div class="col-lg-3">
                    <b>Select user name</b>
                  </div>
                  <div class="col-lg-2">
                     <b>Access type</b>
                  </div>
                  </div>
                </div>
                <!-- /.card-body -->
	        <div class="form-group" id="dynamic_form">
                <div class="row">
                    <div class="col-lg-2">
                    </div>
	                <div class="col-lg-3">
					<select class="form-control" id="user" name="user">
					       <c:forEach items="${list}" var="u">
					       <option value="${u.getId()}">${u.getName()}</option>
					       </c:forEach>
					</select>
	                </div>
	                <div class="col-lg-2">
	                <select class="form-control" id="userType" name="userType">
					       <option value="Admin">Admin</option>
					       <option value="User">User</option>
					</select>
	                </div>
	            </div>
            </div>
                <div class="card-footer">
                  <button type="submit" class="btn btn-primary">Grant Access</button>
                </div>
              </form>
            </div>
            <!-- /.card -->
            </div>
          <!--/.col (left) -->
          <!-- right column -->
          <div class="col-md-6">   
          </div>
          <!--/.col (right) -->
        </div>
        <!-- /.row -->
        <br>
        
      </div><!-- /.container-fluid -->
       <div class="row">
          <div class="col-md-4">
          </div>
          <div class="col-md-4">
        	 <% String check=(String)session.getAttribute("update");
            if(check!=null && check.equals("success")){out.println("<strong>Success!</strong> User access has been approved, Thank you !!");session.removeAttribute("update");}
            else if(check!=null && check.equals("fail")){out.println("<strong>Fail!</strong> User access has not been apporved !!");session.removeAttribute("update");}
            %>
                </div>
           </div> 
           </div>
           </div>
          <div class="col-md-4">
          </div>
       </div>
    </section>
    <!-- /.content -->
       
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <div class="float-right d-none d-sm-block">
      <b>Version</b> 3.0.2
    </div>
    <strong>Copyright &copy; 2014-2019 <a href="http://adminlte.io">AdminLTE.io</a>.</strong> All rights
    reserved.
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- jquery-validation -->
<script src="plugins/jquery-validation/jquery.validate.min.js"></script>
<script src="plugins/jquery-validation/additional-methods.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
<!--dynamic form  -->
<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
<script type="text/javascript" src="plugins/dynamic-form/dynamic-form.js"></script>
<script src="plugins/select2/js/select2.full.min.js"></script>
<script src="plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>
</body>
<script>
$(document).ready(function () {
  bsCustomFileInput.init();
});
$(function () {
    //Initialize Select2 Elements
    $('.select2').select2()
    //Initialize Select2 Elements
    $('.select2bs4').select2({
      theme: 'bootstrap4'
    })


  })
</script>
</html>
