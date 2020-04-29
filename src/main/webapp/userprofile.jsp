<%
HttpSession status=request.getSession(false);
if(status==null || status.getAttribute("loggedIn") == null)
{
	 response.sendRedirect("index.jsp"); 
}
%>
<%@ page import="com.marimba.service.*" %>
<%@ page import="com.marimba.bean.*" %>
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
    		<%
    		String user = (String) session.getAttribute("userType");
    		if((status!=null)&& (user!=null)){
			if(user.equals("User")){%>
			<jsp:include page="sidebaruser.jsp" />
			<%} else {%>
			<jsp:include page="sidebarmanager.jsp" />
			<%}}%>
   </aside>
  <!-- Content Wrapper. Contains page content -->
  <% 
  User usr=new User();
  Object id=session.getAttribute("Id");
  if((status!=null)&&(id!=null))
  {
	  int userId=(Integer)id;
	  UserProfileService service=new UserProfileService();
	 usr=service.getUserProfile(userId);  
  }
  %>
  
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Profile</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
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
                <h3 class="card-title">Details</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form role="form" id="quickForm" action="userprofileupdate.jsp" method="post">
                <div class="card-body">
                 <div class="row">
                  <div class="col-lg-3">
                  </div>
                  <div class="col-lg-4">
                   <div class="form-group">
                    <label for="exampleInputEmail1">Employee Id</label>
                    <input type="text" name="id" class="form-control" id="id" placeholder="User Id" value="<%=usr.getId()%>" disabled>
                	 <input type="hidden" name="id" class="form-control" id="id" placeholder="User Id" value="<%=usr.getId()%>">
                  </div>
                
                  <div class="form-group">
                    <label for="exampleInputEmail1">Email address</label>
                    <input type="email" name="email" class="form-control" id="email" placeholder="Email" value="<%= usr.getEmail()%>"disabled>
                  	<input type="hidden" name="email" class="form-control" id="id" placeholder="User Id" value="<%= usr.getEmail()%>">
                  </div>
                    <div class="form-group">
                    <label for="exampleInputEmail1">Name</label>
                    <input type="text" name="name" class="form-control" id="name" placeholder="Name" value="<%=usr.getName() %>">
                  </div>
                  <div class="form-group">
                    <label for="exampleInputEmail1">Team</label>
                    <select class="form-control" name="team" id="team">
							<option value="Development Team">Development Team</option>
							<option value="QA(Testing) Team">QA(Testing) Team</option>
							<option value="Resolution Team">Resolution Team</option>
							<option value="Support Team">Support Team</option>
						</select>
                  </div>
                  </div>
                  <div class="col-lg-3"></div>             
                 </div>
                </div>
                <!-- /.card-body -->
                <div class="card-footer">
                  <button type="submit" class="btn btn-primary">Update</button>
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
      <div class="row">
          <div class="col-md-4">
          </div>
          <div class="col-md-4">
        	 <% if(status!=null)
        	 {
        	 String check=(String)session.getAttribute("update");
            if(check!=null && check.equals("success")){out.println("<strong>User details updated successfully<strong> Thank you !!");session.removeAttribute("update");}
            else if(check!=null && check.equals("fail")){out.println("<strong>Failed to update</strong>!!");session.removeAttribute("update");}
        	 }
            %>
             </div>
          <div class="col-md-4">
          </div>
           </div> 
           </div>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <jsp:include page="footer.jsp" />
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
<script src="plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>
<script type="text/javascript">
$(document).ready(function () {
  bsCustomFileInput.init();
});
</script>
<script type="text/javascript">
  $('#quickForm').validate({
    rules: {
      email: {
        required: true,
        email: true,
      },
      password: {
        required: true,
        minlength: 5
      },
      terms: {
        required: true
      },
    },
    messages: {
      email: {
        required: "Please enter a email address",
        email: "Please enter a vaild email address"
      },
      password: {
        required: "Please provide a password",
        minlength: "Your password must be at least 5 characters long"
      },
      terms: "Please accept our terms"
    },
    errorElement: 'span',
    errorPlacement: function (error, element) {
      error.addClass('invalid-feedback');
      element.closest('.form-group').append(error);
    },
    highlight: function (element, errorClass, validClass) {
      $(element).addClass('is-invalid');
    },
    unhighlight: function (element, errorClass, validClass) {
      $(element).removeClass('is-invalid');
    }
  })
</script>
</body>
</html>
