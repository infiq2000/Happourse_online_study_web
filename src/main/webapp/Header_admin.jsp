<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hapourse - Online Study Website</title>
</head>
<body>
<header class="theme-menu-wrapper menu-style-one">
				<div class="container">
					<div class="header-wrapper clearfix">
						<!-- Logo -->
						<div class="logo float-left tran4s"><a href="index.jsp"><img src="images/logo/x.png" alt="Logo"></a></div>

						<!-- ============================ Theme Menu ========================= -->
						<nav class="theme-main-menu float-right navbar" id="mega-menu-wrapper">
							<!-- Brand and toggle get grouped for better mobile display -->
						   <div class="navbar-header">
						     <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-1" aria-expanded="false">
						       <span class="sr-only">Toggle navigation</span>
						       <span class="icon-bar"></span>
						       <span class="icon-bar"></span>
						       <span class="icon-bar"></span>
						     </button>
						   </div>
						   <!-- Collect the nav links, forms, and other content for toggling -->
						   <div class="collapse navbar-collapse" id="navbar-collapse-1">
								<ul class="nav">
									
									<li><a href="AdminManageAccount" class="tran3s">Manage Accounts</a></li>
									
									<li><a href="AdminManageUser" class="tran3s">Manage Users</a></li>
									
									<li><a href="admin_manage_instructor.jsp" class="tran3s">Manage Instructors</a></li>
									
									<li><a href="admin_manage_course.jsp" class="tran3s">Manage Courses</a></li>
									
									<li class="dropdown-holder menu-list"><a class="tran3s">Other</a>
										<ul class="sub-menu">
											<li><a href="admin_manage_hashtag.jsp">Manage Hashtags</a></li>
											<li><a href="admin_manage_category.jsp">Manage Categories</a></li>
										</ul>
									</li>
									
									<li class="dropdown-holder menu-list" ><a class="tran3s"><span class="login">Hi Admin!</span></a> 
										<ul class="sub-menu">											
											<li><a href="Logout">Log out</a></li>
										</ul>
									</li>
								</ul>
						   </div><!-- /.navbar-collapse -->
						</nav> <!-- /.theme-main-menu -->
					</div> <!-- /.header-wrapper -->
				</div>
			</header> <!-- /.theme-menu-wrapper -->		
</body>
</html>