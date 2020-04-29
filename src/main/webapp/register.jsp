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
<!-- icheck bootstrap -->
<link rel="stylesheet"
	href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="dist/css/adminlte.min.css">
<!-- Google Font: Source Sans Pro -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">
</head>
<body class="hold-transition register-page">
	<div class="register-box">
		<div class="text-success">
		     <h4>Marimba Task Management System</h4>
		</div>
		<div class="card">
			<div class="card-body register-card-body">
				<p class="login-box-msg">Register a new user</p>
				<form id="registration" action="userregistration.jsp" method="post">
					<div class="form-group">
						<%
							String registered = (String) session.getAttribute("status");
							if (registered != null && registered.equals("already registered")) {
								out.println("User is already registered");
								session.removeAttribute("status");
							}
						%>
						<!-- for registration fail -->
						<%
							String fail = (String) session.getAttribute("registration_fail");
							if (fail != null && fail.equals("fail")) {
								out.println("Failed to registrer, please try again");
								session.removeAttribute("registration_fail");
							}
						%>
					</div>
					<div class="form-group">
						<input type="text" name="id" class="form-control" id="id"
							placeholder="Employee Id">
					</div>
					<div class="form-group">
						<input type="text" name="name" class="form-control" id="name"
							placeholder="Full Name">
					</div>
					<div class="form-group">
						<input type="email" name="email" class="form-control" id="email"
							placeholder="Email Address">
					</div>
					<div class="form-group">
						<input type="password" name="password" class="form-control"
							id="id_password" placeholder="Password">
					</div>
					<div class="form-group">
						<input type="password" name="confirmpassword" class="form-control"
							id="cnf_pwd" placeholder="Confirm password">
					</div>
					<div class="form-group">
						<select class="form-control" name="team" id="team">
							<option value="Development Team">Development Team</option>
							<option value="QA(Testing) Team">QA(Testing) Team</option>
							<option value="Resolution Team">Resolution Team</option>
							<option value="Support Team">Support Team</option>
						</select>
					</div>
					<div class="row">
						<div class="col-8">
							<div class="social-auth-links text-left">
								<a href="index.jsp" class="text-center">Already Registered</a>
							</div>
						</div>
						<!-- /.col -->
						<div class="col-4">
							<button type="submit" id="userData"
								class="btn btn-primary btn-block">Register</button>
						</div>
						<!-- /.col -->
					</div>
				</form>
				<!-- /.form-box -->
			</div>
			<!-- /.card -->
		</div>
		<!-- /.register-box -->

		<!-- jQuery -->
		<script src="plugins/jquery/jquery.min.js"></script>
		<!-- Bootstrap 4 -->
		<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
		<!-- AdminLTE App -->
		<script src="dist/js/adminlte.min.js"></script>
		<script src="plugins/jquery-validation/jquery.validate.min.js"></script>
		<script src="plugins/jquery-validation/additional-methods.min.js"></script>
		<script type="text/javascript">
			$(document)
					.ready(
							function() {
								$('#registration')
										.validate(
												{
													rules : {
														id : {
															required : true,
															minlength : 5,
															number : true
														},
														name : {
															required : true,
														},
														email : {
															required : true,
															email : true,
														},
														password : {
															required : true,
															minlength : 5
														},
														confirmpassword : {
															required : true,
															minlength : 5,
															equalTo : "#id_password"
														}
													},
													messages : {
														id : {
															required : "Please enter employee id",
															minlength : "Employee must have atleast 5 digit",
															number : "Please enter valid employee id"
														},
														name : {
															required : "Please your full name"
														},
														email : {
															required : "Please enter a email address",
															email : "Please enter a vaild email address"
														},
														password : {
															required : "Please provide a password",
															minlength : "Your password must be at least 5 characters long"
														},
														confirmpassword : {
															required : "Please enter the confirm password.",
															minlength : "Your password must be at least 6 characters long",
															equalTo : "Please enter the same password as above"
														}
													},
													errorElement : 'span',
													errorPlacement : function(
															error, element) {
														error
																.addClass('invalid-feedback');
														element.closest(
																'.form-group')
																.append(error);
													},
													highlight : function(
															element,
															errorClass,
															validClass) {
														$(element).addClass(
																'is-invalid');
													},
													unhighlight : function(
															element,
															errorClass,
															validClass) {
														$(element).removeClass(
																'is-invalid');
													}
												});
							});
		</script>
</body>
</html>
