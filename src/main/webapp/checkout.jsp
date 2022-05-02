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
<title>Akadimia HTML Template | Checkout</title>
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
                <div class="content-side col-lg-9 col-md-12 col-sm-12">
					<!-- Sec Title -->
					<div class="sec-title">
						<h4>Checkout</h4>
					</div>
					<div class="checkout-section">
						<h6>Description</h6>
						<!-- Checkout Form -->
						<div class="checkout-form">

								<div class="row clearfix">
								
									<div class="col-lg-12 col-md-12 col-sm-12 form-group">
										<span class="icon flaticon-edit-3"></span>
										<textarea class="" name="message" placeholder="${transaction.description}" value="${transaction.description}"></textarea>
									</div>
								
									
									<!-- Signup Info Tabs-->
									<div class="checkout-info-tabs col-lg-12 col-md-12 col-sm-12">
									
										<!-- Checkout Tabs-->
										<div class="checkout-tabs tabs-box">
											
											<!-- Tab Btns -->

					
											<div class="tabs-content">
												
												<!-- Tab / Active Tab -->
												<div class="tab active-tab" id="prod-debitcard">
													<div class="row clearfix">
														<div class="col-lg-12 col-md-12 col-sm-12 form-group">
															<h2>Order Details</h2>
														</div>
																						<%
								HashMap<Integer, CourseCart> cart = (HashMap<Integer, CourseCart>) request.getSession(false).getAttribute("cart");
								float total = 0;
								boolean flag = cart != null ? true : false;
								/* 								if (cart != null) {
															for (Map.Entry<Integer, CourseCart> entry : cart.entrySet()) {
																total += entry.getValue().course.getPrice2();
																//System.out.println(entry.getValue().course.getName());
															}
														} */
								request.setAttribute("flag", flag);
								%>
								<div class="col-lg-12 col-md-12 col-sm-12 form-group">
								<div class="order-box">
								<ul>
								<c:if test="${flag}">
										<%
										for (Map.Entry<Integer, CourseCart> entry : cart.entrySet()) {
											Integer key = entry.getKey();
											CourseCart courseCart = entry.getValue();
											total += courseCart.course.getPrice2();
											//System.out.println(entry.getValue().course.getName());
										%>
											<li class="clearfix"><%=courseCart.course.getName()%> <span class="pull-right">$<%=courseCart.course.getPrice2()%></span></li>

										<%
										}
										%>
									</c:if>
									</ul>
									</div>
									</div>
														<div class="col-lg-12 col-md-12 col-sm-12 form-group text-right">
															<form action="execute_payment"  method="post" >														
																<input type="hidden" name="paymentId"  value="${paymentId}">
																<input type="hidden" name="PayerID"   value="${PayerID}">
																<button class="theme-btn btn-style-one" type="submit" name="submit-form"><span class="txt">Pay now</span></button>
															</form>
														</div>
													</div>
												</div>
												
												<!-- Tab  -->
												<div class="tab" id="prod-bank">
													<div class="row clearfix">
														
														<!-- Form Group -->
														<div class="form-group col-lg-6 col-md-12 col-sm-12">
															<label>Holder Name</label>
															<input type="text" name="username" value="" placeholder="First Name" required>
														</div>
														
														<!-- Form Group -->
														<div class="form-group col-lg-6 col-md-12 col-sm-12">
															<label>Card Number</label>
															<input type="text" name="card" value="" placeholder="000-0000-000" required>
														</div>
														
														<div class="form-group col-lg-4 col-md-6 col-sm-12">
															<label>Expiration Month</label>
															<select class="custom-select-box">
																<option>Expiration Month</option>
																<option>January</option>
																<option>Ferruary</option>
																<option>March</option>
																<option>April</option>
																<option>May</option>
																<option>June</option>
																<option>July</option>
																<option>August</option>
																<option>September</option>
																<option>October</option>
																<option>November</option>
																<option>December</option>
															</select>
														</div>
														
														<div class="form-group col-lg-4 col-md-6 col-sm-12">
															<label>Expiration Year</label>
															<input type="text" name="year" value="" placeholder="Year" required>
														</div>
														
														<div class="form-group col-lg-4 col-md-6 col-sm-12">
															<label>Expiration Year</label>
															<input type="text" name="cvc" value="" placeholder="CVC" required>
														</div>
														
														<div class="col-lg-12 col-md-12 col-sm-12 form-group">
															<h2>Order Details</h2>
														</div>
														
														<div class="col-lg-12 col-md-12 col-sm-12 form-group">
															<!-- Order Box -->
															<div class="order-box">
																<ul>
																	<li class="clearfix">Basic Plan <span class="pull-right">$29</span></li>
																	<li class="clearfix">Tax <span class="pull-right">$3</span></li>
																	<li class="clearfix"><strong>Total</strong> <span class="pull-right">$32</span></li>
																</ul>
															</div>
														</div>
														
														<div class="col-lg-12 col-md-12 col-sm-12 form-group text-right">
															<button class="theme-btn btn-style-one" type="submit" name="submit-form"><span class="txt">Confirm Checkout</span></button>
														</div>
														
													</div>
												</div>
												
												<!-- Tab  -->
												<div class="tab" id="prod-paypal">
													<div class="row clearfix">
														
														<!-- Form Group -->
														<div class="form-group col-lg-6 col-md-12 col-sm-12">
															<label>Holder Name</label>
															<input type="text" name="username" value="" placeholder="First Name" required>
														</div>
														
														<!-- Form Group -->
														<div class="form-group col-lg-6 col-md-12 col-sm-12">
															<label>Card Number</label>
															<input type="text" name="card" value="" placeholder="000-0000-000" required>
														</div>
														
														<div class="form-group col-lg-4 col-md-6 col-sm-12">
															<label>Expiration Month</label>
															<select class="custom-select-box">
																<option>Expiration Month</option>
																<option>January</option>
																<option>Ferruary</option>
																<option>March</option>
																<option>April</option>
																<option>May</option>
																<option>June</option>
																<option>July</option>
																<option>August</option>
																<option>September</option>
																<option>October</option>
																<option>November</option>
																<option>December</option>
															</select>
														</div>
														
														<div class="form-group col-lg-4 col-md-6 col-sm-12">
															<label>Expiration Year</label>
															<input type="text" name="year" value="" placeholder="Year" required>
														</div>
														
														<div class="form-group col-lg-4 col-md-6 col-sm-12">
															<label>Expiration Year</label>
															<input type="text" name="cvc" value="" placeholder="CVC" required>
														</div>
														
														<div class="col-lg-12 col-md-12 col-sm-12 form-group">
															<h2>Order Details</h2>
														</div>
														
														<div class="col-lg-12 col-md-12 col-sm-12 form-group">
															<!-- Order Box -->
															<div class="order-box">
																<ul>
																	<li class="clearfix">Basic Plan <span class="pull-right">$29</span></li>
																	<li class="clearfix">Tax <span class="pull-right">$3</span></li>
																	<li class="clearfix"><strong>Total</strong> <span class="pull-right">$32</span></li>
																</ul>
															</div>
														</div>
														
														<div class="col-lg-12 col-md-12 col-sm-12 form-group text-right">
															<button class="theme-btn btn-style-one" type="submit" name="submit-form"><span class="txt">Confirm Checkout</span></button>
														</div>
														
													</div>
												</div>
												
											</div>
										</div>
									</div>
									
								</div>
								
							</form>
						</div>
						
					</div>
				</div>
				
				<!-- Sidebar Side -->
                <div class="sidebar-side col-lg-3 col-md-12 col-sm-12">
                	<aside class="sidebar sticky-top">
						
						<!-- Order Widget -->
                        <div class="sidebar-widget order-widget">
							<div class="widget-content">
								<div class="sidebar-title">
									<h6>Order Summary</h6>
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
						
					</aside>
				</div>
				
			</div>
		</div>
	</div>
	
	<!-- Main Footer -->
    <footer class="main-footer">
		<!-- Pattern Layer -->
		<div class="pattern-layer" style="background-image:url(images/background/pattern-2.png)"></div>
		<div class="pattern-layer-two" style="background-image:url(images/background/pattern-3.png)"></div>
		<!-- Upper Box -->
		<div class="upper-box">
			<div class="auto-container">
				<h4>Subscribe to know our <br> every single updates</h4>
				
				<!-- Subscribe Form -->
				<div class="subscribe-form">
					<form method="post" action="contact.html">
						<div class="form-group clearfix">
							<span class="icon flaticon-mail"></span>
							<input type="email" name="email" value="" placeholder="Please Enter Your Email" required>
							<button type="submit" class="theme-btn btn-style-one"><span class="txt">Subscribe Now</span></button>
						</div>
					</form>
				</div>
				
			</div>
		</div>
		
		<div class="auto-container">
		
        	<!-- Widgets Section -->
            <div class="widgets-section">
            	<div class="row clearfix">
                	
                    <!-- Big Column -->
                    <div class="big-column col-lg-6 col-md-12 col-sm-12">
                        <div class="row clearfix">
							
							<!--Footer Column-->
                            <div class="footer-column col-lg-7 col-md-6 col-sm-12">
                                <div class="footer-widget logo-widget">
									<div class="logo">
                                    	<a href="index.html"><img src="images/footer-logo.png" alt="" /></a>
                                    </div>
									<div class="text">There are many variations of passages of Lorem Ipsum available,</div>
									<div class="social-box">
										<a href="#" class="fa fa-facebook-square"></a>
										<a href="#" class="fa fa-twitter-square"></a>
										<a href="#" class="fa fa-linkedin-square"></a>
									</div>
									
								</div>
							</div>
							
							<!--Footer Column-->
                            <div class="footer-column col-lg-5 col-md-6 col-sm-12">
                                <div class="footer-widget links-widget">
									<ul class="links-widget">
										<li><a href="#">Afficiates</a></li>
										<li><a href="#">Partners</a></li>
										<li><a href="#">Reviews</a></li>
										<li><a href="#">Blogs</a></li>
									</ul>
								</div>
							</div>
							
						</div>
					</div>
					
					<!-- Big Column -->
                    <div class="big-column col-lg-6 col-md-12 col-sm-12">
                        <div class="row clearfix">
							
							<!--Footer Column-->
                            <div class="footer-column col-lg-6 col-md-6 col-sm-12">
                                <div class="footer-widget links-widget">
									<ul class="links-widget">
										<li><a href="#">Privacy Policy</a></li>
										<li><a href="#">Support Area</a></li>
										<li><a href="#">Documentations</a></li>
										<li><a href="#">How it works</a></li>
										<li><a href="#">Terms of Policy</a></li>
									</ul>
								</div>
							</div>
							
							<!--Footer Column-->
                            <div class="footer-column col-lg-6 col-md-6 col-sm-12">
                                <div class="footer-widget links-widget">
									<ul class="links-widget">
										<li><a href="#">home</a></li>
										<li><a href="#">About us</a></li>
										<li><a href="#">Features</a></li>
										<li><a href="#">Pricing</a></li>
										<li><a href="#">Contact</a></li>
									</ul>
								</div>
							</div>
						
						</div>
					</div>
					
				</div>
			</div>
			
			<!-- Footer Bottom -->
			<div class="footer-bottom text-center">
				<div class="copyright">Copyright &copy; 2020 AuburnForest</div>
			</div>
			
		</div>
	</footer>
	
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