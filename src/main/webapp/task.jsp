
<%
	HttpSession status = request.getSession(false);
	if (status == null || status.getAttribute("loggedIn") == null) {
		response.sendRedirect("index.jsp");
	}
%>
<%@ page import="com.marimba.service.*,java.util.*"%>
<%@ page import="com.marimba.bean.*"%>
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
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- DataTables -->
<!-- Theme style -->
<link rel="stylesheet" href="dist/css/adminlte.min.css">
<!-- Google Font: Source Sans Pro -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body class="hold-transition sidebar-mini">
	<div class="wrapper">
		<!-- Navbar -->
		<nav
			class="main-header navbar navbar-expand navbar-white navbar-light">
			<jsp:include page="header.jsp" />

		</nav>
		<!-- /.navbar -->
		<!-- Main Sidebar Container -->
		<aside class="main-sidebar sidebar-dark-primary elevation-4">
			<%
				String user = (String) session.getAttribute("userType");
				if ((status != null) && (user != null)) {
					if (user.equals("User")) {
			%>
			<jsp:include page="sidebaruser.jsp" />
			<%
				} else {
			%>
			<jsp:include page="sidebarmanager.jsp" />
			<%
				}
				}
			%>
		</aside>
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>Added Tasks</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
							</ol>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>
			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-12">
						<div class="card">

							<!-- /.card-header -->
							<div class="card-body">
								<%
									Integer userId = (Integer) session.getAttribute("Id");
									if (userId != null) {
										TaskService service = new TaskService();
										int id = Integer.parseInt(userId.toString());
										List<Task> list = service.getTasks(id);
										request.setAttribute("list", list);
									}
								%>
								<div class="row">
									<div class="col-1">
										<a href="addtask.jsp"><button
												class="btn btn-block btn-secondary btn-sm">Add Task</button></a>
									</div>
									<div class="col-1">
										<label>From Date:</label>
									</div>
									<div class="col-1">
										<input name="min" id="min" type="text" class="form-control">
									</div>
									<div class="col-1">
										<label>To Date:</label>
									</div>
									<div class="col-1">
										<input name="max" id="max" type="text" class="form-control">
									</div>
								</div>
								<br>
								<table id="example" class="table table-bordered table-striped">
									<thead>
										<tr>
											<th>Task id</th>
											<th>Task Name</th>
											<th>Hour</th>
											<th>Description</th>
											<th>Date</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${list}" var="u">
											<tr>
												<td>${u.getTaskId()}</td>
												<td>${u.getTaskName()}</td>
												<td>${u.getHour()}</td>
												<td>${u.getDescription()}</td>
												<td>${u.getDate()}</td>
											</tr>
										</c:forEach>
									</tfoot>
								</table>
							</div>
							<!-- /.card-body -->
						</div>
						<!-- /.card -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
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
	<!-- DataTables -->
	<script src="plugins/datatables/jquery.dataTables.js"></script>
	<script src="plugins/datatables-bs4/js/dataTables.bootstrap4.js"></script>
	<!-- AdminLTE App -->
	<script src="dist/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="dist/js/demo.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<!-- page script -->
	<script src="plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function () {
  		bsCustomFileInput.init();
	});
	</script>
	<script>
	 $(document).ready(function(){
	        $.fn.dataTable.ext.search.push(
	        function (settings, data, dataIndex) {
	            var min = $('#min').datepicker("getDate");
	            var max = $('#max').datepicker("getDate");
	            var startDate = new Date(data[4]);
	            if (min == null && max == null) { 
				return true; 
				}
	            if (min == null && startDate <= max) { 
				return true;
				}
	            if(max == null && startDate >= min) {
				return true;
				}
	            if (startDate <= max && startDate >= min) {
				return true; 
				}
	            return false;
	        }
	        );
	            $("#min").datepicker({ onSelect: function () { table.draw(); }, changeMonth: true, changeYear: true });
	            $("#max").datepicker({ onSelect: function () { table.draw(); }, changeMonth: true, changeYear: true });
	            var table = $('#example').DataTable();

	            // Event listener to the two range filtering inputs to redraw on input
	            $('#min, #max').change(function () {
	                table.draw();
	            });
	        });
	</script>
</body>
</html>
