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

		<title>Hapourse - Online Study Website</title>

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
											<li><a href="Signup.jsp">Registration</a></li>
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
			<div id="theme-main-banner" class="banner-one">
				<div data-src="images/home/slide-5.jpg">
					<div class="camera_caption">
						<div class="container text-center">
							<h3 class="wow fadeInUp animated">Hapourse - Do It Today, Don't Delay</h3>
							<h1 class="wow fadeInUp animated" data-wow-delay="0.2s"> Hapourse<span class="s-color"> Draw Your Future </span></h1>
							<a href="course-2-column.html" class="tran3s wow fadeInLeft animated banner-button" data-wow-delay="0.3s">Learn Now!</a>
							<a href="Signup.jsp" class="tran3s wow fadeInRight animated button-one banner-button hvr-trim" data-wow-delay="0.3s">Sign Up Now!</a>
						</div> <!-- /.container -->
					</div> <!-- /.camera_caption -->
				</div>
				<div data-src="images/home/slide-7.jpg">
					<div class="camera_caption">
						<div class="container text-center">
							<h3 class="wow fadeInUp animated">Hapourse - Do It Today, Don't Delay</h3>
							<h1 class="wow fadeInUp animated" data-wow-delay="0.2s">Hapourse <span class="s-color"> Draw Your Future</span></h1>
							<a href="course-2-column.html" class="tran3s wow fadeInLeft animated banner-button" data-wow-delay="0.3s">Learn Now!</a>
							<a href="Signup.jsp" class="tran3s wow fadeInRight animated button-one banner-button hvr-trim" data-wow-delay="0.3s">Sign Up Now!</a>
						</div> <!-- /.container -->
					</div> <!-- /.camera_caption -->
				</div>
			</div> <!-- /#theme-main-banner -->


			
			<!-- 
			=============================================
				Find Course Form
			============================================== 
			-->
			<div class="find-course">
				<div class="opacity color-one">
					<div class="container">
						<form action="#">
							<div class="row">
								<div class="col-md-3 col-xs-6">
									<div class="single-input">
										<select class="selectpicker">
											<option>All Categories</option>
											<option>Course Demo one</option>
											<option>Course Demo two</option>
											<option>Course Demo three</option>
										</select>
									</div> <!-- /.single-input -->
								</div> <!-- /.col -->
								<div class="col-md-3 col-xs-6">
									<div class="single-input">
										<select class="selectpicker">
											<option>Filter</option>
											<option>Course filter one</option>
											<option>Course filter two</option>
											<option>Course filter three</option>
										</select>
									</div> <!-- /.single-input -->
								</div> <!-- /.col -->
								<div class="col-md-4 col-sm-8 col-xs-12">
									<div class="single-input">
										<select class="selectpicker">
											<option>What you want to learn today?</option>
											<option>Advance HTML Courses</option>
											<option>Advance PHP Courses</option>
											<option>Advance JAVA Courses</option>
										</select>
									</div> <!-- /.single-input -->
								</div> <!-- /.col -->
								<div class="col-md-2 col-sm-4 col-xs-12"><button class="action-button tran3s">Search Now <i class="fa fa-search" aria-hidden="true"></i></button></div>
							</div> <!-- /.row -->
						</form>
					</div> <!-- /.container -->
				</div> <!-- /.opacity -->
			</div> <!-- /.find-course -->



			
			<!-- 
			=============================================
				Find Course Block
			============================================== 
			-->
			<div class="find-course-block">
				<div class="container">
					<div class="theme-title text-center">
						<h6>Choose Your Course</h6>
						<h2>We Have Tones of Course for You!!</h2>
					</div> <!-- /.theme-title -->
					<div class="clearfix">
						<div class="single-block float-left tran3s">
							<i class="flaticon-diamond"></i>
							<h5>UI/UX Design</h5>
							<p>There are many variations of passages of check Lorem Ipsum availablebut the majority have suffered alteration</p>
							<a href="course-details.html" class="tran3s"><i class="flaticon-arrows"></i></a>
						</div> <!-- /.single-block -->
						<div class="single-block float-left tran3s">
							<i class="flaticon-connection"></i>
							<h5>Communication</h5>
							<p>There are many variations of passages of check Lorem Ipsum availablebut the majority have suffered alteration</p>
							<a href="course-details.html" class="tran3s"><i class="flaticon-arrows"></i></a>
						</div> <!-- /.single-block -->
						<div class="single-block float-left tran3s">
							<i class="flaticon-photo-camera"></i>
							<h5>Photography</h5>
							<p>There are many variations of passages of check Lorem Ipsum availablebut the majority have suffered alteration</p>
							<a href="course-details.html" class="tran3s"><i class="flaticon-arrows"></i></a>
						</div> <!-- /.single-block -->
						<div class="single-block float-left tran3s">
							<i class="flaticon-briefcase"></i>
							<h5>Online Marketing</h5>
							<p>There are many variations of passages of check Lorem Ipsum availablebut the majority have suffered alteration</p>
							<a href="course-details.html" class="tran3s"><i class="flaticon-arrows"></i></a>
						</div> <!-- /.single-block -->
						<div class="single-block float-left tran3s">
							<i class="flaticon-compose"></i>
							<h5>Illustrator &amp; Vector</h5>
							<p>There are many variations of passages of check Lorem Ipsum availablebut the majority have suffered alteration</p>
							<a href="course-details.html" class="tran3s"><i class="flaticon-arrows"></i></a>
						</div> <!-- /.single-block -->
						<div class="single-block float-left tran3s">
							<i class="flaticon-coding"></i>
							<h5>Design &amp; Development</h5>
							<p>There are many variations of passages of check Lorem Ipsum availablebut the majority have suffered alteration</p>
							<a href="course-details.html" class="tran3s"><i class="flaticon-arrows"></i></a>
						</div> <!-- /.single-block -->
					</div>
				</div> <!-- /.container -->
			</div> <!-- /.find-course-block -->

			
			<!-- 
			=============================================
				Registration Banner  
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
									<h2>We Have More <br>Than <span class="p-color">28,690+Student</span> Currently Useing Hapourse</h2>

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
			<div class="popular-course">
				<div class="container">
					<div class="theme-title">
						<h6>Featured Course</h6>
						<h2>Populer Course</h2>
						<a href="course-grid.html" class="tran3s">See All Course</a>
					</div> <!-- /.theme-title -->

					<div class="row">
						<div class="col-md-4 col-xs-6 wow fadeInUp">
							<div class="single-course">
								<div class="image-box"><img src="images/course/2.jpg" alt=""></div>
								<div class="text">
									<div class="image"><img src="images/course/5.jpg" alt=""></div>
									<div class="name clearfix">
										<h6 class="float-left">Abdus Salam</h6>
										<strong class="s-color float-right">$79<sup>.99</sup></strong>
									</div>
									<h5><a href="course-details.html" class="tran3s">Angular 2 Essential Training JavaScript Framework</a></h5>
									<p>Lorem ipsum dolor sit amet, duo vide etiam periculis ei, ius in lorem iuvaret. Cum nemro assum copiosae despite...</p>
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
						<div class="col-md-4 hidden-sm col-xs-6 wow fadeInRight">
							<div class="single-course">
								<div class="image-box"><img src="images/course/3.jpg" alt=""></div>
								<div class="text">
									<div class="image"><img src="images/course/6.jpg" alt=""></div>
									<div class="name clearfix">
										<h6 class="float-left">Jhon Doe</h6>
										<span class="p-bg-color float-right">Free</span>
									</div>
									<h5><a href="course-details.html" class="tran3s">Angular 2 Essential Training JavaScript Framework</a></h5>
									<p>Lorem ipsum dolor sit amet, duo vide etiam periculis ei, ius in lorem iuvaret. Cum nemro assum copiosae despite...</p>
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
					</div> <!-- /.row -->
				</div> <!-- /.container -->
			</div> <!-- /.popular-course -->



			<!-- 
			=============================================
				Theme Counter Section
			============================================== 
			-->
			<div class="theme-counter">
				<div class="count-particles">
  					<span class="js-count-particles">--</span>
				</div>
				<div id="particles-js"></div>
				<div class="opacity">
					<div class="container">
						<div class="row">
							<div class="col-sm-3 col-xs-6">
								<h3><span class="counter">85,873</span>+</h3>
								<p>Students</p>
							</div>
							<div class="col-sm-3 col-xs-6">
								<h3><span class="counter">468</span>+</h3>
								<p>Courses</p>
							</div>
							<div class="col-sm-3 col-xs-6">
								<h3><span class="counter">1,729</span>+</h3>
								<p>Projects</p>
							</div>
							<div class="col-sm-3 col-xs-6">
								<h3><span class="counter">2,560</span>+</h3>
								<p>Ratings</p>
							</div>
						</div>
					</div> <!-- /.container -->
				</div> <!-- /.opacity -->
			</div> <!-- /.theme-counter -->
			


			<!-- 
			=============================================
				Our Pricing Plan
			============================================== 
			-->
			<div class="our-pricing-plan">
				<div class="container">
					<div class="theme-title text-center">
						<h2>Pick Your Plan. <span>No Hidden Charge!!</span></h2>
						<p>Other technological advances made during the Paleolithic era were clothing and shelter  both technologies cannot <br>be dated exactly, but they were a key to humanity's progress. </p>
					</div> <!-- /.theme-title -->

					<div class="clearfix">
						<div class="single-plan-table tran3s">
							<h6>Startup</h6>
							<strong><sub>$</sub> 17 <sup>99 <span>/ Mo.</span></sup></strong>
							<ul>
								<li>100 Free Classes</li>
								<li><del>960 Premium Classes</del></li>
								<li>Expert Community (iOS, Android)</li>
								<li><del>Cross Platforms Apps</del></li>
								<li><del>Offline Access</del></li>
								<li>Support Teachers</li>
							</ul>
							<a href="#" class="tran3s hvr-trim">Buy now </a>
						</div> <!-- /.single-plan-table -->
						<div class="single-plan-table tran3s">
							<h6>Growth</h6>
							<strong><sub>$</sub> 29 <sup>99 <span>/ Mo.</span></sup></strong>
							<ul>
								<li>100 Free Classes</li>
								<li><del>960 Premium Classes</del></li>
								<li>Expert Community (iOS, Android)</li>
								<li><del>Cross Platforms Apps</del></li>
								<li>Offline Access</li>
								<li>Support Teachers</li>
							</ul>
							<a href="#" class="tran3s hvr-trim">Buy now </a>
						</div> <!-- /.single-plan-table -->
						<div class="single-plan-table tran3s">
							<h6>Premium</h6>
							<strong><sub>$</sub> 69 <sup>99 <span>/ Mo.</span></sup></strong>
							<ul>
								<li>100 Free Classes</li>
								<li>960 Premium Classes</li>
								<li>Expert Community (iOS, Android)</li>
								<li><del>Cross Platforms Apps</del></li>
								<li>Offline Access</li>
								<li>Support Teachers</li>
							</ul>
							<a href="#" class="tran3s hvr-trim">Buy now </a>
						</div> <!-- /.single-plan-table -->
						<div class="single-plan-table tran3s fix">
							<h6>Enterprise</h6>
							<strong><sub>$</sub> 369 <sup>99 <span>/ Mo.</span></sup></strong>
							<ul>
								<li>100 Free Classes</li>
								<li>960 Premium Classes</li>
								<li>Expert Community (iOS, Android)</li>
								<li>Cross Platforms Apps</li>
								<li>Offline Access</li>
								<li>Support Teachers</li>
							</ul>
							<a href="#" class="tran3s hvr-trim">Buy now </a>
						</div> <!-- /.single-plan-table -->
					</div>
				</div> <!-- /.container -->
			</div> <!-- /.our-pricing-plan -->
			


			<!-- 
			=============================================
				Testimonial Style One
			============================================== 
			-->
			<div class="testimonial-styleOne">
				<div class="container">
					<div class="theme-title text-center">
						<h2>Testimonials</h2>
						<p>Still need convincing? Check out what people are saying about Singleton. </p>
					</div> <!-- /.theme-title -->

					<div id="testimonial-carousel-one" class="carousel slide" data-ride="carousel" data-interval="5000">
						<!-- Indicators -->
						<ol class="carousel-indicators">
							<li data-target="#testimonial-carousel-one" data-slide-to="0" class="active tran3s" title="Jenna Simpson"><img src="images/home/4.jpg" alt=""></li>
							<li data-target="#testimonial-carousel-one" data-slide-to="1" class="tran3s" title="Abdus Salam"><img src="images/home/5.jpg" alt=""></li>
							<li data-target="#testimonial-carousel-one" data-slide-to="2" class="tran3s" title="Solayman Mi."><img src="images/home/6.jpg" alt=""></li>
							<li data-target="#testimonial-carousel-one" data-slide-to="3" class="tran3s" title="Giyas Uddin"><img src="images/home/7.jpg" alt=""></li>
							<li data-target="#testimonial-carousel-one" data-slide-to="4" class="tran3s" title="Alom Bepari"><img src="images/home/6.jpg" alt=""></li>
							<li data-target="#testimonial-carousel-one" data-slide-to="5" class="tran3s" title="Solayman Mi."><img src="images/home/8.jpg" alt=""></li>
						</ol>

					  	<div class="main-wrapper">
					  		<div class="shadow"></div>
					  		<!-- Wrapper for slides -->
						  	<div class="carousel-inner">
							    <div class="item active">
								    <img src="images/home/4.jpg" alt="">
								    <h6>Jenna Simpson</h6>
								    <span>Dropbox</span>
								    <p>As we passed, I remarked a beautiful church-spire rising above some old elms in the park; and before them, in the midst of a lawn, and some outhouses, an old red house with tall chimneys covered with ivy, and the windows shining in the sun.</p>
							    </div>

							    <div class="item">
							    	<img src="images/home/5.jpg" alt="">
								    <h6>Abdus Salam</h6>
								    <span>Google</span>
								    <p>As we passed, I remarked a beautiful church-spire rising above some old elms in the park; and before them, in the midst of a lawn, and some outhouses, an old red house with tall chimneys covered with ivy, and the windows shining in the sun.</p>
							    </div>

							    <div class="item">
							    	<img src="images/home/6.jpg" alt="">
								    <h6>Solayman Mi.</h6>
								    <span>Mega Nz</span>
								    <p>As we passed, I remarked a beautiful church-spire rising above some old elms in the park; and before them, in the midst of a lawn, and some outhouses, an old red house with tall chimneys covered with ivy, and the windows shining in the sun.</p>
							    </div>

							    <div class="item">
							    	<img src="images/home/7.jpg" alt="">
								    <h6>Giyas Uddin</h6>
								    <span>Upwork</span>
								    <p>As we passed, I remarked a beautiful church-spire rising above some old elms in the park; and before them, in the midst of a lawn, and some outhouses, an old red house with tall chimneys covered with ivy, and the windows shining in the sun.</p>
							    </div>

							    <div class="item">
							    	<img src="images/home/6.jpg" alt="">
								    <h6>Alom Bepari</h6>
								    <span>Google</span>
								    <p>As we passed, I remarked a beautiful church-spire rising above some old elms in the park; and before them, in the midst of a lawn, and some outhouses, an old red house with tall chimneys covered with ivy, and the windows shining in the sun.</p>
							    </div>

							    <div class="item">
							    	<img src="images/home/8.jpg" alt="">
								    <h6>Solayman Mi.</h6>
								    <span>Mega Nz</span>
								    <p>As we passed, I remarked a beautiful church-spire rising above some old elms in the park; and before them, in the midst of a lawn, and some outhouses, an old red house with tall chimneys covered with ivy, and the windows shining in the sun.</p>
							    </div>
						  	</div> <!-- /.carousel-inner -->

						  	<!-- Left and right controls -->
							<a class="left carousel-control" href="#testimonial-carousel-one" data-slide="prev">
							    <i class="fa fa-chevron-left" aria-hidden="true"></i>
							    <span class="sr-only">Previous</span>
							</a>
							<a class="right carousel-control" href="#testimonial-carousel-one" data-slide="next">
							    <i class="fa fa-chevron-right" aria-hidden="true"></i>
							    <span class="sr-only">Next</span>
							</a>
					  	</div> <!-- /.main-wrapper -->
					</div> <!-- /#testimonial-carousel-one -->
				</div> <!-- /.container -->
			</div> <!-- /.testimonial-styleOne -->


			<!-- 
			=============================================
				Our Blog
			============================================== 
			-->
			<div class="our-blog">
				<div class="container">
					<div class="theme-title">
						<h2>Recent News</h2>
						<a href="blog-grid.html" class="tran3s">Go to News</a>
					</div> <!-- /.theme-title -->
					<div class="row">
						<div class="col-md-4 col-sm-6">
							<div class="single-blog">
								<div class="image"><img src="images/blog/1.jpg" alt=""></div>
								<ul>
									<li>
										<i class="flaticon-comments"></i>
										<a href="#" class="tran3s">13</a>
									</li>
									<li>
										<i class="flaticon-heart"></i>
										<a href="#" class="tran3s">3</a>
									</li>
								</ul>
								<h4><a href="blog-details.html" class="tran3s">Build Education Website...</a></h4>
								<p>At about the same time, Rahul Roy Chowdhury took charge of Google team that oversees...</p>
								<a href="blog-details.html" class="tran3s">Read More</a>
							</div> <!-- /.single-blog -->
						</div> <!-- /.col- -->
						<div class="col-md-4 col-sm-6">
							<div class="single-blog">
								<div class="image"><img src="images/blog/2.jpg" alt=""></div>
								<ul>
									<li>
										<i class="flaticon-comments"></i>
										<a href="#" class="tran3s">13</a>
									</li>
									<li>
										<i class="flaticon-heart"></i>
										<a href="#" class="tran3s">3</a>
									</li>
								</ul>
								<h4><a href="blog-details.html" class="tran3s">Build Education Website...</a></h4>
								<p>At about the same time, Rahul Roy Chowdhury took charge of Google team that oversees...</p>
								<a href="blog-details.html" class="tran3s">Read More</a>
							</div> <!-- /.single-blog -->
						</div> <!-- /.col- -->
						<div class="col-md-4 hidden-sm">
							<div class="single-blog">
								<div class="image"><img src="images/blog/3.jpg" alt=""></div>
								<ul>
									<li>
										<i class="flaticon-comments"></i>
										<a href="#" class="tran3s">13</a>
									</li>
									<li>
										<i class="flaticon-heart"></i>
										<a href="#" class="tran3s">3</a>
									</li>
								</ul>
								<h4><a href="blog-details.html" class="tran3s">Build Education Website...</a></h4>
								<p>At about the same time, Rahul Roy Chowdhury took charge of Google team that oversees...</p>
								<a href="blog-details.html" class="tran3s">Read More</a>
							</div> <!-- /.single-blog -->
						</div> <!-- /.col- -->
					</div> <!-- /.row -->
				</div> <!-- /.container -->
			</div> <!-- /.our-blog -->


			<!-- 
			=============================================
				Instructor Banner
			============================================== 
			-->
			<div class="instructor-banner">
				<div class="opacity opacity-one">
					<div class="container">
						<h4>Become An Instructor</h4>
						<h2>Spread Your Skills Worldwide </h2>
						<a href="#" class="tran3s hvr-trim">Get Started Now</a>
					</div> <!-- /.container -->
				</div> <!-- /.opacity -->
			</div> <!-- /.instructor-banner -->


			<!-- 
			=============================================
				Partner Logo
			============================================== 
			-->
			<div class="partent-logo-section">
				<div class="container">
					<div id="partner-logo">
						<div class="item"><img src="images/logo/p-1.png" alt="logo"></div>
						<div class="item"><img src="images/logo/p-2.png" alt="logo"></div>
						<div class="item"><img src="images/logo/p-3.png" alt="logo"></div>
						<div class="item"><img src="images/logo/p-4.png" alt="logo"></div>
					</div>
				</div>
			</div> <!-- /.partent-logo-section -->



			
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
								<a href="index.jsp"><img src="images/logo/x.png" alt="Logo"></a>
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
					        <form action="Login" method="Post">
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
		<!-- partical Js -->
		<script type="text/javascript" src="vendor/particles.js-master/particles.min.js"></script>
		<script type="text/javascript" src="vendor/particles.js-master/demo/js/lib/stats.js"></script>
		<script type="text/javascript" src="vendor/particles.js-master/demo/js/app.js"></script>

		<!-- Theme js -->
		<script type="text/javascript" src="js/theme.js"></script>

		</div> <!-- /.main-page-wrapper -->
	</body>
</html>