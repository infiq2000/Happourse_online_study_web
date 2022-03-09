<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<!-- For IE -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge">

	<!-- For Resposive Device -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>Hapourse - Online Study Website </title>
	
	<!-- Favicon -->
	<link rel="icon" type="image/png" sizes="56x56" href="images/fav-icon/icon.png">
	
	
	<!-- Main style sheet -->
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<!-- responsive style sheet -->
	<link rel="stylesheet" type="text/css" href="css/responsive.css">
	
	<!-- Stylesheets -->
	<link href="css/ins/bootstrap.css" rel="stylesheet">
	<link href="css/ins/main.css" rel="stylesheet">
	<link href="css/ins/responsive.css" rel="stylesheet">
	
	<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;300;400;500;600;700;800;900&family=Roboto:wght@300;400;500;700;900&display=swap" rel="stylesheet">
	
	<!-- Color Switcher Mockup -->
	<link href="css/ins/color-switcher-design.css" rel="stylesheet">
	<!-- Color Themes -->
	<link id="theme-color-file" href="css/ins/color-themes/theme-one.css" rel="stylesheet">
	
	
	
	<!--[if lt IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.js"></script><![endif]-->
	<!--[if lt IE 9]><script src="js/ins/respond.js"></script><![endif]-->

</head>

<body class="">


 	
    <!-- Preloader -->
    <div class="preloader"></div>
 	
    <!-- Main Header-->
	<jsp:include page="Header.jsp"></jsp:include>
    <!--End Main Header -->
    
    
    <!-- 
	=============================================
		Theme Inner Banner
	============================================== 
	-->
	<jsp:include page="inner_banner.jsp" />
	
<div class="page-wrapper">

	<!-- Dashboard Section -->
    <div class="dashboard-section">
    	<div class="auto-container">
			<!-- Sec Title -->
			<div class="sec-title">
				<div class="clearfix">
					<div class="pull-left">
						<h4>Instructor Dashboard</h4>
					</div>
					<div class="pull-right">
						<a href="edit-course.html" class="see-all">Create Your Course</a>
					</div>
				</div>
			</div>
			
			<div class="row clearfix">
				
				<!-- Dashboard Block -->
				<div class="dashboard-block col-lg-3 col-md-6 col-sm-12">
					<div class="inner-box">
						<div class="content">
							<div class="icon-box">
								<span class="icon flaticon-article"></span>
							</div>
							<div class="courses">Total Courses<span>150</span></div>
						</div>
					</div>
				</div>
				
				<!-- Dashboard Block -->
				<div class="dashboard-block col-lg-3 col-md-6 col-sm-12">
					<div class="inner-box">
						<div class="content">
							<div class="icon-box">
								<span class="icon flaticon-coding"></span>
							</div>
							<div class="courses">Total Students<span>3506</span></div>
						</div>
					</div>
				</div>
				
				<!-- Dashboard Block -->
				<div class="dashboard-block col-lg-3 col-md-6 col-sm-12">
					<div class="inner-box">
						<div class="content">
							<div class="icon-box">
								<span class="icon flaticon-dollar-sign"></span>
							</div>
							<div class="courses">Total Sales<span>$1.5k</span></div>
						</div>
					</div>
				</div>
				
				<!-- Dashboard Block -->
				<div class="dashboard-block col-lg-3 col-md-6 col-sm-12">
					<div class="inner-box">
						<div class="content">
							<div class="icon-box">
								<span class="icon flaticon-scholarship"></span>
							</div>
							<div class="courses">Account Balance<span>$2.5k</span></div>
						</div>
					</div>
				</div>
				
			</div>
			
			<!-- Dashboard Graph Section -->
			<div class="dashboard-graph-section">
				<!-- Sec Title -->
				<div class="sec-title">
					<div class="clearfix">
						<div class="pull-left">
							<h4>Latest Course Performance</h4>
						</div>
						<div class="pull-right">
							<a href="earning.html" class="see-all">View Earnings</a>
						</div>
					</div>
				</div>
				<!-- Graph Box -->
				<div class="graph-box">
					<!-- Graph -->
					<canvas id="canvas" style="height: 430px; width: 100%;"></canvas>
				</div>
			</div>
			<!-- End Dashboard Graph Section -->
			
			<!-- Sec Title -->
			<div class="sec-title">
				<h4>Most Viewed Courses</h4>
			</div>
			
			<div class="single-item-carousel owl-carousel owl-theme">
			
				<div class="slide">
					<div class="row clearfix">
					
						<!-- Course Block -->
						<div class="course-block col-lg-3 col-md-6 col-sm-12">
							<div class="inner-box">
								<div class="image">
									<a href="course-lesson.html"><img src="images/resource/course-10.jpg" alt="" /></a>
									<div class="time">03 hours</div>
								</div>
								<div class="lower-content">
									<h6><a href="course-lesson.html">Learn IOS development, Website design, Freelancing</a></h6>
									<ul class="post-meta">
										<li>Development</li>
										<li>JavaScript</li>
									</ul>
									<div class="clearfix">
										<div class="pull-left">
											<div class="author">By: <span>Juan Annatoo</span></div>
										</div>
										<div class="pull-right">
											<div class="price">$15</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- Course Block -->
						<div class="course-block col-lg-3 col-md-6 col-sm-12">
							<div class="inner-box">
								<div class="image">
									<a href="course-lesson.html"><img src="images/resource/course-11.jpg" alt="" /></a>
									<div class="time">15 hours</div>
								</div>
								<div class="lower-content">
									<h6><a href="course-lesson.html">Complete Python Bootcamp: Go from zero to hero in Python 3</a></h6>
									<ul class="post-meta">
										<li>Development</li>
										<li>JavaScript</li>
									</ul>
									<div class="clearfix">
										<div class="pull-left">
											<div class="author">By: <span>Hap E. Birthday</span></div>
										</div>
										<div class="pull-right">
											<div class="price">$15</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- Course Block -->
						<div class="course-block col-lg-3 col-md-6 col-sm-12">
							<div class="inner-box">
								<div class="image">
									<a href="course-lesson.html"><img src="images/resource/course-12.jpg" alt="" /></a>
									<div class="time">07 hours</div>
								</div>
								<div class="lower-content">
									<h6><a href="course-lesson.html">The Web Developer Bootcamp and Learning</a></h6>
									<ul class="post-meta">
										<li>Development</li>
										<li>JavaScript</li>
									</ul>
									<div class="clearfix">
										<div class="pull-left">
											<div class="author">By: <span>Curt N. Call</span></div>
										</div>
										<div class="pull-right">
											<div class="price">$79</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- Course Block -->
						<div class="course-block col-lg-3 col-md-6 col-sm-12">
							<div class="inner-box">
								<div class="image">
									<a href="course-lesson.html"><img src="images/resource/course-13.jpg" alt="" /></a>
									<div class="time">13 hours</div>
								</div>
								<div class="lower-content">
									<h6><a href="course-lesson.html">Machine Learning A-Z™: Hands-On Python & R In Data Science</a></h6>
									<ul class="post-meta">
										<li>Development</li>
										<li>JavaScript</li>
									</ul>
									<div class="clearfix">
										<div class="pull-left">
											<div class="author">By: <span>Marvin Gardens</span></div>
										</div>
										<div class="pull-right">
											<div class="price">$45</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
					</div>
				</div>
				
				<div class="slide">
					<div class="row clearfix">
					
						<!-- Course Block -->
						<div class="course-block col-lg-3 col-md-6 col-sm-12">
							<div class="inner-box">
								<div class="image">
									<a href="course-lesson.html"><img src="images/resource/course-10.jpg" alt="" /></a>
									<div class="time">03 hours</div>
								</div>
								<div class="lower-content">
									<h6><a href="course-lesson.html">Learn IOS development, Website design, Freelancing</a></h6>
									<ul class="post-meta">
										<li>Development</li>
										<li>JavaScript</li>
									</ul>
									<div class="clearfix">
										<div class="pull-left">
											<div class="author">By: <span>Juan Annatoo</span></div>
										</div>
										<div class="pull-right">
											<div class="price">$15</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- Course Block -->
						<div class="course-block col-lg-3 col-md-6 col-sm-12">
							<div class="inner-box">
								<div class="image">
									<a href="course-lesson.html"><img src="images/resource/course-11.jpg" alt="" /></a>
									<div class="time">15 hours</div>
								</div>
								<div class="lower-content">
									<h6><a href="course-lesson.html">Complete Python Bootcamp: Go from zero to hero in Python 3</a></h6>
									<ul class="post-meta">
										<li>Development</li>
										<li>JavaScript</li>
									</ul>
									<div class="clearfix">
										<div class="pull-left">
											<div class="author">By: <span>Hap E. Birthday</span></div>
										</div>
										<div class="pull-right">
											<div class="price">$15</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- Course Block -->
						<div class="course-block col-lg-3 col-md-6 col-sm-12">
							<div class="inner-box">
								<div class="image">
									<a href="course-lesson.html"><img src="images/resource/course-12.jpg" alt="" /></a>
									<div class="time">07 hours</div>
								</div>
								<div class="lower-content">
									<h6><a href="course-lesson.html">The Web Developer Bootcamp and Learning</a></h6>
									<ul class="post-meta">
										<li>Development</li>
										<li>JavaScript</li>
									</ul>
									<div class="clearfix">
										<div class="pull-left">
											<div class="author">By: <span>Curt N. Call</span></div>
										</div>
										<div class="pull-right">
											<div class="price">$79</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- Course Block -->
						<div class="course-block col-lg-3 col-md-6 col-sm-12">
							<div class="inner-box">
								<div class="image">
									<a href="course-lesson.html"><img src="images/resource/course-13.jpg" alt="" /></a>
									<div class="time">13 hours</div>
								</div>
								<div class="lower-content">
									<h6><a href="course-lesson.html">Machine Learning A-Z™: Hands-On Python & R In Data Science</a></h6>
									<ul class="post-meta">
										<li>Development</li>
										<li>JavaScript</li>
									</ul>
									<div class="clearfix">
										<div class="pull-left">
											<div class="author">By: <span>Marvin Gardens</span></div>
										</div>
										<div class="pull-right">
											<div class="price">$45</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
					</div>
				</div>
			
				<div class="slide">
					<div class="row clearfix">
						
						<!-- Course Block -->
						<div class="course-block col-lg-3 col-md-6 col-sm-12">
							<div class="inner-box">
								<div class="image">
									<a href="course-lesson.html"><img src="images/resource/course-10.jpg" alt="" /></a>
									<div class="time">03 hours</div>
								</div>
								<div class="lower-content">
									<h6><a href="course-lesson.html">Learn IOS development, Website design, Freelancing</a></h6>
									<ul class="post-meta">
										<li>Development</li>
										<li>JavaScript</li>
									</ul>
									<div class="clearfix">
										<div class="pull-left">
											<div class="author">By: <span>Juan Annatoo</span></div>
										</div>
										<div class="pull-right">
											<div class="price">$15</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- Course Block -->
						<div class="course-block col-lg-3 col-md-6 col-sm-12">
							<div class="inner-box">
								<div class="image">
									<a href="course-lesson.html"><img src="images/resource/course-11.jpg" alt="" /></a>
									<div class="time">15 hours</div>
								</div>
								<div class="lower-content">
									<h6><a href="course-lesson.html">Complete Python Bootcamp: Go from zero to hero in Python 3</a></h6>
									<ul class="post-meta">
										<li>Development</li>
										<li>JavaScript</li>
									</ul>
									<div class="clearfix">
										<div class="pull-left">
											<div class="author">By: <span>Hap E. Birthday</span></div>
										</div>
										<div class="pull-right">
											<div class="price">$15</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- Course Block -->
						<div class="course-block col-lg-3 col-md-6 col-sm-12">
							<div class="inner-box">
								<div class="image">
									<a href="course-lesson.html"><img src="images/resource/course-12.jpg" alt="" /></a>
									<div class="time">07 hours</div>
								</div>
								<div class="lower-content">
									<h6><a href="course-lesson.html">The Web Developer Bootcamp and Learning</a></h6>
									<ul class="post-meta">
										<li>Development</li>
										<li>JavaScript</li>
									</ul>
									<div class="clearfix">
										<div class="pull-left">
											<div class="author">By: <span>Curt N. Call</span></div>
										</div>
										<div class="pull-right">
											<div class="price">$79</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- Course Block -->
						<div class="course-block col-lg-3 col-md-6 col-sm-12">
							<div class="inner-box">
								<div class="image">
									<a href="course-lesson.html"><img src="images/resource/course-13.jpg" alt="" /></a>
									<div class="time">13 hours</div>
								</div>
								<div class="lower-content">
									<h6><a href="course-lesson.html">Machine Learning A-Z™: Hands-On Python & R In Data Science</a></h6>
									<ul class="post-meta">
										<li>Development</li>
										<li>JavaScript</li>
									</ul>
									<div class="clearfix">
										<div class="pull-left">
											<div class="author">By: <span>Marvin Gardens</span></div>
										</div>
										<div class="pull-right">
											<div class="price">$45</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
					</div>
				</div>
			</div>
			
		</div>
	</div>
	
	<!-- Category Page Container -->
    <div class="category-page-container">
    	<div class="auto-container">
			<!-- Sec Title -->
			<div class="sec-title">
				<h4>IT and Software</h4>
			</div>
        	<div class="single-item-carousel owl-carousel owl-theme">
			
				<div class="slide">
					<div class="row clearfix">
					
						<!-- Course Block -->
						<div class="course-block col-lg-3 col-md-6 col-sm-12">
							<div class="inner-box">
								<div class="image">
									<a href="course-lesson.html"><img src="images/resource/course-15.jpg" alt="" /></a>
									<div class="time">03 hours</div>
								</div>
								<div class="lower-content">
									<h6><a href="course-lesson.html">Learn IOS development, Website design, Freelancing</a></h6>
									<ul class="post-meta">
										<li>Development</li>
										<li>JavaScript</li>
									</ul>
									<div class="clearfix">
										<div class="pull-left">
											<div class="author">By: <span>Juan Annatoo</span></div>
										</div>
										<div class="pull-right">
											<div class="price">$15</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- Course Block -->
						<div class="course-block col-lg-3 col-md-6 col-sm-12">
							<div class="inner-box">
								<div class="image">
									<a href="course-lesson.html"><img src="images/resource/course-16.jpg" alt="" /></a>
									<div class="time">15 hours</div>
								</div>
								<div class="lower-content">
									<h6><a href="course-lesson.html">Complete Python Bootcamp: Go from zero to hero in Python 3</a></h6>
									<ul class="post-meta">
										<li>Development</li>
										<li>JavaScript</li>
									</ul>
									<div class="clearfix">
										<div class="pull-left">
											<div class="author">By: <span>Hap E. Birthday</span></div>
										</div>
										<div class="pull-right">
											<div class="price">$15</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- Course Block -->
						<div class="course-block col-lg-3 col-md-6 col-sm-12">
							<div class="inner-box">
								<div class="image">
									<a href="course-lesson.html"><img src="images/resource/course-17.jpg" alt="" /></a>
									<div class="time">07 hours</div>
								</div>
								<div class="lower-content">
									<h6><a href="course-lesson.html">The Web Developer Bootcamp and Learning</a></h6>
									<ul class="post-meta">
										<li>Development</li>
										<li>JavaScript</li>
									</ul>
									<div class="clearfix">
										<div class="pull-left">
											<div class="author">By: <span>Curt N. Call</span></div>
										</div>
										<div class="pull-right">
											<div class="price">$79</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- Course Block -->
						<div class="course-block col-lg-3 col-md-6 col-sm-12">
							<div class="inner-box">
								<div class="image">
									<a href="course-lesson.html"><img src="images/resource/course-18.jpg" alt="" /></a>
									<div class="time">13 hours</div>
								</div>
								<div class="lower-content">
									<h6><a href="course-lesson.html">Machine Learning A-Z™: Hands-On Python & R In Data Science</a></h6>
									<ul class="post-meta">
										<li>Development</li>
										<li>JavaScript</li>
									</ul>
									<div class="clearfix">
										<div class="pull-left">
											<div class="author">By: <span>Marvin Gardens</span></div>
										</div>
										<div class="pull-right">
											<div class="price">$45</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- Course Block -->
						<div class="course-block col-lg-3 col-md-6 col-sm-12">
							<div class="inner-box">
								<div class="image">
									<a href="course-lesson.html"><img src="images/resource/course-19.jpg" alt="" /></a>
									<div class="time">13 hours</div>
								</div>
								<div class="lower-content">
									<h6><a href="course-lesson.html">Angular - The Complete Guide (2020 Edition)</a></h6>
									<ul class="post-meta">
										<li>Development</li>
										<li>JavaScript</li>
									</ul>
									<div class="clearfix">
										<div class="pull-left">
											<div class="author">By: <span>Stew Gots</span></div>
										</div>
										<div class="pull-right">
											<div class="price">$54</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- Course Block -->
						<div class="course-block col-lg-3 col-md-6 col-sm-12">
							<div class="inner-box">
								<div class="image">
									<a href="course-lesson.html"><img src="images/resource/course-20.jpg" alt="" /></a>
									<div class="time">06 hours</div>
								</div>
								<div class="lower-content">
									<h6><a href="course-lesson.html">Complete C# Unity Developer 2D: Learn to Code Making Games</a></h6>
									<ul class="post-meta">
										<li>Development</li>
										<li>JavaScript</li>
									</ul>
									<div class="clearfix">
										<div class="pull-left">
											<div class="author">By: <span>Anna Rexia</span></div>
										</div>
										<div class="pull-right">
											<div class="price">$124</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- Course Block -->
						<div class="course-block col-lg-3 col-md-6 col-sm-12">
							<div class="inner-box">
								<div class="image">
									<a href="course-lesson.html"><img src="images/resource/course-21.jpg" alt="" /></a>
									<div class="time">11 hours</div>
								</div>
								<div class="lower-content">
									<h6><a href="course-lesson.html">Learn IOS development, Website design, Freelancing </a></h6>
									<ul class="post-meta">
										<li>Development</li>
										<li>JavaScript</li>
									</ul>
									<div class="clearfix">
										<div class="pull-left">
											<div class="author">By: <span>Donatella Nobatti</span></div>
										</div>
										<div class="pull-right">
											<div class="price">$75</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- Course Block -->
						<div class="course-block col-lg-3 col-md-6 col-sm-12">
							<div class="inner-box">
								<div class="image">
									<a href="course-lesson.html"><img src="images/resource/course-22.jpg" alt="" /></a>
									<div class="time">02 hours</div>
								</div>
								<div class="lower-content">
									<h6><a href="course-lesson.html">Java Programming Masterclass for Software Developers</a></h6>
									<ul class="post-meta">
										<li>Development</li>
										<li>JavaScript</li>
									</ul>
									<div class="clearfix">
										<div class="pull-left">
											<div class="author">By: <span>Donatella Nobatti</span></div>
										</div>
										<div class="pull-right">
											<div class="price">$15</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
					</div>
				</div>
				
				<div class="slide">
					<div class="row clearfix">
						
						<!-- Course Block -->
						<div class="course-block col-lg-3 col-md-6 col-sm-12">
							<div class="inner-box">
								<div class="image">
									<a href="course-lesson.html"><img src="images/resource/course-15.jpg" alt="" /></a>
									<div class="time">03 hours</div>
								</div>
								<div class="lower-content">
									<h6><a href="course-lesson.html">Learn IOS development, Website design, Freelancing</a></h6>
									<ul class="post-meta">
										<li>Development</li>
										<li>JavaScript</li>
									</ul>
									<div class="clearfix">
										<div class="pull-left">
											<div class="author">By: <span>Juan Annatoo</span></div>
										</div>
										<div class="pull-right">
											<div class="price">$15</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- Course Block -->
						<div class="course-block col-lg-3 col-md-6 col-sm-12">
							<div class="inner-box">
								<div class="image">
									<a href="course-lesson.html"><img src="images/resource/course-16.jpg" alt="" /></a>
									<div class="time">15 hours</div>
								</div>
								<div class="lower-content">
									<h6><a href="course-lesson.html">Complete Python Bootcamp: Go from zero to hero in Python 3</a></h6>
									<ul class="post-meta">
										<li>Development</li>
										<li>JavaScript</li>
									</ul>
									<div class="clearfix">
										<div class="pull-left">
											<div class="author">By: <span>Hap E. Birthday</span></div>
										</div>
										<div class="pull-right">
											<div class="price">$15</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- Course Block -->
						<div class="course-block col-lg-3 col-md-6 col-sm-12">
							<div class="inner-box">
								<div class="image">
									<a href="course-lesson.html"><img src="images/resource/course-17.jpg" alt="" /></a>
									<div class="time">07 hours</div>
								</div>
								<div class="lower-content">
									<h6><a href="course-lesson.html">The Web Developer Bootcamp and Learning</a></h6>
									<ul class="post-meta">
										<li>Development</li>
										<li>JavaScript</li>
									</ul>
									<div class="clearfix">
										<div class="pull-left">
											<div class="author">By: <span>Curt N. Call</span></div>
										</div>
										<div class="pull-right">
											<div class="price">$79</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- Course Block -->
						<div class="course-block col-lg-3 col-md-6 col-sm-12">
							<div class="inner-box">
								<div class="image">
									<a href="course-lesson.html"><img src="images/resource/course-18.jpg" alt="" /></a>
									<div class="time">13 hours</div>
								</div>
								<div class="lower-content">
									<h6><a href="course-lesson.html">Machine Learning A-Z™: Hands-On Python & R In Data Science</a></h6>
									<ul class="post-meta">
										<li>Development</li>
										<li>JavaScript</li>
									</ul>
									<div class="clearfix">
										<div class="pull-left">
											<div class="author">By: <span>Marvin Gardens</span></div>
										</div>
										<div class="pull-right">
											<div class="price">$45</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- Course Block -->
						<div class="course-block col-lg-3 col-md-6 col-sm-12">
							<div class="inner-box">
								<div class="image">
									<a href="course-lesson.html"><img src="images/resource/course-19.jpg" alt="" /></a>
									<div class="time">13 hours</div>
								</div>
								<div class="lower-content">
									<h6><a href="course-lesson.html">Angular - The Complete Guide (2020 Edition)</a></h6>
									<ul class="post-meta">
										<li>Development</li>
										<li>JavaScript</li>
									</ul>
									<div class="clearfix">
										<div class="pull-left">
											<div class="author">By: <span>Stew Gots</span></div>
										</div>
										<div class="pull-right">
											<div class="price">$54</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- Course Block -->
						<div class="course-block col-lg-3 col-md-6 col-sm-12">
							<div class="inner-box">
								<div class="image">
									<a href="course-lesson.html"><img src="images/resource/course-20.jpg" alt="" /></a>
									<div class="time">06 hours</div>
								</div>
								<div class="lower-content">
									<h6><a href="course-lesson.html">Complete C# Unity Developer 2D: Learn to Code Making Games</a></h6>
									<ul class="post-meta">
										<li>Development</li>
										<li>JavaScript</li>
									</ul>
									<div class="clearfix">
										<div class="pull-left">
											<div class="author">By: <span>Anna Rexia</span></div>
										</div>
										<div class="pull-right">
											<div class="price">$124</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- Course Block -->
						<div class="course-block col-lg-3 col-md-6 col-sm-12">
							<div class="inner-box">
								<div class="image">
									<a href="course-lesson.html"><img src="images/resource/course-21.jpg" alt="" /></a>
									<div class="time">11 hours</div>
								</div>
								<div class="lower-content">
									<h6><a href="course-lesson.html">Learn IOS development, Website design, Freelancing </a></h6>
									<ul class="post-meta">
										<li>Development</li>
										<li>JavaScript</li>
									</ul>
									<div class="clearfix">
										<div class="pull-left">
											<div class="author">By: <span>Donatella Nobatti</span></div>
										</div>
										<div class="pull-right">
											<div class="price">$75</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- Course Block -->
						<div class="course-block col-lg-3 col-md-6 col-sm-12">
							<div class="inner-box">
								<div class="image">
									<a href="course-lesson.html"><img src="images/resource/course-22.jpg" alt="" /></a>
									<div class="time">02 hours</div>
								</div>
								<div class="lower-content">
									<h6><a href="course-lesson.html">Java Programming Masterclass for Software Developers</a></h6>
									<ul class="post-meta">
										<li>Development</li>
										<li>JavaScript</li>
									</ul>
									<div class="clearfix">
										<div class="pull-left">
											<div class="author">By: <span>Donatella Nobatti</span></div>
										</div>
										<div class="pull-right">
											<div class="price">$15</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
					</div>
				</div>
			
				<div class="slide">
					<div class="row clearfix">
						
						<!-- Course Block -->
						<div class="course-block col-lg-3 col-md-6 col-sm-12">
							<div class="inner-box">
								<div class="image">
									<a href="course-lesson.html"><img src="images/resource/course-15.jpg" alt="" /></a>
									<div class="time">03 hours</div>
								</div>
								<div class="lower-content">
									<h6><a href="course-lesson.html">Learn IOS development, Website design, Freelancing</a></h6>
									<ul class="post-meta">
										<li>Development</li>
										<li>JavaScript</li>
									</ul>
									<div class="clearfix">
										<div class="pull-left">
											<div class="author">By: <span>Juan Annatoo</span></div>
										</div>
										<div class="pull-right">
											<div class="price">$15</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- Course Block -->
						<div class="course-block col-lg-3 col-md-6 col-sm-12">
							<div class="inner-box">
								<div class="image">
									<a href="course-lesson.html"><img src="images/resource/course-16.jpg" alt="" /></a>
									<div class="time">15 hours</div>
								</div>
								<div class="lower-content">
									<h6><a href="course-lesson.html">Complete Python Bootcamp: Go from zero to hero in Python 3</a></h6>
									<ul class="post-meta">
										<li>Development</li>
										<li>JavaScript</li>
									</ul>
									<div class="clearfix">
										<div class="pull-left">
											<div class="author">By: <span>Hap E. Birthday</span></div>
										</div>
										<div class="pull-right">
											<div class="price">$15</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- Course Block -->
						<div class="course-block col-lg-3 col-md-6 col-sm-12">
							<div class="inner-box">
								<div class="image">
									<a href="course-lesson.html"><img src="images/resource/course-17.jpg" alt="" /></a>
									<div class="time">07 hours</div>
								</div>
								<div class="lower-content">
									<h6><a href="course-lesson.html">The Web Developer Bootcamp and Learning</a></h6>
									<ul class="post-meta">
										<li>Development</li>
										<li>JavaScript</li>
									</ul>
									<div class="clearfix">
										<div class="pull-left">
											<div class="author">By: <span>Curt N. Call</span></div>
										</div>
										<div class="pull-right">
											<div class="price">$79</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- Course Block -->
						<div class="course-block col-lg-3 col-md-6 col-sm-12">
							<div class="inner-box">
								<div class="image">
									<a href="course-lesson.html"><img src="images/resource/course-18.jpg" alt="" /></a>
									<div class="time">13 hours</div>
								</div>
								<div class="lower-content">
									<h6><a href="course-lesson.html">Machine Learning A-Z™: Hands-On Python & R In Data Science</a></h6>
									<ul class="post-meta">
										<li>Development</li>
										<li>JavaScript</li>
									</ul>
									<div class="clearfix">
										<div class="pull-left">
											<div class="author">By: <span>Marvin Gardens</span></div>
										</div>
										<div class="pull-right">
											<div class="price">$45</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- Course Block -->
						<div class="course-block col-lg-3 col-md-6 col-sm-12">
							<div class="inner-box">
								<div class="image">
									<a href="course-lesson.html"><img src="images/resource/course-19.jpg" alt="" /></a>
									<div class="time">13 hours</div>
								</div>
								<div class="lower-content">
									<h6><a href="course-lesson.html">Angular - The Complete Guide (2020 Edition)</a></h6>
									<ul class="post-meta">
										<li>Development</li>
										<li>JavaScript</li>
									</ul>
									<div class="clearfix">
										<div class="pull-left">
											<div class="author">By: <span>Stew Gots</span></div>
										</div>
										<div class="pull-right">
											<div class="price">$54</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- Course Block -->
						<div class="course-block col-lg-3 col-md-6 col-sm-12">
							<div class="inner-box">
								<div class="image">
									<a href="course-lesson.html"><img src="images/resource/course-20.jpg" alt="" /></a>
									<div class="time">06 hours</div>
								</div>
								<div class="lower-content">
									<h6><a href="course-lesson.html">Complete C# Unity Developer 2D: Learn to Code Making Games</a></h6>
									<ul class="post-meta">
										<li>Development</li>
										<li>JavaScript</li>
									</ul>
									<div class="clearfix">
										<div class="pull-left">
											<div class="author">By: <span>Anna Rexia</span></div>
										</div>
										<div class="pull-right">
											<div class="price">$124</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- Course Block -->
						<div class="course-block col-lg-3 col-md-6 col-sm-12">
							<div class="inner-box">
								<div class="image">
									<a href="course-lesson.html"><img src="images/resource/course-21.jpg" alt="" /></a>
									<div class="time">11 hours</div>
								</div>
								<div class="lower-content">
									<h6><a href="course-lesson.html">Learn IOS development, Website design, Freelancing </a></h6>
									<ul class="post-meta">
										<li>Development</li>
										<li>JavaScript</li>
									</ul>
									<div class="clearfix">
										<div class="pull-left">
											<div class="author">By: <span>Donatella Nobatti</span></div>
										</div>
										<div class="pull-right">
											<div class="price">$75</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- Course Block -->
						<div class="course-block col-lg-3 col-md-6 col-sm-12">
							<div class="inner-box">
								<div class="image">
									<a href="course-lesson.html"><img src="images/resource/course-22.jpg" alt="" /></a>
									<div class="time">02 hours</div>
								</div>
								<div class="lower-content">
									<h6><a href="course-lesson.html">Java Programming Masterclass for Software Developers</a></h6>
									<ul class="post-meta">
										<li>Development</li>
										<li>JavaScript</li>
									</ul>
									<div class="clearfix">
										<div class="pull-left">
											<div class="author">By: <span>Donatella Nobatti</span></div>
										</div>
										<div class="pull-right">
											<div class="price">$15</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
					</div>
				</div>
				
			</div>
			
		</div>
	</div>
	<!-- End Category Page Container -->
	
	<!-- Category Page Container -->
    <div class="category-page-container style-two">
    	<div class="auto-container">
			<!-- Sec Title -->
			<div class="sec-title">
				<h4>Health and Fitness</h4>
			</div>
        	<div class="single-item-carousel owl-carousel owl-theme">
			
				<div class="slide">
					<div class="row clearfix">
					
						<!-- Course Block -->
						<div class="course-block col-lg-3 col-md-6 col-sm-12">
							<div class="inner-box">
								<div class="image">
									<a href="course-lesson.html"><img src="images/resource/course-23.jpg" alt="" /></a>
									<div class="time">03 hours</div>
								</div>
								<div class="lower-content">
									<h6><a href="course-lesson.html">Cognitive Behavioural Therapy (CBT) Practitioner Certificate</a></h6>
									<ul class="post-meta">
										<li>Development</li>
										<li>JavaScript</li>
									</ul>
									<div class="clearfix">
										<div class="pull-left">
											<div class="author">By: <span>Juan Annatoo</span></div>
										</div>
										<div class="pull-right">
											<div class="price">$15</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- Course Block -->
						<div class="course-block col-lg-3 col-md-6 col-sm-12">
							<div class="inner-box">
								<div class="image">
									<a href="course-lesson.html"><img src="images/resource/course-24.jpg" alt="" /></a>
									<div class="time">15 hours</div>
								</div>
								<div class="lower-content">
									<h6><a href="course-lesson.html">Herbalism :: Introduction & Medicine Making [Certificate]</a></h6>
									<ul class="post-meta">
										<li>Development</li>
										<li>JavaScript</li>
									</ul>
									<div class="clearfix">
										<div class="pull-left">
											<div class="author">By: <span>Hap E. Birthday</span></div>
										</div>
										<div class="pull-right">
											<div class="price">$15</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- Course Block -->
						<div class="course-block col-lg-3 col-md-6 col-sm-12">
							<div class="inner-box">
								<div class="image">
									<a href="course-lesson.html"><img src="images/resource/course-25.jpg" alt="" /></a>
									<div class="time">07 hours</div>
								</div>
								<div class="lower-content">
									<h6><a href="course-lesson.html">Internationally Accredited Diploma Certificate in Nutrition</a></h6>
									<ul class="post-meta">
										<li>Development</li>
										<li>JavaScript</li>
									</ul>
									<div class="clearfix">
										<div class="pull-left">
											<div class="author">By: <span>Curt N. Call</span></div>
										</div>
										<div class="pull-right">
											<div class="price">$79</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- Course Block -->
						<div class="course-block col-lg-3 col-md-6 col-sm-12">
							<div class="inner-box">
								<div class="image">
									<a href="course-lesson.html"><img src="images/resource/course-26.jpg" alt="" /></a>
									<div class="time">13 hours</div>
								</div>
								<div class="lower-content">
									<h6><a href="course-lesson.html">Become a SuperHuman: Naturally & Safely Boost Testosterone</a></h6>
									<ul class="post-meta">
										<li>Development</li>
										<li>JavaScript</li>
									</ul>
									<div class="clearfix">
										<div class="pull-left">
											<div class="author">By: <span>Marvin Gardens</span></div>
										</div>
										<div class="pull-right">
											<div class="price">$45</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- Course Block -->
						<div class="course-block col-lg-3 col-md-6 col-sm-12">
							<div class="inner-box">
								<div class="image">
									<a href="course-lesson.html"><img src="images/resource/course-27.jpg" alt="" /></a>
									<div class="time">13 hours</div>
								</div>
								<div class="lower-content">
									<h6><a href="course-lesson.html">Learn Close Combat Training: Military Hand-To-Hand Combat</a></h6>
									<ul class="post-meta">
										<li>Development</li>
										<li>JavaScript</li>
									</ul>
									<div class="clearfix">
										<div class="pull-left">
											<div class="author">By: <span>Stew Gots</span></div>
										</div>
										<div class="pull-right">
											<div class="price">$54</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- Course Block -->
						<div class="course-block col-lg-3 col-md-6 col-sm-12">
							<div class="inner-box">
								<div class="image">
									<a href="course-lesson.html"><img src="images/resource/course-28.jpg" alt="" /></a>
									<div class="time">06 hours</div>
								</div>
								<div class="lower-content">
									<h6><a href="course-lesson.html">Aromatherapy- Using Essential Oils For Natural Living (5 CE)</a></h6>
									<ul class="post-meta">
										<li>Development</li>
										<li>JavaScript</li>
									</ul>
									<div class="clearfix">
										<div class="pull-left">
											<div class="author">By: <span>Anna Rexia</span></div>
										</div>
										<div class="pull-right">
											<div class="price">$124</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- Course Block -->
						<div class="course-block col-lg-3 col-md-6 col-sm-12">
							<div class="inner-box">
								<div class="image">
									<a href="course-lesson.html"><img src="images/resource/course-29.jpg" alt="" /></a>
									<div class="time">11 hours</div>
								</div>
								<div class="lower-content">
									<h6><a href="course-lesson.html">Elevate Your Tennis Game: Learn from Champion Andre Agassi</a></h6>
									<ul class="post-meta">
										<li>Development</li>
										<li>JavaScript</li>
									</ul>
									<div class="clearfix">
										<div class="pull-left">
											<div class="author">By: <span>Donatella Nobatti</span></div>
										</div>
										<div class="pull-right">
											<div class="price">$75</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- Course Block -->
						<div class="course-block col-lg-3 col-md-6 col-sm-12">
							<div class="inner-box">
								<div class="image">
									<a href="course-lesson.html"><img src="images/resource/course-30.jpg" alt="" /></a>
									<div class="time">02 hours</div>
								</div>
								<div class="lower-content">
									<h6><a href="course-lesson.html">Sounds True Presents: Qi Gong for Health and Healing</a></h6>
									<ul class="post-meta">
										<li>Development</li>
										<li>JavaScript</li>
									</ul>
									<div class="clearfix">
										<div class="pull-left">
											<div class="author">By: <span>Donatella Nobatti</span></div>
										</div>
										<div class="pull-right">
											<div class="price">$15</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
					</div>
				</div>
				
				<div class="slide">
					<div class="row clearfix">
					
						<!-- Course Block -->
						<div class="course-block col-lg-3 col-md-6 col-sm-12">
							<div class="inner-box">
								<div class="image">
									<a href="course-lesson.html"><img src="images/resource/course-23.jpg" alt="" /></a>
									<div class="time">03 hours</div>
								</div>
								<div class="lower-content">
									<h6><a href="course-lesson.html">Cognitive Behavioural Therapy (CBT) Practitioner Certificate</a></h6>
									<ul class="post-meta">
										<li>Development</li>
										<li>JavaScript</li>
									</ul>
									<div class="clearfix">
										<div class="pull-left">
											<div class="author">By: <span>Juan Annatoo</span></div>
										</div>
										<div class="pull-right">
											<div class="price">$15</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- Course Block -->
						<div class="course-block col-lg-3 col-md-6 col-sm-12">
							<div class="inner-box">
								<div class="image">
									<a href="course-lesson.html"><img src="images/resource/course-24.jpg" alt="" /></a>
									<div class="time">15 hours</div>
								</div>
								<div class="lower-content">
									<h6><a href="course-lesson.html">Herbalism :: Introduction & Medicine Making [Certificate]</a></h6>
									<ul class="post-meta">
										<li>Development</li>
										<li>JavaScript</li>
									</ul>
									<div class="clearfix">
										<div class="pull-left">
											<div class="author">By: <span>Hap E. Birthday</span></div>
										</div>
										<div class="pull-right">
											<div class="price">$15</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- Course Block -->
						<div class="course-block col-lg-3 col-md-6 col-sm-12">
							<div class="inner-box">
								<div class="image">
									<a href="course-lesson.html"><img src="images/resource/course-25.jpg" alt="" /></a>
									<div class="time">07 hours</div>
								</div>
								<div class="lower-content">
									<h6><a href="course-lesson.html">Internationally Accredited Diploma Certificate in Nutrition</a></h6>
									<ul class="post-meta">
										<li>Development</li>
										<li>JavaScript</li>
									</ul>
									<div class="clearfix">
										<div class="pull-left">
											<div class="author">By: <span>Curt N. Call</span></div>
										</div>
										<div class="pull-right">
											<div class="price">$79</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- Course Block -->
						<div class="course-block col-lg-3 col-md-6 col-sm-12">
							<div class="inner-box">
								<div class="image">
									<a href="course-lesson.html"><img src="images/resource/course-26.jpg" alt="" /></a>
									<div class="time">13 hours</div>
								</div>
								<div class="lower-content">
									<h6><a href="course-lesson.html">Become a SuperHuman: Naturally & Safely Boost Testosterone</a></h6>
									<ul class="post-meta">
										<li>Development</li>
										<li>JavaScript</li>
									</ul>
									<div class="clearfix">
										<div class="pull-left">
											<div class="author">By: <span>Marvin Gardens</span></div>
										</div>
										<div class="pull-right">
											<div class="price">$45</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- Course Block -->
						<div class="course-block col-lg-3 col-md-6 col-sm-12">
							<div class="inner-box">
								<div class="image">
									<a href="course-lesson.html"><img src="images/resource/course-27.jpg" alt="" /></a>
									<div class="time">13 hours</div>
								</div>
								<div class="lower-content">
									<h6><a href="course-lesson.html">Learn Close Combat Training: Military Hand-To-Hand Combat</a></h6>
									<ul class="post-meta">
										<li>Development</li>
										<li>JavaScript</li>
									</ul>
									<div class="clearfix">
										<div class="pull-left">
											<div class="author">By: <span>Stew Gots</span></div>
										</div>
										<div class="pull-right">
											<div class="price">$54</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- Course Block -->
						<div class="course-block col-lg-3 col-md-6 col-sm-12">
							<div class="inner-box">
								<div class="image">
									<a href="course-lesson.html"><img src="images/resource/course-28.jpg" alt="" /></a>
									<div class="time">06 hours</div>
								</div>
								<div class="lower-content">
									<h6><a href="course-lesson.html">Aromatherapy- Using Essential Oils For Natural Living (5 CE)</a></h6>
									<ul class="post-meta">
										<li>Development</li>
										<li>JavaScript</li>
									</ul>
									<div class="clearfix">
										<div class="pull-left">
											<div class="author">By: <span>Anna Rexia</span></div>
										</div>
										<div class="pull-right">
											<div class="price">$124</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- Course Block -->
						<div class="course-block col-lg-3 col-md-6 col-sm-12">
							<div class="inner-box">
								<div class="image">
									<a href="course-lesson.html"><img src="images/resource/course-29.jpg" alt="" /></a>
									<div class="time">11 hours</div>
								</div>
								<div class="lower-content">
									<h6><a href="course-lesson.html">Elevate Your Tennis Game: Learn from Champion Andre Agassi</a></h6>
									<ul class="post-meta">
										<li>Development</li>
										<li>JavaScript</li>
									</ul>
									<div class="clearfix">
										<div class="pull-left">
											<div class="author">By: <span>Donatella Nobatti</span></div>
										</div>
										<div class="pull-right">
											<div class="price">$75</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- Course Block -->
						<div class="course-block col-lg-3 col-md-6 col-sm-12">
							<div class="inner-box">
								<div class="image">
									<a href="course-lesson.html"><img src="images/resource/course-30.jpg" alt="" /></a>
									<div class="time">02 hours</div>
								</div>
								<div class="lower-content">
									<h6><a href="course-lesson.html">Sounds True Presents: Qi Gong for Health and Healing</a></h6>
									<ul class="post-meta">
										<li>Development</li>
										<li>JavaScript</li>
									</ul>
									<div class="clearfix">
										<div class="pull-left">
											<div class="author">By: <span>Donatella Nobatti</span></div>
										</div>
										<div class="pull-right">
											<div class="price">$15</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
					</div>
				</div>
			
				<div class="slide">
					<div class="row clearfix">
					
						<!-- Course Block -->
						<div class="course-block col-lg-3 col-md-6 col-sm-12">
							<div class="inner-box">
								<div class="image">
									<a href="course-lesson.html"><img src="images/resource/course-23.jpg" alt="" /></a>
									<div class="time">03 hours</div>
								</div>
								<div class="lower-content">
									<h6><a href="course-lesson.html">Cognitive Behavioural Therapy (CBT) Practitioner Certificate</a></h6>
									<ul class="post-meta">
										<li>Development</li>
										<li>JavaScript</li>
									</ul>
									<div class="clearfix">
										<div class="pull-left">
											<div class="author">By: <span>Juan Annatoo</span></div>
										</div>
										<div class="pull-right">
											<div class="price">$15</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- Course Block -->
						<div class="course-block col-lg-3 col-md-6 col-sm-12">
							<div class="inner-box">
								<div class="image">
									<a href="course-lesson.html"><img src="images/resource/course-24.jpg" alt="" /></a>
									<div class="time">15 hours</div>
								</div>
								<div class="lower-content">
									<h6><a href="course-lesson.html">Herbalism :: Introduction & Medicine Making [Certificate]</a></h6>
									<ul class="post-meta">
										<li>Development</li>
										<li>JavaScript</li>
									</ul>
									<div class="clearfix">
										<div class="pull-left">
											<div class="author">By: <span>Hap E. Birthday</span></div>
										</div>
										<div class="pull-right">
											<div class="price">$15</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- Course Block -->
						<div class="course-block col-lg-3 col-md-6 col-sm-12">
							<div class="inner-box">
								<div class="image">
									<a href="course-lesson.html"><img src="images/resource/course-25.jpg" alt="" /></a>
									<div class="time">07 hours</div>
								</div>
								<div class="lower-content">
									<h6><a href="course-lesson.html">Internationally Accredited Diploma Certificate in Nutrition</a></h6>
									<ul class="post-meta">
										<li>Development</li>
										<li>JavaScript</li>
									</ul>
									<div class="clearfix">
										<div class="pull-left">
											<div class="author">By: <span>Curt N. Call</span></div>
										</div>
										<div class="pull-right">
											<div class="price">$79</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- Course Block -->
						<div class="course-block col-lg-3 col-md-6 col-sm-12">
							<div class="inner-box">
								<div class="image">
									<a href="course-lesson.html"><img src="images/resource/course-26.jpg" alt="" /></a>
									<div class="time">13 hours</div>
								</div>
								<div class="lower-content">
									<h6><a href="course-lesson.html">Become a SuperHuman: Naturally & Safely Boost Testosterone</a></h6>
									<ul class="post-meta">
										<li>Development</li>
										<li>JavaScript</li>
									</ul>
									<div class="clearfix">
										<div class="pull-left">
											<div class="author">By: <span>Marvin Gardens</span></div>
										</div>
										<div class="pull-right">
											<div class="price">$45</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- Course Block -->
						<div class="course-block col-lg-3 col-md-6 col-sm-12">
							<div class="inner-box">
								<div class="image">
									<a href="course-lesson.html"><img src="images/resource/course-27.jpg" alt="" /></a>
									<div class="time">13 hours</div>
								</div>
								<div class="lower-content">
									<h6><a href="course-lesson.html">Learn Close Combat Training: Military Hand-To-Hand Combat</a></h6>
									<ul class="post-meta">
										<li>Development</li>
										<li>JavaScript</li>
									</ul>
									<div class="clearfix">
										<div class="pull-left">
											<div class="author">By: <span>Stew Gots</span></div>
										</div>
										<div class="pull-right">
											<div class="price">$54</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- Course Block -->
						<div class="course-block col-lg-3 col-md-6 col-sm-12">
							<div class="inner-box">
								<div class="image">
									<a href="course-lesson.html"><img src="images/resource/course-28.jpg" alt="" /></a>
									<div class="time">06 hours</div>
								</div>
								<div class="lower-content">
									<h6><a href="course-lesson.html">Aromatherapy- Using Essential Oils For Natural Living (5 CE)</a></h6>
									<ul class="post-meta">
										<li>Development</li>
										<li>JavaScript</li>
									</ul>
									<div class="clearfix">
										<div class="pull-left">
											<div class="author">By: <span>Anna Rexia</span></div>
										</div>
										<div class="pull-right">
											<div class="price">$124</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- Course Block -->
						<div class="course-block col-lg-3 col-md-6 col-sm-12">
							<div class="inner-box">
								<div class="image">
									<a href="course-lesson.html"><img src="images/resource/course-29.jpg" alt="" /></a>
									<div class="time">11 hours</div>
								</div>
								<div class="lower-content">
									<h6><a href="course-lesson.html">Elevate Your Tennis Game: Learn from Champion Andre Agassi</a></h6>
									<ul class="post-meta">
										<li>Development</li>
										<li>JavaScript</li>
									</ul>
									<div class="clearfix">
										<div class="pull-left">
											<div class="author">By: <span>Donatella Nobatti</span></div>
										</div>
										<div class="pull-right">
											<div class="price">$75</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- Course Block -->
						<div class="course-block col-lg-3 col-md-6 col-sm-12">
							<div class="inner-box">
								<div class="image">
									<a href="course-lesson.html"><img src="images/resource/course-30.jpg" alt="" /></a>
									<div class="time">02 hours</div>
								</div>
								<div class="lower-content">
									<h6><a href="course-lesson.html">Sounds True Presents: Qi Gong for Health and Healing</a></h6>
									<ul class="post-meta">
										<li>Development</li>
										<li>JavaScript</li>
									</ul>
									<div class="clearfix">
										<div class="pull-left">
											<div class="author">By: <span>Donatella Nobatti</span></div>
										</div>
										<div class="pull-right">
											<div class="price">$15</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
					</div>
				</div>
				
			</div>
			
			<!-- Post Share Options -->
			<div class="styled-pagination margin-top text-center">
				<ul class="clearfix">
					<li class="arrow"><a href="#"><span class="fa fa-angle-left"></span> </a></li>
					<li class="prev"><a href="#">Prev</a></li>
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li class="active"><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li class="next"><a href="#">Next</a></li>
					<li class="arrow"><a href="#"><span class="fa fa-angle-right"></span> </a></li>
				</ul>
			</div>
			
		</div>
	</div>
	<!-- End Category Page Container -->
	
	<!-- Achievement Section Two -->
	<section class="achievement-section">
		<div class="auto-container">
			<!-- Sec Title -->
			<div class="sec-title">
				<h4>Achievement</h4>
			</div>
			<div class="row clearfix">
				
				<!-- Achieve Block -->
				<div class="achieve-block col-lg-4 col-md-6 col-sm-12">
					<div class="inner-box">
						<div class="icon"><img src="images/icons/archive-1.jpg" alt="" /></div>
						<div class="post-date">21st January, 2020</div>
						<div class="designation">For App Design</div>
						<div class="text">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </div>
					</div>
				</div>
				
				<!-- Achieve Block -->
				<div class="achieve-block col-lg-4 col-md-6 col-sm-12">
					<div class="inner-box">
						<div class="icon"><img src="images/icons/archive-2.jpg" alt="" /></div>
						<div class="post-date">15th March, 2020</div>
						<div class="designation">For App Design</div>
						<div class="text">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </div>
					</div>
				</div>
				
				<!-- Achieve Block -->
				<div class="achieve-block col-lg-4 col-md-6 col-sm-12">
					<div class="inner-box">
						<div class="icon"><img src="images/icons/archive-3.jpg" alt="" /></div>
						<div class="post-date">3rd July, 2020</div>
						<div class="designation">For App Design</div>
						<div class="text">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </div>
					</div>
				</div>
				
			</div>
		</div>
	</section>
	<!-- End Achievement Section Two -->
	
</div>

	<!-- Main Footer -->
	<jsp:include page="footer.jsp"></jsp:include>
	
    
	<!-- Scroll Top Button -->
			<button class="scroll-top tran3s">
				<i class="fa fa-angle-up" aria-hidden="true"></i>
			</button>




<!-- Color Palate / Color Switcher -->
<div class="color-palate">
    <div class="color-trigger">
        <i class="fa fa-gear"></i>
    </div>
    <div class="color-palate-head">
        <h6>Choose Your Color</h6>
    </div>
    <div class="various-color clearfix">
        <div class="colors-list">
            <span class="palate color-one active" data-theme-file="css/ins/color-themes/theme-one.css"></span>
            <span class="palate color-two" data-theme-file="css/ins/color-themes/theme-two.css"></span>
            <span class="palate color-three" data-theme-file="css/ins/color-themes/theme-three.css"></span>
            <span class="palate color-four" data-theme-file="css/ins/color-themes/theme-four.css"></span>
            <span class="palate color-five" data-theme-file="css/ins/color-themes/theme-five.css"></span>
            <span class="palate color-six" data-theme-file="css/ins/color-themes/theme-six.css"></span>
            <span class="palate color-seven" data-theme-file="css/ins/color-themes/theme-seven.css"></span>
            <span class="palate color-eight" data-theme-file="css/ins/color-themes/theme-eight.css"></span>
			<span class="palate color-nine" data-theme-file="css/ins/color-themes/theme-nine.css"></span>
			<span class="palate color-ten" data-theme-file="css/ins/color-themes/theme-ten.css"></span>
			<span class="palate color-eleven" data-theme-file="css/ins/color-themes/theme-eleven.css"></span>
			<span class="palate color-twelve" data-theme-file="css/ins/color-themes/theme-twelve.css"></span>
        </div>
    </div>

</div>

<script src="js/ins/jquery.js"></script>
<script src="js/ins/popper.min.js"></script>
<script src="js/ins/bootstrap.min.js"></script>
<script src="js/ins/jquery.fancybox.js"></script>
<script src="js/ins/appear.js"></script>
<script src="js/ins/isotope.js"></script>
<script src="js/ins/owl.js"></script>
<script src="js/ins/wow.js"></script>
<script src="js/ins/jquery-ui.js"></script>
<script src="js/ins/script.js"></script>
<script src="js/ins/color-settings.js"></script>

<!-- Chart -->
<script src="js/ins/canvasjs.min.js"></script>
<script src="js/ins/charts-script.js"></script>

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
		<!-- js ui -->
		<script src="vendor/jquery-ui/jquery-ui.min.js"></script>

		<!-- Theme js -->
		<script type="text/javascript" src="js/theme.js"></script>
<script>
		var MONTHS = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
		var config = {
			type: 'line',
			data: {
				labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
				datasets: [{
					label: 'First Course',
					borderColor: window.chartColors.red,
					backgroundColor: window.chartColors.red,
					data: [
						randomScalingFactor(),
						randomScalingFactor(),
						randomScalingFactor(),
						randomScalingFactor(),
						randomScalingFactor(),
						randomScalingFactor(),
						randomScalingFactor()
					],
				}, {
					label: 'Second Course',
					borderColor: window.chartColors.blue,
					backgroundColor: window.chartColors.blue,
					data: [
						randomScalingFactor(),
						randomScalingFactor(),
						randomScalingFactor(),
						randomScalingFactor(),
						randomScalingFactor(),
						randomScalingFactor(),
						randomScalingFactor()
					],
				}, {
					label: 'Third Course',
					borderColor: window.chartColors.green,
					backgroundColor: window.chartColors.green,
					data: [
						randomScalingFactor(),
						randomScalingFactor(),
						randomScalingFactor(),
						randomScalingFactor(),
						randomScalingFactor(),
						randomScalingFactor(),
						randomScalingFactor()
					],
				}, {
					label: 'Fourth Course',
					borderColor: window.chartColors.yellow,
					backgroundColor: window.chartColors.yellow,
					data: [
						randomScalingFactor(),
						randomScalingFactor(),
						randomScalingFactor(),
						randomScalingFactor(),
						randomScalingFactor(),
						randomScalingFactor(),
						randomScalingFactor()
					],
				}]
			},
			options: {
				responsive: true,
				title: {
					display: true,
					text: 'Chart.js Line Chart - Stacked Area'
				},
				tooltips: {
					mode: 'index',
				},
				hover: {
					mode: 'index'
				},
				scales: {
					xAxes: [{
						scaleLabel: {
							display: true,
							labelString: 'Month'
						}
					}],
					yAxes: [{
						stacked: true,
						scaleLabel: {
							display: true,
							labelString: 'Value'
						}
					}]
				}
			}
		};

		window.onload = function() {
			var ctx = document.getElementById('canvas').getContext('2d');
			window.myLine = new Chart(ctx, config);
		};

		document.getElementById('randomizeData').addEventListener('click', function() {
			config.data.datasets.forEach(function(dataset) {
				dataset.data = dataset.data.map(function() {
					return randomScalingFactor();
				});

			});

			window.myLine.update();
		});

		var colorNames = Object.keys(window.chartColors);
		document.getElementById('addDataset').addEventListener('click', function() {
			var colorName = colorNames[config.data.datasets.length % colorNames.length];
			var newColor = window.chartColors[colorName];
			var newDataset = {
				label: 'Dataset ' + config.data.datasets.length,
				borderColor: newColor,
				backgroundColor: newColor,
				data: [],
			};

			for (var index = 0; index < config.data.labels.length; ++index) {
				newDataset.data.push(randomScalingFactor());
			}

			config.data.datasets.push(newDataset);
			window.myLine.update();
		});

		document.getElementById('addData').addEventListener('click', function() {
			if (config.data.datasets.length > 0) {
				var month = MONTHS[config.data.labels.length % MONTHS.length];
				config.data.labels.push(month);

				config.data.datasets.forEach(function(dataset) {
					dataset.data.push(randomScalingFactor());
				});

				window.myLine.update();
			}
		});

		document.getElementById('removeDataset').addEventListener('click', function() {
			config.data.datasets.splice(0, 1);
			window.myLine.update();
		});

		document.getElementById('removeData').addEventListener('click', function() {
			config.data.labels.splice(-1, 1); // remove the label first

			config.data.datasets.forEach(function(dataset) {
				dataset.data.pop();
			});

			window.myLine.update();
		});
	</script>

</body>
</html>