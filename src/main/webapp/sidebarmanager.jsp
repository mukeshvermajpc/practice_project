<!-- Brand Logo -->
<a href="#" class="brand-link"> <img src="dist/img/marimba_logo.jpg"
	alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
	style="opacity: .9"> <span class="brand-text font-weight-light">Marimba</span>
</a>
<!-- Sidebar -->
<div class="sidebar">
	<!-- Sidebar user panel (optional) -->
	<div class="user-panel mt-3 pb-3 mb-3 d-flex">
		<div class="image">
		<a href="#"><img src="dist/img/profile.jpg" class="img-circle elevation-2" alt="User Image"></a></div>
		<div class="info">
			<a href="#" class="d-block"><%=session.getAttribute("name")%><br><%=session.getAttribute("team")%></a>
		</div>
	</div>
	<!-- Sidebar Menu -->
	<nav class="mt-2">
		<ul class="nav nav-pills nav-sidebar flex-column"
			data-widget="treeview" role="menu" data-accordion="false">
			<!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
			<li class="nav-item has-treeview menu-open">
				<ul class="nav nav-treeview">
					<li class="nav-item"><a href="usermanager.jsp"
						class="nav-link"> <i class="far  nav-icon"></i>
							<p>Home</p>
					</a></li>
					<li class="nav-item"><a href="task.jsp" class="nav-link">
							<i class="far  nav-icon"></i>
							<p>Task</p>
					</a></li>
					<li class="nav-item"><a href="userprofile.jsp"
						class="nav-link"> <i class="far  nav-icon"></i>
							<p>Profile</p>
					</a></li>
					<li class="nav-item"><a href="adminaccess.jsp"
						class="nav-link"> <i class="far  nav-icon"></i>
							<p>Access</p>
					</a></li>
				</ul>
			</li>
		</ul>
	</nav>
	<!-- /.sidebar-menu -->
</div>
<!-- /.sidebar -->
<!--profile picture upload  -->
<div class="modal fade" id="model" data-backdrop="false" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
	    <form method="post" enctype = "multipart/form-data">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Upload profile picture</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
			 <div class="form-group">
                    <label for="exampleInputFile">File input</label>
                    <div class="input-group">
                      <div class="custom-file">
                        <input type="file" class="custom-file-input" id="exampleInputFile">
                        <label class="custom-file-label" for="exampleInputFile">Choose file</label>
                      </div>
                      <div class="input-group-append">
                        <span class="input-group-text" id="">Upload</span>
                      </div>
                    </div>
                  </div>
			</div>
			<div class="modal-footer justify-content-between">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Upload</button>
			</div>
		</div>
		</form>
	</div>
</div>