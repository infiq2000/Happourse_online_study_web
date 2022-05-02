<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<%@ page import="Model.Courses"%>
<%@ page import="Model.ManagedCourses"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*"%>
<%@ page import="Dao.CourseUtil"%>
<%@ page import="Model.Chapter"%>
<%@ page import="Model.*"%>
<%@ page import="Dao.LectureUtil"%>

<%@ page import="org.json.simple.JSONArray"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>happourse</title>
<!-- Stylesheets -->


<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;300;400;500;600;700;800;900&family=Roboto:wght@300;400;500;700;900&display=swap" rel="stylesheet">

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

<!-- Responsive -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">

<!--[if lt IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.js"></script><![endif]-->
<!--[if lt IE 9]><script src="js/respond.js"></script><![endif]-->

</head>

<body class="">
    <!-- Preloader -->
    <div class="preloader"></div>
 	
    <!-- Main Header-->
	<jsp:include page="Header.jsp"></jsp:include>
    <!--End Main Header -->
<div class="page-wrapper">
    <div class="sidebar-page-container">
    	<div class="auto-container">
        	<div class="row clearfix">
				
				<!-- Content Side -->
  
				
				<!-- Sidebar Side -->
               
						
						<!-- Order Widget -->
                    
							<div class="widget-content">
								<div class="sidebar-title">
									<h6>Thanh you for purchasing our courses. </h6>
								</div>
								<!-- Order Box -->
								<div class="order-box">
									<ul>
										<li class="clearfix">Subtotal:  <span class="pull-right">${transaction.amount.details.subtotal} USD</span></li>
										<li class="clearfix">Fee <span class="pull-right">${transaction.amount.details.shipping} USD</span></li>
										<li class="clearfix"><strong>Tax</strong> <span class="pull-right">${transaction.amount.details.tax} USD</span></li>
										<li class="clearfix"><strong>Total</strong> <span class="pull-right">${transaction.amount.total} USD</span></li>
									</ul>
								</div>
							</div>
						
				
				
				
			</div>
		</div>
	</div>
	
	<!-- Main Footer -->
   
</div>
<!-- End pagewrapper -->

<!-- Hidden Navigation Bar -->
<section class="hidden-bar left-align">
	<div class="color-layer"></div>
	<div class="hidden-bar-closer">
		<span class="flaticon-multiply"></span>
	</div>
	<!-- Hidden Bar Wrapper -->
	<div class="hidden-bar-wrapper">
		<ul class="pages-list">
			<li class="active"><a href="index.html"><span class="icon flaticon-home"></span>Home</a></li>
			<li><a href="featured-courses.html"><span class="icon flaticon-book"></span>Featured Courses</a></li>
			<li><a href="course-lesson.html"><span class="icon flaticon-category"></span>Courses Lesson</a></li>
			<li><a href="category.html"><span class="icon flaticon-test"></span>Course Categories</a></li>
			<li><a href="latest-courses.html"><span class="icon flaticon-subscription"></span>Latest Courses</a></li>
			<li><a href="course-detail.html"><span class="icon flaticon-new-window"></span>Course Landing</a></li>
			<li><a href="team.html"><span class="icon flaticon-instructor"></span>Popular Instructors</a></li>
		</ul>
		<div class="heading">Instructor</div>
		<ul class="pages-list">
			<li><a href="dashboard.html"><span class="icon flaticon-home"></span>Dashboard</a></li>
			<li><a href="manage-course.html"><span class="icon flaticon-test"></span>Manage Courses</a></li>
			<li><a href="earning.html"><span class="icon flaticon-scholarship"></span>Earnings</a></li>
			<li><a href="edit-course.html"><span class="icon flaticon-report"></span>Edit Course</a></li>
			<li><a href="instructor-profile.html"><span class="icon flaticon-file"></span>Instructor Profile</a></li>
		</ul>
		<div class="heading">Student</div>
		<ul class="pages-list">
			<li><a href="price.html"><span class="icon flaticon-money-bag"></span>Pricing</a></li>
			<li><a href="enrolled-courses.html"><span class="icon flaticon-test"></span>Enrolled Courses</a></li>
			<li><a href="certificate.html"><span class="icon flaticon-skills"></span>Certificate Center</a></li>
			<li><a href="test.html"><span class="icon flaticon-quiz"></span>Quiz</a></li>
			<li><a href="result.html"><span class="icon flaticon-document"></span>Quiz Result</a></li>
			<li><a href="student-profile.html"><span class="icon flaticon-student"></span>Student Profile</a></li>
		</ul>
		<div class="heading">Pages</div>
		<ul class="pages-list">
			<li><a href="blog.html"><span class="icon flaticon-social-media"></span>Blog</a></li>
			<li><a href="blog-detail.html"><span class="icon flaticon-article"></span>Blog Detail</a></li>
			<li><a href="not-found.html"><span class="icon flaticon-garbage"></span>Not Found</a></li>
			<li><a href="login.html"><span class="icon flaticon-contract"></span>Sign In</a></li>
			<li><a href="sign-up.html"><span class="icon flaticon-clipboard"></span>Sign Up</a></li>
			<li><a href="feedback.html"><span class="icon flaticon-thumb-up"></span>Feedback</a></li>
			<li><a href="checkout.html"><span class="icon flaticon-checkout"></span>Checkout</a></li>
			<li><a href="contact.html"><span class="icon flaticon-contact"></span>Contact Us</a></li>
			<li><a href="setting.html"><span class="icon flaticon-settings-1"></span>Settings</a></li>
			<li><a href="help.html"><span class="icon flaticon-information"></span>Help</a></li>
		</ul>
	</div>
	<!--Copyright Text-->
	<div class="copyright-text">Copyright &copy; 2020 Genter</div>
</section>

<!--Scroll to top-->
<div class="scroll-to-top scroll-to-target" data-target="html"><span class="fa fa-arrow-circle-up"></span></div>

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
            <span class="palate color-one active" data-theme-file="css/color-themes/theme-one.css"></span>
            <span class="palate color-two" data-theme-file="css/color-themes/theme-two.css"></span>
            <span class="palate color-three" data-theme-file="css/color-themes/theme-three.css"></span>
            <span class="palate color-four" data-theme-file="css/color-themes/theme-four.css"></span>
            <span class="palate color-five" data-theme-file="css/color-themes/theme-five.css"></span>
            <span class="palate color-six" data-theme-file="css/color-themes/theme-six.css"></span>
            <span class="palate color-seven" data-theme-file="css/color-themes/theme-seven.css"></span>
            <span class="palate color-eight" data-theme-file="css/color-themes/theme-eight.css"></span>
			<span class="palate color-nine" data-theme-file="css/color-themes/theme-nine.css"></span>
			<span class="palate color-ten" data-theme-file="css/color-themes/theme-ten.css"></span>
			<span class="palate color-eleven" data-theme-file="css/color-themes/theme-eleven.css"></span>
			<span class="palate color-twelve" data-theme-file="css/color-themes/theme-twelve.css"></span>
        </div>
    </div>

</div>

<!-- <script src="js/ins/jquery.js"></script> -->
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

</body>
</html>