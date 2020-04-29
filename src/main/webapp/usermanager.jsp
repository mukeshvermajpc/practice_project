<%@page import="javax.management.modelmbean.RequiredModelMBean"%>
<%
	HttpSession status = request.getSession(false);
	if (status == null || status.getAttribute("loggedIn") == null) {
		response.sendRedirect("index.jsp");
	}
%>
<%@ page import="java.util.*"%>
<%@ page import="com.marimba.service.*"%>
<%@ page import="com.marimba.bean.*" %>
<%@ page import="com.marimba.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page isELIgnored="false"%>
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
<!-- Tempusdominus Bbootstrap 4 -->
<link rel="stylesheet"
	href="plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
<!-- iCheck -->
<link rel="stylesheet"
	href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- JQVMap -->
<link rel="stylesheet" href="plugins/jqvmap/jqvmap.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="dist/css/adminlte.min.css">
<!-- overlayScrollbars -->
<link rel="stylesheet"
	href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<!-- Daterange picker -->
<link rel="stylesheet"
	href="plugins/daterangepicker/daterangepicker.css">
<!-- summernote -->
<link rel="stylesheet" href="plugins/summernote/summernote-bs4.css">
<!-- Google Font: Source Sans Pro -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">
<!-- DataTables -->
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">

		<!-- Navbar -->
		<nav
			class="main-header navbar navbar-expand navbar-white navbar-light">
			<jsp:include page="header.jsp" />
		</nav>
		<!-- /.navbar -->

		<!-- Main Sidebar Container -->
		<aside class="main-sidebar sidebar-dark-primary elevation-4">
			<!-- Brand Logo -->
			<% String user = (String) session.getAttribute("userType");
			  if((status!=null)&&(user!=null)){	
			  if(user.equals("User")){%>
			  <jsp:include page="sidebaruser.jsp" />
			   <%}else{%>
			  <jsp:include page="sidebarmanager.jsp" />
			  <%}}%>
		</aside>
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1 class="m-0 text-dark">Dashboard</h1>
						</div>
						<!-- /.col -->
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								
							</ol>
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- /.content-header -->
			<!-- user registration details-->
			<%
				int count = 1;
				AdminHomeService service = new AdminHomeService();
				int userCount = service.getUserCount();
				//get all user
				List<User> list = service.getUsers();
				request.setAttribute("list", list);
				Date date = new Date();
				SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
				String strDate = formatter.format(date);
				java.sql.Date dt = new java.sql.Date(date.getTime());
				int effortNotFilledCount = service.getNotFilledEffortCountService(dt.toString());
				List<User> listEffortNotFilledUser = service.getNotFilledEffortService(dt.toString());
				request.setAttribute("listUser", listEffortNotFilledUser);
				int effortUserCount = service.getFilledEffortCountService(dt.toString());
				List<User> effortList = service.getFilledEffortService(dt.toString());
				request.setAttribute("effortUserList", effortList);
				List<Usertask> userTaskList = service.getAllTaskService();
				request.setAttribute("useralltask", userTaskList);
				String monthUser = service.getMonthUserService();
			%>
			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">
					<!-- Small boxes (Stat box) -->
					<div class="row">
						<div class="col-lg-4 col-8">
							<!-- small box -->
							<div class="small-box bg-info">
								<div class="inner">
									<h3>
										<%
											out.println(effortNotFilledCount);
										%>
									</h3>

									<p>User who not filled effort</p>
								</div>
								<div class="icon">
									<i class="ion ion-bag"></i>
								</div>
								<a href="#" data-toggle="modal" data-target="#modal-new-order"
									class="small-box-footer">More info <i
									class="fas fa-arrow-circle-right"></i></a>
							</div>
						</div>
						<!-- ./col -->
						<div class="col-lg-4 col-8">
							<!-- small box -->
							<div class="small-box bg-success">
								<div class="inner">
									<h3>
										<%
											out.println(effortUserCount);
										%>
									</h3>
									<p>User who filled effort</p>
								</div>
								<div class="icon">
									<i class="ion ion-stats-bars"></i>
								</div>
								<a href="#" data-toggle="modal" data-target="#modal-default"
									class="small-box-footer">More info <i
									class="fas fa-arrow-circle-right"></i></a>
							</div>
						</div>
						<!-- ./col -->
						<div class="col-lg-4 col-8">
							<!-- small box -->
							<div class="small-box bg-warning">
								<div class="inner">
									<h3>
										<%
											out.println(userCount);
										%>
									</h3>

									<p>User Registrations</p>
								</div>
								<div class="icon">
									<i class="ion ion-person-add"></i>
								</div>
								<a href="#" data-toggle="modal"
									data-target="#modal-user-registration" class="small-box-footer">More
									info <i class="fas fa-arrow-circle-right"></i>
								</a>
							</div>
						</div>
						<!-- ./col -->
						<!-- ./col -->
					</div>
					<!-- /.row -->
					<!-- Main row -->
					<div class="row">

						<div class="col-md-12">
							<div class="card card-success">
								<div class="card-header">
									<h3 class="card-title">Users effort chart</h3>
									<div class="card-tools">
										<button type="button" class="btn btn-tool"
											data-card-widget="collapse">
											<i class="fas fa-minus"></i>
										</button>
										<button type="button" class="btn btn-tool"
											data-card-widget="remove">
											<i class="fas fa-times"></i>
										</button>
									</div>
								</div>
								<div class="card-body">
									<div class="chart">
										<canvas id="stackedBarChart"
											style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
									</div>
								</div>
								<!-- /.card-body -->
							</div>
							<!-- /.card -->
						</div>
					</div>
					<!-- /.row (main row) -->
				</div>
				<!-- /.container-fluid -->
			</section>
			<!-- /.content -->
			<section class="content">
				<div class="row">
					<div class="col-12">
						<div class="card">

							<!-- /.card-header -->
							<div class="card-body">
								<%
									
								%>
								<div class="row">
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
											<th>User id</th>
											<th>Name</th>
											<th>Task name</th>
											<th>Hour</th>
											<th>Description</th>
											<th>Date</th>
											<th>Team</th>
										</tr>
									</thead>
									<tbody>

										<c:forEach items="${useralltask}" var="u">
											<tr>
												<td>${u.getId()}</td>
												<td>${u.getName()}</td>
												<td>${u.getTaskName()}</td>
												<td>${u.getHour()}</td>
												<td>${u.getDescription()}</td>
												<td>${u.getDate()}</td>
											    <td>${u.getTeam()}</td>
											</tr>
										</c:forEach>
									</tbody>
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
		</div>
		<!-- /.content-wrapper -->
		<!-- footer section -->
		<jsp:include page="footer.jsp" />
		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Control sidebar content goes here -->
		</aside>
		<!-- /.control-sidebar -->
	</div>
	<!-- ./wrapper -->
	<!-- new order model -->
	<div class="modal fade" id="modal-new-order">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">Users not filled effort</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<table id="example2" class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>Sr.No.</th>
								<th>User Id</th>
								<th>Name</th>
								<th>Email</th>
							</tr>
						</thead>
						<tbody>
							<%
								int usercount = 1;
							%>
							<c:forEach items="${listUser}" var="u">
								<tr>
									<td>
										<%
											out.println(usercount++);
										%>
									</td>
									<td>${u.getId()}</td>
									<td>${u.getName()}</td>
									<td>${u.getEmail()}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="modal-footer justify-content-between">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- default model -->
	<div class="modal fade" id="modal-default">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">Users filled effort</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<table id="example3" class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>Sr.No.</th>
								<th>User Id</th>
								<th>Name</th>
								<th>Email</th>
							</tr>
						</thead>
						<tbody>
							<%
								int userListCount = 1;
							%>
							<c:forEach items="${effortUserList}" var="u">
								<tr>
									<td>
										<%
											out.println(userListCount++);
										%>
									</td>
									<td>${u.getId()}</td>
									<td>${u.getName()}</td>
									<td>${u.getEmail()}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="modal-footer justify-content-between">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- user registration model -->
	<div class="modal fade" id="modal-user-registration">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">Registered User</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<table id="example1" class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>Sr.No.</th>
								<th>User Id</th>
								<th>Name</th>
								<th>Email</th>
								<th>User Type</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="u">
								<tr>
									<td>
										<%
											out.println(count++);
										%>
									</td>
									<td>${u.getId()}</td>
									<td>${u.getName()}</td>
									<td>${u.getEmail()}</td>
									<td>${u.getUserType()}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="modal-footer justify-content-between">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<!-- jQuery UI 1.11.4 -->
	<script src="plugins/jquery-ui/jquery-ui.min.js"></script>
	<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
	<script>
		$.widget.bridge('uibutton', $.ui.button)
	</script>
	<!-- Bootstrap 4 -->
	<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- ChartJS -->
	<script src="plugins/chart.js/Chart.min.js"></script>
	<!-- Sparkline -->
	<script src="plugins/sparklines/sparkline.js"></script>
	<!-- jQuery Knob Chart -->
	<script src="plugins/jquery-knob/jquery.knob.min.js"></script>
	<!-- daterangepicker -->
	<script src="plugins/moment/moment.min.js"></script>
	<script src="plugins/daterangepicker/daterangepicker.js"></script>
	<!-- Tempusdominus Bootstrap 4 -->
	<script
		src="plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
	<!-- Summernote -->
	<script src="plugins/summernote/summernote-bs4.min.js"></script>
	<!-- overlayScrollbars -->
	<script
		src="plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
	<!-- AdminLTE App -->
	<script src="dist/js/adminlte.js"></script>
	<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
	<script src="dist/js/pages/dashboard.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="dist/js/demo.js"></script>
	<!-- for data table -->
	<script src="plugins/js/jquery.dataTables.min.js"></script>
	<script src="plugins/js/dataTables.buttons.min.js"></script>
	<script src="plugins/js/buttons.flash.min.js"></script>
	<script src="plugins/js/jszip.min.js"></script>
	<script src="plugins/js/pdfmake.min.js"></script>
	<script src="plugins/js/vfs_fonts.js"></script>
	<script src="plugins/js/buttons.html5.min.js"></script>
	<script src="plugins/js/buttons.print.min.js"></script>
	<script src="plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function () {
  	bsCustomFileInput.init();
	});
	</script>
	<script>
		$(function() {
			$("#example1").DataTable();
			$("#example2").DataTable();
			$("#example3").DataTable();
		});

		$(function() {
			/* ChartJS
			 * -------
			 * Here we will create a few charts using ChartJS
			 */

			//--------------
			//- AREA CHART -
			//--------------
			// Get context with jQuery - using jQuery's .get() method.
			var areaChartData = {
				labels : [ 'January', 'Febuary', 'March', 'April',
						'May', 'June','July','August','September','October','November','December' ],
				datasets : [ {
					label : 'No. of user filled effort',
					backgroundColor : 'rgba(60,141,188,0.9)',
					borderColor : 'rgba(60,141,188,0.8)',
					pointRadius : false,
					pointColor : '#3b8bba',
					pointStrokeColor : 'rgba(60,141,188,1)',
					pointHighlightFill : '#fff',
					pointHighlightStroke : 'rgba(60,141,188,1)',
					data :<%=monthUser%>
				}, ]
			}
			//-------------
			//- BAR CHART -
			//-------------
			var barChartData = jQuery.extend(true, {}, areaChartData)

			//---------------------
			//- STACKED BAR CHART -
			//---------------------
			var stackedBarChartCanvas = $('#stackedBarChart').get(0)
					.getContext('2d')
			var stackedBarChartData = jQuery.extend(true, {}, barChartData)

			var stackedBarChartOptions = {
				responsive : true,
				maintainAspectRatio : false,
				scales : {
					xAxes : [ {
						stacked : true,
					} ],
					yAxes : [ {
						stacked : true
					} ]
				}
			}

			var stackedBarChart = new Chart(stackedBarChartCanvas, {
				type : 'bar',
				data : stackedBarChartData,
				options : stackedBarChartOptions
			})
		});
		$(document).ready(function(){
	        $.fn.dataTable.ext.search.push(
	        function (settings, data, dataIndex) {
	            var min = $('#min').datepicker("getDate");
	            var max = $('#max').datepicker("getDate");
	            var startDate = new Date(data[5]);
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
	            var table = $('#example').DataTable(
	            		{
	            	        dom: 'lBfrtip',
	            	        buttons: [
	            			{   
	            				extend: 'excel',
	            				text:'Export to excel'
	            			}
	            			]
	            	    }	
	            );
	            // Event listener to the two range filtering inputs to redraw on input
	            $('#min, #max').change(function () {
	                table.draw();
	            });
	        });
	</script>
	</script>
</body>
</html>
