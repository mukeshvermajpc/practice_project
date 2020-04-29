
<%
	HttpSession status = request.getSession(false);
	if (status == null || status.getAttribute("loggedIn") == null) {
		response.sendRedirect("index.jsp");
	}
%>
<%@ page import="com.marimba.service.*"%>
<%@ page import="com.marimba.bean.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
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
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
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
			<%
				String user = (String) session.getAttribute("userType");
				if ((status != null) && (user != null)) {
					if (user.equals("User")) {
			%>
			<jsp:include page="sidebaruser.jsp" />
			<%
				} else {
			%>
			<jsp:include page="sidebaradmin.jsp" />
			<%
				}
				}
			%>
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
			<!-- code for display daily,weekly and monthly effort -->
			<%
				int dailyEffort = 0;
				int weeklyEffort = 0;
				int monthlyEffort = 0;
				String monthlyData = "";
				String weeklyData = "";
				int dateCount = 0;
				if (status != null && status.getAttribute("Id") != null) {
					int userId = (Integer) session.getAttribute("Id");
					Date date = new Date();
					SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
					String strDate = formatter.format(date);
					java.sql.Date dt = new java.sql.Date(date.getTime());
					HomeService service = new HomeService();
					dailyEffort = service.getDailyEffort(userId, dt.toString());
					weeklyEffort = service.getWeeklyEffort(userId);
					monthlyEffort = service.getMonthlyEffort(dt.toString(), userId);
					monthlyData = service.getMonthlyGraphData(userId);
					weeklyData = service.getWeeklyGraphData(strDate, userId);
					MissingEffortDateService missingEffortService = new MissingEffortDateService();
					List<Date> list = missingEffortService.getMissingDate(userId, dt);
					dateCount = list.size();
					request.setAttribute("dateList", list);
				}
			%>
			<!-- close of effort section -->
			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">
					<!-- Small boxes (Stat box) -->
					<div class="row">
						<div class="col-lg-3 col-6">
							<!-- small box -->
							<div class="small-box bg-info">
								<div class="inner">
									<h3>
										<%
											out.println(dailyEffort);
										%>
									</h3>
									<p>Today Effort</p>
								</div>
								<div class="icon">
									<i class="ion ion-bag"></i>
								</div>
								<a href="#" class="small-box-footer">More info <i
									class="fas fa-arrow-circle-right"></i></a>
							</div>
						</div>
						<!-- ./col -->
						<div class="col-lg-3 col-6">
							<!-- small box -->
							<div class="small-box bg-success">
								<div class="inner">
									<h3>
										<%
											out.println(weeklyEffort);
										%>
									</h3>
									<p>Weekly Effort</p>
								</div>
								<div class="icon">
									<i class="ion ion-stats-bars"></i>
								</div>
								<a href="#" class="small-box-footer">More info <i
									class="fas fa-arrow-circle-right"></i></a>
							</div>
						</div>
						<!-- ./col -->
						<div class="col-lg-3 col-6">
							<!-- small box -->
							<div class="small-box bg-warning">
								<div class="inner">
									<h3>
										<%
											out.println(monthlyEffort);
										%>
									</h3>

									<p>Monthly Effort</p>
								</div>
								<div class="icon">
									<i class="ion ion-person-add"></i>
								</div>
								<a href="#" class="small-box-footer">More info <i
									class="fas fa-arrow-circle-right"></i></a>
							</div>
						</div>
						<!-- ./col -->
						<div class="col-lg-3 col-6">
							<!-- small box -->
							<div class="small-box bg-danger">
								<div class="inner">
									<h3><%=dateCount%></h3>

									<p>Not filled effort date</p>
								</div>
								<div class="icon">
									<i class="ion ion-pie-graph"></i>
								</div>
								<a href="#" data-toggle="modal" data-target="#modal-new-order"
									class="small-box-footer">More info <i
									class="fas fa-arrow-circle-right"></i></a>
							</div>
						</div>
						<!-- ./col -->
					</div>
					<!-- /.row -->
					<!-- Main row -->
					<section class="content">
						<div class="container-fluid">
							<div class="row">
								<div class="col-md-8">
									<!-- AREA CHART -->
									<div class="card card-primary">
										<div class="card-header">
											<h3 class="card-title">Monthly Effort Chart</h3>
											&nbsp;&nbsp;&nbsp;
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
												<canvas id="areaChart"
													style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
											</div>
										</div>
										<!-- /.card-body -->
									</div>
									<!-- /.card -->


									<!-- /.card -->

									<!-- PIE CHART -->
									<!-- /.card -->

								</div>
								<!-- /.col (LEFT) -->
								<div class="col-md-4">
									<!-- LINE CHART -->
									<!-- /.card -->
									<!-- /.card -->

									<!-- STACKED BAR CHART -->
									<div class="card card-success">
										<div class="card-header">
											<h3 class="card-title">Weekly Effort Chart</h3>

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
								<!-- /.col (RIGHT) -->
							</div>
							<!-- /.row -->
						</div>
						<!-- /.container-fluid -->
					</section>
					<!-- /.row (main row) -->
				</div>
				<!-- /.container-fluid -->
			</section>
			<!-- /.content -->
		</div>
		<div class="modal fade" id="modal-new-order">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">Not filled effort date</h4>
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
									<th>Date</th>
								</tr>
							</thead>
							<tbody>
								<%
									int usercount = 1;
								%>
								<c:forEach items="${dateList}" var="item">
									<tr>
										<td><%=usercount++%></td>
										<td>${item}</td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
					</div>
					<div class="modal-footer justify-content-between">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary">Save
							changes</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
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
	<!-- JQVMap -->


	<!-- jQuery Knob Chart -->
	<script src="plugins/jquery-knob/jquery.knob.min.js"></script>
	<!-- daterangepicker -->
	<script src="plugins/moment/moment.min.js"></script>
	<script src="plugins/daterangepicker/daterangepicker.js"></script>
	<!-- Tempusdominus Bootstrap 4 -->

	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
	<!-- for chart -->
	<script src="plugins/chart.js/Chart.min.js"></script>
	<script
		src="plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
	<script src="plugins/js/jquery.dataTables.min.js"></script>
	<script src="plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			bsCustomFileInput.init();
		});
	</script>
	<script>
		$(function() {
			$("#example2").DataTable();
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
			var areaChartCanvas = $('#areaChart').get(0).getContext('2d')

			var areaChartData = {
				labels : [ 'January', 'February', 'March', 'April', 'May',
						'June', 'July', 'August', 'September', 'October',
						'November', 'December' ],
				datasets : [ {
					label : 'Digital Goods',
					backgroundColor : 'rgba(60,141,188,0.9)',
					borderColor : 'rgba(60,141,188,0.8)',
					pointRadius : false,
					pointColor : '#3b8bba',
					pointStrokeColor : 'rgba(60,141,188,1)',
					pointHighlightFill : '#fff',
					pointHighlightStroke : 'rgba(60,141,188,1)',
					data :
	<%out.println(monthlyData);%>
		}, ]
			}
			var areaChartOptions = {
				maintainAspectRatio : false,
				responsive : true,
				legend : {
					display : false
				},
				scales : {
					xAxes : [ {
						gridLines : {
							display : false,
						}
					} ],
					yAxes : [ {
						gridLines : {
							display : false,
						}
					} ]
				}
			}

			// This will get the first returned node in the jQuery collection.
			var areaChart = new Chart(areaChartCanvas, {
				type : 'line',
				data : areaChartData,
				options : areaChartOptions
			})

			//-------------
			//- BAR CHART -
			//-------------
			var areaChartData2 = {
				labels : [ 'Week 1', 'Week 2', 'Week 3', 'Week 4', 'Week 5' ],
				datasets : [ {
					label : 'Week Data',
					backgroundColor : 'rgba(60,141,188,0.9)',
					borderColor : 'rgba(60,141,188,0.8)',
					pointRadius : false,
					pointColor : '#3b8bba',
					pointStrokeColor : 'rgba(60,141,188,1)',
					pointHighlightFill : '#fff',
					pointHighlightStroke : 'rgba(60,141,188,1)',
					data :
	<%out.println(weeklyData);%>
		}, ]
			}
			var barChartData = jQuery.extend(true, {}, areaChartData2)
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
		})
		function validate(file) {
			var ext = file.split(".");
			ext = ext[ext.length - 1].toLowerCase();
			var arrayExtensions = [ "jpg", "jpeg", "png", "bmp", "gif" ];

			if (arrayExtensions.lastIndexOf(ext) == -1) {
				alert("Wrong file type");	
				$("#image").val("");
			}
		}
	</script>
</body>
</html>
