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

		<title>Happourse - Online Study Website </title>

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
						<div class="logo float-left tran4s"><a href="index.jsp"><img src="images/logo/logo.png" alt="Logo"></a></div>

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
									<li class="dropdown-holder menu-list"><a href="index.html" class="tran3s">Home</a>
										<ul class="sub-menu">
											<li><a href="index.html">Home version one</a></li>
											<li><a href="index-2.html">Home version Two</a></li>
										</ul>
									</li>
									<li class="dropdown-holder menu-list"><a href="#" class="tran3s">Course</a>
										<ul class="sub-menu">
											<li><a href="course-grid.html">Course grid</a></li>
											<li><a href="course-list.html">Course List</a></li>
											<li><a href="course-details.html">Course Details</a></li>
											<li class="dropdown-holder"><a href="#">Third Level menu</a>
												<ul class="second-sub-menu">
													<li><a href="#">menu one</a></li>
													<li><a href="#">menu two</a></li>
												</ul>
											</li>
										</ul>
									</li>
									<li class="dropdown-holder menu-list"><a href="#" class="tran3s">Pages</a>
										<ul class="sub-menu width-half">
											<li><a href="about-us.html">About Us</a></li>
											<li><a href="our-teacher.html">Our teacher</a></li>
											<li><a href="teachers-profile.html">teachers profile</a></li>
											<li><a href="shop.html">Shop page</a></li>
											<li><a href="shop-details.html">Shop Details</a></li>
											<li><a href="portfolio-3-column.html">portfolio 3 column</a></li>
											<li><a href="portfolio-4-column.html">portfolio 4 column</a></li>
											<li><a href="pricing-plan.html">Pricing Plan</a></li>
											<li><a href="faq.html">Faq Page</a></li>
											<li><a href="404.html">Error Page</a></li>
											<li><a href="sign-up.html">Registration</a></li>
											<li class="dropdown-holder"><a href="#">Third Level menu</a>
												<ul class="second-sub-menu">
													<li><a href="#">menu one</a></li>
													<li><a href="#">menu two</a></li>
												</ul>
											</li>
										</ul>
									</li>
									<li class="dropdown-holder menu-list"><a href="#" class="tran3s">Event</a>
										<ul class="sub-menu">
											<li><a href="event-list.html">Event List</a></li>
											<li><a href="event-grid.html">Event Grid</a></li>
											<li><a href="event-details.html">Event Single</a></li>
										</ul>
									</li>
									<li class="dropdown-holder menu-list"><a href="#" class="tran3s">Blog</a>
										<ul class="sub-menu">
											<li><a href="blog-grid.html">Blog grid</a></li>
											<li><a href="blog-list.html">Blog List</a></li>
											<li><a href="blog-details.html">blog Details</a></li>
										</ul>
									</li>
									<li><a href="contact-us.html" class="tran3s">Contact Us</a></li>
									<li class="login"><button class="tran3s" data-toggle="modal" data-target=".signInModal"><i class="flaticon-lock"></i> Login</button></li>
								</ul>
						   </div><!-- /.navbar-collapse -->
						</nav> <!-- /.theme-main-menu -->
					</div> <!-- /.header-wrapper -->
				</div>
			</header> <!-- /.theme-menu-wrapper -->
			
			<!-- 
			=============================================
				Theme Main Banner
			============================================== 
			-->
			<div class="modal fade signInModal theme-modal-box" role="dialog">
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
					        <p style="color: red;">${errorString}</p>
					        <form action="Login" method="post">
					        	<h3>Login with Site Account</h3>
					        	<div class="wrapper">
					        		<!-- // Sửa ở đây -->
					        		<input name="username" type="text" placeholder="Username or Email">
					        		<input name="password" type="password" placeholder="Password">
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
					        <div><a href="sign-up.html" class="p-color tran3s">Not an account? Sign Up</a></div>
					    </div> <!-- /.modal-body -->
				    </div> <!-- /.modal-content -->
				</div> <!-- /.modal-dialog -->
			</div> <!-- /.signInModal -->
			<div id="theme-main-banner" class="banner-one">
				<div data-src="images/home/slide-5.jpg">
					<div class="camera_caption">
						<div class="container text-center">
							<h3 class="wow fadeInUp animated">Happourse - Học là vui, vui là không chán</h3>
							<h1 class="wow fadeInUp animated" data-wow-delay="0.2s"> Happourse<span class="s-color"> The way of learning of the future </span></h1>
							<a href="course-2-column.html" class="tran3s wow fadeInLeft animated banner-button" data-wow-delay="0.3s">Học nào!</a>
							<a href="Signup.jsp" class="tran3s wow fadeInRight animated button-one banner-button hvr-trim" data-wow-delay="0.3s">Đăng kí thoai!</a>
						</div> <!-- /.container -->
					</div> <!-- /.camera_caption -->
				</div>
				<div data-src="images/home/slide-6.jpg">
					<div class="camera_caption">
						<div class="container text-center">
							<h3 class="wow fadeInUp animated">Happourse - Học là vui, vui là không chán</h3>
							<h1 class="wow fadeInUp animated" data-wow-delay="0.2s">Happourse <span class="s-color"> The way of learning of the future</span></h1>
							<a href="course-2-column.html" class="tran3s wow fadeInLeft animated banner-button" data-wow-delay="0.3s">Học nào</a>
							<a href="Signup.jsp" class="tran3s wow fadeInRight animated button-one banner-button hvr-trim" data-wow-delay="0.3s">Đăng kí thoai!</a>
						</div> <!-- /.container -->
					</div> <!-- /.camera_caption -->
				</div>
			</div> <!-- /#theme-main-banner -->


			
			<!-- 
			=============================================
				Find Course Form
			============================================== 
			-->

			<div class="registration-banner">
				<div class="opacity">
					<div class="container">
						<div class="row">
							<div class="col-md-5 col-xs-12">
								<div class="registration-form">
									<form action="#">
										<h2>Register Now</h2>
										<p>Create  your account and browse thousand of courses!!</p>
										<div class="form-wrapper">
											<h6>Your Full Name</h6>
											<input type="text" placeholder="Your Name">
											<h6>Your EMail</h6>
											<input type="email" placeholder="sample@email.com">
											<h6>Mobile Number</h6>
											<input type="text" placeholder="+880 854 875 971">
											<button class="tran3s hvr-trim">SIGN UP NOW!!</button>
										</div> <!-- /.form-wrapper -->
									</form>
								</div> <!-- /.registration-form -->
							</div>

							<div class="col-md-7 col-xs-12">
								<div class="text-wrapper">
									<h2>We Have More <br>Than <span class="p-color">28,690+Student</span> Currently Useing Eskul</h2>

									<ul class="clearfix">
										<li class="float-left">
											<div class="single-box">
						        				<h3><span class="counter">8,759</span></h3>
						        				<p>Currently Use</p>
						        			</div> <!-- /.single-box -->
										</li>
										<li class="float-left">
											<div class="single-box">
						        				<h3><span class="counter">42</span>M</h3>
						        				<p>Total Students</p>
						        			</div> <!-- /.single-box -->
										</li>
										<li class="float-left">
											<div class="single-box">
						        				<h3><span class="counter">70,593</span></h3>
						        				<p>Finished Course</p>
						        			</div> <!-- /.single-box -->
										</li>
									</ul>
								</div>
							</div>
						</div> <!-- /.row -->
					</div> <!-- /.container -->
				</div> <!-- /.opacity -->
			</div> <!-- /.registration-banner -->


			<!-- 
			=============================================
				Popular Course 
			============================================== 
			-->	
			<!-- Sign-in Modal -->


	        

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
		<!-- partical Js -->
		<script type="text/javascript" src="vendor/particles.js-master/particles.min.js"></script>
		<script type="text/javascript" src="vendor/particles.js-master/demo/js/lib/stats.js"></script>
		<script type="text/javascript" src="vendor/particles.js-master/demo/js/app.js"></script>

		<!-- Theme js -->
		<script type="text/javascript" src="js/theme.js"></script>

		</div> <!-- /.main-page-wrapper -->
	</body>
</html>