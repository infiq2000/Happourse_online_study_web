<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<!-- For IE -->
		<meta http-equiv="X-UA-Compatible" content="IE=edge">

		<!-- For Resposive Device -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

		<title>Eskul - Responsive Bootstrap  Education HTML5 Template</title>

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
			<jsp:include page="Header.jsp"></jsp:include>
			
			<!-- 
			=============================================
				Theme Inner Banner
			============================================== 
			-->
			<div class="inner-banner">
				<div class="opacity">
					<div class="container">
						<h2>User  Profile</h2>
						<ul>
							<li><a href="index.html" class="tran3s">Home</a></li>
							<li>/</li>
							<li><a href="#">pages</a></li>
							<li>/</li>
							<li>Instructor</li>
						</ul>
					</div> <!-- /.container -->
				</div> <!-- /.opacity -->
			</div> <!-- /.inner-banner -->



			<!-- 
			=============================================
				Our Instructors Profile
			============================================== 
			-->
			<div class="our-instructor-profile">
				<div class="container">
					<div class="row">
						<div class="col-md-4 col-sm-6 col-xs-12">
							<img src="images/team/96.jpg" alt="">
							<input style="margin-top:20px;" type="file" name="uploadField"/>
						</div>
						<div class="col-md-8 col-xs-12">
							<div class="text">
								<div class="title">
									<h4>${user_info.getFull_name() }</h4>
									<span>${user_info.getMajor()} &amp; Developer</span>
								</div> <!-- /.title -->
								<ul class="social-media">
									<li><a href="" class="tran3s"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
									<li><a href="" class="tran3s"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
									<li><a href="" class="tran3s"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
									<li><a href="" class="tran3s"><i class="fa fa-dribbble" aria-hidden="true"></i></a></li>
								</ul>
								<p>SUZY - NAMDOSAN</p>
								<ul class="instructor-achivement clearfix">
									<li>Total Course <h3>4</h3></li>
								</ul>
							</div> <!-- /.text -->
						</div> <!-- /.col- -->
					</div> <!-- /.row -->
				</div> <!-- /.container -->
			</div> <!-- /.our-instructor-profile -->


			<!-- 
			=============================================
				Teachers Course
			============================================== 
			-->
			<div class="teachers-course popular-course">
				<div class="container">
					<h3>Courses by Lopa Murai</h3>
					<div class="row">
						<div class="teachers-course-slider">
							<div class="item">
								<div class="single-course">
									<div class="image-box"><img src="images/course/1.jpg" alt=""></div>
									<div class="text">
										<div class="image"><img src="images/course/4.jpg" alt=""></div>
										<div class="name clearfix">
											<h6 class="float-left">Jannatul</h6>
											<span class="p-bg-color float-right">Free</span>
										</div>
										<h5><a href="course-details.html" class="tran3s">Angular 2 Essential Training JavaScript Framework</a></h5>
										<ul class="clearfix">
											<li class="float-left">
												<i class="flaticon-people"></i>
												<a href="#" class="tran3s">2,680</a>
											</li>
											<li class="float-left">
												<i class="flaticon-comments"></i>
												<a href="#" class="tran3s">13</a>
											</li>
											<li class="float-right">
												<i class="flaticon-heart"></i>
												<a href="#" class="tran3s">3</a>
											</li>
										</ul>
									</div>
								</div> <!-- /.single-course -->
							</div> <!-- /.col- -->
							<div class="item">
								<div class="single-course">
									<div class="image-box"><img src="images/course/2.jpg" alt=""></div>
									<div class="text">
										<div class="image"><img src="images/course/4.jpg" alt=""></div>
										<div class="name clearfix">
											<h6 class="float-left">Jannatul</h6>
											<strong class="s-color float-right">$79<sup>.99</sup></strong>
										</div>
										<h5><a href="course-details.html" class="tran3s">Angular 2 Essential Training JavaScript Framework</a></h5>
										<ul class="clearfix">
											<li class="float-left">
												<i class="flaticon-people"></i>
												<a href="#" class="tran3s">2,680</a>
											</li>
											<li class="float-left">
												<i class="flaticon-comments"></i>
												<a href="#" class="tran3s">13</a>
											</li>
											<li class="float-right">
												<i class="flaticon-heart"></i>
												<a href="#" class="tran3s">3</a>
											</li>
										</ul>
									</div>
								</div> <!-- /.single-course -->
							</div> <!-- /.col- -->
							<div class="item">
								<div class="single-course">
									<div class="image-box"><img src="images/course/3.jpg" alt=""></div>
									<div class="text">
										<div class="image"><img src="images/course/4.jpg" alt=""></div>
										<div class="name clearfix">
											<h6 class="float-left">Jannatul</h6>
											<span class="p-bg-color float-right">Free</span>
										</div>
										<h5><a href="course-details.html" class="tran3s">Angular 2 Essential Training JavaScript Framework</a></h5>
										<ul class="clearfix">
											<li class="float-left">
												<i class="flaticon-people"></i>
												<a href="#" class="tran3s">2,680</a>
											</li>
											<li class="float-left">
												<i class="flaticon-comments"></i>
												<a href="#" class="tran3s">13</a>
											</li>
											<li class="float-right">
												<i class="flaticon-heart"></i>
												<a href="#" class="tran3s">3</a>
											</li>
										</ul>
									</div>
								</div> <!-- /.single-course -->
							</div> <!-- /.col- -->
							<div class="item">
								<div class="single-course">
									<div class="image-box"><img src="images/course/2.jpg" alt=""></div>
									<div class="text">
										<div class="image"><img src="images/course/4.jpg" alt=""></div>
										<div class="name clearfix">
											<h6 class="float-left">Jannatul</h6>
											<span class="p-bg-color float-right">Free</span>
										</div>
										<h5><a href="course-details.html" class="tran3s">Angular 2 Essential Training JavaScript Framework</a></h5>
										<ul class="clearfix">
											<li class="float-left">
												<i class="flaticon-people"></i>
												<a href="#" class="tran3s">2,680</a>
											</li>
											<li class="float-left">
												<i class="flaticon-comments"></i>
												<a href="#" class="tran3s">13</a>
											</li>
											<li class="float-right">
												<i class="flaticon-heart"></i>
												<a href="#" class="tran3s">3</a>
											</li>
										</ul>
									</div>
								</div> <!-- /.single-course -->
							</div> <!-- /.col- -->
						</div>
					</div> <!-- /.row -->
				</div> <!-- /.container -->
			</div> <!-- /.teachers-course -->



			
			<!-- 
			=============================================
				Footer
			============================================== 
			-->
			<footer>
				<div class="container">
					<div class="row">
						<div class="col-md-3 col-sm-6">
							<div class="footer-logo">
								<a href="index.html"><img src="images/logo/logo2.png" alt="Logo"></a>
								<p>It was some time before he obtained any answer, and the reply, when made, was unpropitious.</p>
								<ul>
									<li><a href="" class="tran3s"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
									<li><a href="" class="tran3s"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
									<li><a href="" class="tran3s"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
									<li><a href="" class="tran3s"><i class="fa fa-dribbble" aria-hidden="true"></i></a></li>
								</ul>
							</div>
						</div>
						<div class="col-md-2 col-sm-3 footer-list">
							<h6>Company</h6>
							<ul>
								<li><a href="about-us.html" class="tran3s">About Us</a></li>
								<li><a href="blog-grid.html" class="tran3s">Blog</a></li>
								<li><a href="#" class="tran3s">Become a Teacher</a></li>
								<li><a href="contact-us.html" class="tran3s">Contact</a></li>
								<li><a href="faq.html" class="tran3s">Faq &amp; Plicy</a></li>
							</ul>
						</div>
						<div class="col-md-2 col-sm-3 footer-list">
							<h6>Product</h6>
							<ul>
								<li><a href="#" class="tran3s">Education Pack</a></li>
								<li><a href="#" class="tran3s">Eucation Starter</a></li>
								<li><a href="#" class="tran3s">Features &amp; Skills</a></li>
								<li><a href="#" class="tran3s">Pricing</a></li>
								<li><a href="#" class="tran3s">Sell Your Products</a></li>
							</ul>
						</div>
						<div class="col-md-2 col-sm-6 footer-list">
							<h6>About us</h6>
							<ul>
								<li><a href="blog-list.html" class="tran3s">Blog</a></li>
								<li><a href="#" class="tran3s">Toll Free Number</a></li>
								<li><a href="#" class="tran3s">Press Releases</a></li>
								<li><a href="#" class="tran3s">Jobs</a></li>
								<li><a href="#" class="tran3s">Feedback</a></li>
							</ul>
						</div>
						<div class="col-md-3 col-sm-6 col-xs-12 footer-subscribe">
							<h6>Subscribe Us</h6>
							<p>This sounded a very good reason, and Alice was quite pleased.</p>
							<form action="#">
								<input type="text" placeholder="Your Email">
								<button class="tran3s p-bg-color"><i class="flaticon-envelope-back-view-outline"></i></button>
							</form>
						</div>
					</div> <!-- /.row -->
				</div> <!-- /.container -->

				<div class="bottom-footer">
					<div class="container">
						<ul class="float-right">
							<li><h3><span class="counter p-color">8,997</span> Products</h3></li>
							<li><h3><span class="counter p-color">53,701</span> Members</h3></li>
							<li><h3><span class="counter p-color">1,119</span> Shops</h3></li>
						</ul>
						<p class="float-left">&copy; 2019 <a href="#" class="tran3s p-color">heloshape</a>. All rights reserved</p>		
					</div>
				</div> <!-- /.bottom-footer -->
			</footer>


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