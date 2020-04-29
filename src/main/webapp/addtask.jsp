<%
HttpSession status=request.getSession(false);
if(status==null || status.getAttribute("loggedIn") == null)
{
	 response.sendRedirect("index.jsp"); 
}
%>
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
    <% String user = (String) session.getAttribute("userType");
		if((status!=null)&&(user!=null)){		
       if (user.equals("User")){%>
			<jsp:include page="sidebaruser.jsp" />
			<%} else {%>
			<jsp:include page="sidebarmanager.jsp" />
			<%}}%>
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Marimba Task</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
            <!-- right side bar section -->
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
                <h3 class="card-title">Marimba Task <small>Filling Form</small></h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form role="form" id="quickForm" action="usertaskdao.jsp" method="POST">
                <div class="card-body">
                  <div class="row">
                  <div class="col-lg-2">
                  </div>
                  <div class="col-lg-2">
                    <b>Select type of task</b>
                  </div>
                  <div class="col-lg-1">
                     <b>Hours Spent</b>
                  </div>
                  <div class="col-lg-3">
                     <b>Description/Comment</b>
                  </div>
                  </div>
                </div>
                <!-- /.card-body -->
	        <div class="form-group" id="dynamic_form">
                <div class="row">
                    <div class="col-lg-2">
                    </div>
	                <div class="col-lg-2">
					<select class="form-control" id="usertask" name="usertask">
					       <option>Select</option>
					       <option value="Automation">Automation</option>
					       <option value="Build Error Defect">Build Error Defect</option>
					       <option value="Build machine issues">Build machine issues</option>
						   <option value="Cloud Lab Upgrde">Cloud Lab Upgrde</option>
						   <option value="Code Review">Code Review</option>
					       <option value="Code Review Defect (Filed)">Code Review Defect (Filed)</option>
					       <option value="Code Review Defect (Fixed)">Code Review Defect (Fixed)</option>
					       <option value="Build machine issues">Customer Implementation</option>					    
						   <option value="Cloud Lab Upgrde">Cloud Lab Upgrde</option>
						   <option value="Debugging">Debugging</option>
						   <option value="Defect creation">Defect creation</option>
						   <option value="Defect creation">Defect creation</option>
						   <option value="Defect Rework(kickback)">Defect Rework(kickback)</option>
						   <option value="Defect verification (Customer)">Defect verification (Customer)</option>
						   <option value="Defect verification (Internal)">Defect verification (Internal)</option>
						   <option value="Defects Fixing">Defects Fixing</option>
						   <option value="Doc Creation">Doc Creation</option>
						   <option value="Doc Review">Doc Review</option>
						   <option value="Doc Update">Doc Update</option>
						   <option value="Escalation">Escalation</option>
						  <option value="HF Doc Creation">HF Doc Creation</option>
						  <option value="Lab monitoring">Lab monitoring</option>
						  <option value="Lab/Cloud Maintenance">Lab/Cloud Maintenance</option>
						  <option value="Leave (Planned)">Leave (Planned)</option>
						  <option value="Leave (Unplnned)">Leave (Unplnned)</option>
						  <option value="Meetings (Customer)">Meetings (Customer)</option>
						  <option value="Meetings (Internal)">Meetings (Internal)</option>
						  <option value="Nighly build">Nighly build</option>
						  <option value="Perforce Check-in">Perforce Check-in</option>
						  <option value="Production/ChannelStore">Production/ChannelStore</option>
						  <option value="QIP Lab upgrade">QIP Lab upgrade</option>
						 <option value="Setup Creation">Setup Creation</option>
						 <option value="Spike">Spike</option>
						 <option value="Staging build">Staging build</option>
						 <option value="Story/Task">Story/Task</option>
						 <option value="Tech Alert Doc creation">Tech Alert Doc creation</option>
						 <option value="Test Plan creation">Test Plan creation</option>
						 <option value="Testcase creation">Testcase creation</option>
						 <option value="Testcase execution">Testcase execution</option>
						 <option value="Testcase Rework">Testcase Rework</option>
						 <option value="Perforce Check-in">TFS Update</option>
						 <option value="Training (Customer)">Training (Customer)</option>
						 <option value="Training (Internal)">Training (Internal)</option>
						 <option value="Setup Creation">Travel(Official)</option>
						 <option value="Spike">Unit Testing</option>
					</select>
	                </div>
	                <div class="col-lg-1">
	                    <input type="number" class="form-control" name="hour" id="hour" placeholder="Hours" required/>
	                </div>
					 <div class="col-lg-3">
	                    <input type="textarea" class="form-control" name="description" id="description" placeholder="Enter description if any" required>
	                </div>
	                <div class="button-group">
	                    <a href="javascript:void(0)" class="btn btn-primary" id="plus5">Add More</a>
	                    <a href="javascript:void(0)" class="btn btn-danger" id="minus5">Remove</a>
	                </div>
	            </div>
            </div>
                <div class="card-footer">
                  <button type="submit" class="btn btn-primary">Submit</button>
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
        	 <% String check=(String)session.getAttribute("status");
            if(check!=null && check.equals("success")){out.println("<strong>Success!</strong> Task details added into database, Thank you !!");session.removeAttribute("status");}
            else if(check!=null && check.equals("fail")){out.println("<strong>Fail!</strong> Task details not added into database !!");session.removeAttribute("status");}
            %>
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
<!--dynamic form  -->
<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
<script type="text/javascript" src="plugins/dynamic-form/dynamic-form.js"></script>
<script src="plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>
<script type="text/javascript">
$(document).ready(function () {
  bsCustomFileInput.init();
});
</script>
<script type="text/javascript">
$(document).ready(function() {
	var dynamic_form =  $("#dynamic_form").dynamicForm("#dynamic_form","#plus5", "#minus5", {
        limit:10,
        formPrefix : "dynamic_form",
        normalizeFullForm : false
    });
	dynamic_form.inject([{task: 'Hemant',hour: '1',description: 'testing remark'}]);
    $("#dynamic_form #minus5").on('click', function(){
    	var initDynamicId = $(this).closest('#dynamic_form').parent().find("[id^='dynamic_form']").length;
    	if (initDynamicId === 2) {
    		$(this).closest('#dynamic_form').next().find('#minus5').hide();
    	}
    	$(this).closest('#dynamic_form').remove();
    });
    $('form').on('submit', function(event){
    	var values = {};
		$.each($('form').serializeArray(), function(i, field) {
		    values[field.name] = field.value;
		});
		console.log(values)
		event.preventDefault();
		var count= Object.keys(values).length/3;
		alert(count);
	})
});
</script>
</body>
</html>
