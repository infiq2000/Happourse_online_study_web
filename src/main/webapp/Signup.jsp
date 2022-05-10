<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<!-- For IE -->
		<meta http-equiv="X-UA-Compatible" content="IE=edge">

		<!-- For Resposive Device -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

		<title>Happourse - Online Study Website</title>

		<!-- Favicon -->
		<link rel="icon" type="image/png" sizes="56x56" href="images/fav-icon/icon.png">


		<!-- Main style sheet -->
		<link rel="stylesheet" type="text/css" href="css/style.css">
		<!-- responsive style sheet -->
		<link rel="stylesheet" type="text/css" href="css/responsive.css">


		<!-- Fix Internet Explorer ______________________________________-->

		<!--[if lt IE 9]>
			<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
			<script src="vendor/html5shiv.js"></script>
			<script src="vendor/respond.js"></script>
		<![endif]-->

			
	</head>

	<body>
		<div class="main-page-wrapper">

			<!-- ===================================================
				Loading Transition
			==================================================== -->
			<div id="loader-wrapper">
				<div id="loader"></div>
			</div>



			<!-- 
			=============================================
				Theme Header
			============================================== 
			-->
			<header class="theme-menu-wrapper menu-style-one">
				<div class="container">
					<div class="header-wrapper clearfix">
						<!-- Logo -->
						<div class="logo float-left tran4s"><a href="index.jsp"><img src="images/logo/v11.gif" alt="Logo" width=80px></a></div>

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
									<li class="dropdown-holder menu-list"><a href="index.jsp" class="tran3s">Home</a>
										<ul class="sub-menu">
											<li><a href="index.jsp">Home version one</a></li>
											<li><a href="index.jsp">Home version Two</a></li>
										</ul>
									</li>
									
									<li><a href="blog.jsp" class="tran3s">Blog</a></li>
									
									<li><a href="contact.jsp" class="tran3s">Contact Us</a></li>
									
									
									
									<li class="login"><button class="tran3s" data-toggle="modal" data-target=".signInModal"><i class="flaticon-lock"></i> Login</button></li>
								</ul>
						   </div><!-- /.navbar-collapse -->
						</nav> <!-- /.theme-main-menu -->
					</div> <!-- /.header-wrapper -->
				</div>
			</header> <!-- /.theme-menu-wrapper -->
			
			<!-- 
			=============================================
				Theme Inner Banner
			============================================== 
			-->
			<div class="inner-banner">
				<div class="opacity">
					<div class="container">
						<h2>Sign Up</h2>
						<ul>
							<li><a href="index.html" class="tran3s">Home</a></li>
							<li>/</li>
							<li><a href="#">pages</a></li>
							<li>/</li>
							<li>Registration</li>
						</ul>
					</div> <!-- /.container -->
				</div> <!-- /.opacity -->
			</div> <!-- /.inner-banner -->

	        

			<!-- Sign-Up Modal -->
			<div class="signUpModal theme-modal-box">
				<div class="modal-dialog">
				    <!-- Modal content-->
				    <div class="modal-content">
					    <div class="modal-body">
					        <h3>Login with Social Networks</h3>
					        <ul class="clearfix">
					        	<li class="float-left"><a href="https://www.facebook.com/"><i class="fa fa-facebook" aria-hidden="true"></i> facebook</a></li>
					        	<li class="float-left"><a href="https://www.google.com/"><i class="fa fa-google-plus" aria-hidden="true"></i> Google</a></li>
					        	<li class="float-left"><a href="https://twitter.com/"><i class="fa fa-twitter" aria-hidden="true"></i> Twitter</a></li>
					        	<li class="float-left"><a href="https://www.linkedin.com/"><i class="fa fa-linkedin" aria-hidden="true"></i> Linkedin</a></li>
					        </ul>
					     
					        <form action="SignUp" method="post">
					        	<h3>Sign Up</h3>
					        	<div class="wrapper">
					        		<input name = "txtUsername" type="text" placeholder="Username">
					        		<input name = "txtEmail"type="email" placeholder="Email">
					        		<input name = "txtPassword" type="password" placeholder="Password">
					        		<input name = "txtRepeatPassword" type="password" placeholder="Repeat Password">
					        		<input id="instructor1" name = "checkboxInstructor" type="checkbox" value="Instructor" style="margin: 0 0 20px 20px; width: 18px; height: 18px;">
					        		<label for="instructor1" style="margin-bottom: 20px; font-weight: normal;">Instructor?</label>
									
									<!-- <body bgcolor="#9999CC">
									<script language="javascript">
									alert( "This is an Error message" );
									</script>
									<p></p> -->
									<button class="p-bg-color hvr-trim">Sign up</button> 
					        	</div>
					        </form>
					    </div> <!-- /.modal-body -->
				    </div> <!-- /.modal-content -->
				</div> <!-- /.modal-dialog -->
			</div> <!-- /.signUpModal -->



			<!-- 
			=============================================
				Footer
			============================================== 
			-->
			<jsp:include page="footer.jsp"></jsp:include>


			<!-- Sign-in Modal -->
			<div class="modal fade signInModal theme-modal-box" role="dialog">
				<div class="modal-dialog">
				    <!-- Modal content-->
				    <div class="modal-content">
					    <div class="modal-body">
					        <h3>Login with Social Networks</h3>
					        <ul class="clearfix">
					        	<li class="float-left"><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i> facebook</a></li>
					        	<li class="float-left"><a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i> Google</a></li>
					        	<li class="float-left"><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i> Twitter</a></li>
					        	<li class="float-left"><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i> Linkedin</a></li>
					        </ul>
					        <form action="#">
					        	<h3>Login with Site Account</h3>
					        	<div class="wrapper">
					        		<input type="text" placeholder="Username or Email">
					        		<input type="password" placeholder="Password">
					        		<ul class="clearfix">
										<li class="float-left">
											<input type="checkbox" id="remember">
											<label for="remember">Remember Me</label>
										</li>
										<li class="float-right"><a href="#" class="s-color">Lost Your Password?</a></li>
									</ul>
									<button class="p-bg-color hvr-trim">Login</button>
					        	</div>
					        </form>
					        <div><a href="sign-up.html" class="p-color tran3s">Not an account?? Sign Up</a></div>
					    </div> <!-- /.modal-body -->
				    </div> <!-- /.modal-content -->
				</div> <!-- /.modal-dialog -->
			</div> <!-- /.signInModal -->


			<!-- Scroll Top Button -->
			<button class="scroll-top tran3s">
				<i class="fa fa-angle-up" aria-hidden="true"></i>
			</button>
			


		<!-- Js File_________________________________ -->

		<!-- j Query -->
		<script type="text/javascript" src="vendor/jquery.2.2.3.min.js"></script>
		<!-- Bootstrap Select JS -->
		<script type="text/javascript" src="vendor/bootstrap-select/dist/js/bootstrap-select.js"></script>

		<!-- Bootstrap JS -->
		<script type="text/javascript" src="vendor/bootstrap/bootstrap.min.js"></script>

		<!-- Vendor js _________ -->
		<!-- Camera Slider -->
		<script type='text/javascript' src='vendor/Camera-master/scripts/jquery.mobile.customized.min.js'></script>
	    <script type='text/javascript' src='vendor/Camera-master/scripts/jquery.easing.1.3.js'></script> 
	    <script type='text/javascript' src='vendor/Camera-master/scripts/camera.min.js'></script>
	    <!-- Mega menu  -->
		<script type="text/javascript" src="vendor/bootstrap-mega-menu/js/menu.js"></script>
		
		<!-- WOW js -->
		<script type="text/javascript" src="vendor/WOW-master/dist/wow.min.js"></script>
		<!-- owl.carousel -->
		<script type="text/javascript" src="vendor/owl-carousel/owl.carousel.min.js"></script>
		<!-- js count to -->
		<script type="text/javascript" src="vendor/Counter/jquery.counterup.min.js"></script>
		<script src="vendor/Counter/jquery.waypoints.min.js"></script>

		<!-- Theme js -->
		<script type="text/javascript" src="js/theme.js"></script>

		</div> <!-- /.main-page-wrapper -->
	</body>
</html>