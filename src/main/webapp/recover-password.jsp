<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 3 | Recover Password</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Font Awesome -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <a href="index2.html"><b>Marimba</b>TFS</a>
  </div>
  <!-- /.login-logo -->
  <div class="card">
    <div class="card-body login-card-body">
      <p class="login-box-msg">Reset Password.</p>
      <form action="recover-password-process.jsp" id="resetPasword" method="post">
            <div>
               <input type="hidden" name="email" value="<% out.println(session.getAttribute("email"));%>"/>
               <%session.removeAttribute("email"); %>
            </div> 
			<div class="form-group">
                    <label for="password">Password</label>
                    <!--<input type="password" name="password" class="form-control" id="id_password" placeholder="Password">-->
					<input id="id_pwd" class="form-control" name="password" type="password" placeholder="Password" />
            </div>
			<div class="form-group">
                <label for="confimpassword">Confirm Password</label>
			 <input id="id_conf_pwd" class="form-control" name="confirmpassword" type="password" placeholder="Confirm password"/>
            </div>
         <div class="row">
          <div class="col-12">
            <button type="submit" class="btn btn-primary btn-block">Change password</button>
          </div>
          <!-- /.col -->
        </div>
      </form>
      <p class="mt-3 mb-1">
        <a href="login.html">Login</a>
      </p>
    </div>
    <!-- /.login-card-body -->
  </div>
</div>
<!-- /.login-box -->
<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>
<!-- jquery-validation -->
<script src="plugins/jquery-validation/jquery.validate.min.js"></script>
<script src="plugins/jquery-validation/additional-methods.min.js"></script>
<script type="text/javascript">
$(document).ready(function () {
  $('#resetPasword').validate({
    rules: {
                            password: {
                                 required: true,
                                 minlength : 5
                             },
                            confirmpassword: {
                                   required: true,
                                   minlength : 5,
                                   equalTo: "#id_pwd"
                                 }
                        },
                        messages: {
                               password: {
                                  required: "Please enter the password.",
                                  minlength: "Your password must be at least 6 characters long"
                                },
                              confirmpassword: {
                                 required: "Please enter the confirm password.",
                                 minlength: "Your password must be at least 6 characters long",
                                 equalTo: "Please enter the same password as above"
                              }
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
  });
});
</script>
</body>
</html>
