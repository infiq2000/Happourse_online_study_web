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
			<header class="theme-menu-wrapper menu-style-one">
				<div class="container">
					<div class="header-wrapper clearfix">
						<!-- Logo -->
						<div class="logo float-left tran4s"><a href="index.html"><img src="images/logo/logo.png" alt="Logo"></a></div>

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
									<li class="dropdown-holder menu-list" ><a class="tran3s"><span class="login">HI ${name}</span></a> 
										<ul class="sub-menu">
											<c:url var="link2" value="Profile">
													<c:param name="uid" value="${user_info.getUid()}"></c:param>  
	  										</c:url>
											<li><a href="${link2}">Tài khoản</a></li>
											<li><a href="update_profile.jsp">Cập nhật thông tin</a></li>
											<c:url var="tempLink" value="MyLearning">
													<c:param name="aid_user" value="${aid}"></c:param> --%>
													<c:param name="uid" value="${uid}"></c:param> --%>
	  										</c:url>
											<li><a href="${tempLink} ">Khóa học</a></li>
											<li><a href="Logout">Đăng xuất</a></li>
										</ul>
									</li>
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
						<h2>${course_detail.getName()}</h2>
						<ul>
							<li><a href="index.html" class="tran3s">Home</a></li>
							<li>/</li>
							<li>Courses</li>
						</ul>
					</div> <!-- /.container -->
				</div> <!-- /.opacity -->
			</div> <!-- /.inner-banner -->


			<!-- 
			=============================================
				Course Details
			============================================== 
			-->
			<div class="course-details">
				<div class="container">
					<div class="row">
						<div class="col-md-8 col-xs-12">
							<div class="details-wrapper">
								<div class="course-title">
									<h2>${course_detail.getName()}</h2>
									<span>Posted on 24 Mar, 22016</span>
								</div> <!-- /.course-title -->
								<div class="course-info row">
									<div class="col-xs-4">
										<div>
											<i class="flaticon-time"></i>
											<p>Duration</p>
											<b>18 class - 36 Hours</b>
										</div>
									</div>
									<div class="col-xs-4">
										<div>
											<i class="flaticon-bookmark"></i>
											<p>Categories</p>
											<b>${cate}</b>
										</div>
									</div>
									<div class="col-xs-4">
										<div>
											<i class="flaticon-star"></i>
											<p><b>${course_detail.getStar_rate()}</b> (23)</p>
											<ul>
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star-half-o" aria-hidden="true"></i></li>
											</ul>
										</div>
									</div>
								</div> <!-- /.course-info -->
								<img src="images/course/35.jpg" alt="">
								<p class="p1">${course_detail.getDesciption()}</p>
								<div class="learn-list">
									<h3>What Will I Learn?</h3>
									<ul class="row">
										<li class="col-sm-6 col-xs-12"><span>Create static HTML and CSS portfolio sites and landing pages</span></li>
										<li class="col-sm-6 col-xs-12"><span>Think like a developer. Become an expert at Googling code questions!</span></li>
										<li class="col-sm-6 col-xs-12"><span>Write complex web apps with multiple models and data associations</span></li>
										<li class="col-sm-6 col-xs-12"><span>Use Express and MongoDB to create full-stack JS applications</span></li>
										<li class="col-sm-6 col-xs-12"><span>Use common JS data structures like Arrays and Objects</span></li>
										<li class="col-sm-6 col-xs-12"><span>Create a blog application from scratch using Express, MongoDB, and Semantic UI</span></li>
										<li class="col-sm-6 col-xs-12"><span>Use Bootstrap to create good-looking responsive layout</span></li>
										<li class="col-sm-6 col-xs-12"><span>Create a beautiful, responsive landing page for a startup</span></li>
									</ul>
								</div>

								<div class="curriculum-panel">
									<div class="clearfix">
										<h3 class="float-left">Curriculum</h3>
										<ul class="float-right">
											<li><span>6 </span> Lectures</li>
											<li><span>40 : 30</span></li>
										</ul>
									</div>
									<div class="panel-group theme-accordion" id="accordionTwo">
									<c:forEach var="tempChapter" items="${chapter}" varStatus="myIndex">
									 <div class="panel">
									    <div class="panel-heading">
									      <h5 class="panel-title">
									        <a data-toggle="collapse" data-parent="#accordionTwo" href="#collapse62" class="clearfix">
									        	<h6 class="float-left">
										        	<span>Lecture 1. ${myIndex.index}</span>
										        	${tempChapter.getName()}
										        </h6>
										        <p class="float-right">26:19min</p>
									        </a>
									      </h5>
									    </div>
									 
									    <div id="collapse62" class="panel-collapse collapse">
									      <div class="panel-body">
									      	<ul>
									      		<li class="clearfix">
									      			<span class="float-left"><a href="#" class="tran3s"><i class="fa fa-file-text-o" aria-hidden="true"></i> A Note On Asking For Help</a></span>
									      			<span class="float-right">75kb</span>
									      		</li>
									      		<li class="clearfix">
									      			<span class="float-left"><a href="#" class="tran3s"><i class="fa fa-file-text-o" aria-hidden="true"></i> Note about the Form Exercise solution </a></span>
									      			<span class="float-right">55kb</span>
									      		</li>
									      		<li class="clearfix">
									      			<span class="float-left"><i class="fa fa-play-circle" aria-hidden="true"></i> Note about the Form Exercise solution <a data-fancybox href="https://www.youtube.com/watch?v=ewwTwZYyfRs&ab_channel=T%E1%BA%A5nHu%E1%BB%B3nh" class="tran3s preview p-bg-color">Preview </a></span>
									      			<span class="float-right">10:23min</span>
									      		</li>
									      		<li class="clearfix">
									      			<span class="float-left"><i class="fa fa-play-circle" aria-hidden="true"></i> Recreate Webpage Assignment: SOLUTION <a data-fancybox href="https://www.youtube.com/embed/r-AuLm7S3XE?rel=0&amp;showinfo=0" class="tran3s preview p-bg-color">Preview </a></span>
									      			<span class="float-right">5:17min</span>
									      		</li>
									      	</ul>
									      </div>
									    </div>
									  </div> <!-- /panel 6 -->
									</c:forEach>
									</div> <!-- end #accordionTwo -->
								</div> <!-- End of .curriculum-panel -->

								<div class="course-feedback">
									<h3>Students Feedback</h3>
									<div class="feedback-container">
										<ul class="clearfix">
											<li class="float-left">
												<h2>4.9</h2>
												<p>Avarage rating (9)</p>
												<ul>
													<li><i class="fa fa-star" aria-hidden="true"></i></li>
													<li><i class="fa fa-star" aria-hidden="true"></i></li>
													<li><i class="fa fa-star" aria-hidden="true"></i></li>
													<li><i class="fa fa-star" aria-hidden="true"></i></li>
													<li><i class="fa fa-star-half-o" aria-hidden="true"></i></li>
												</ul>
											</li>
											<li class="float-left">
												<ul class="clearfix">
													<li>5 Star</li>
													<li><div style="width:77%;"></div></li>
													<li>87%</li>
													<li class="float-right">(5 Reviews)</li>
												</ul>
												<ul class="clearfix">
													<li>4 Star</li>
													<li><div style="width:70%;"></div></li>
													<li>70%</li>
													<li class="float-right">(2 Reviews)</li>
												</ul>
												<ul class="clearfix">
													<li>3 Star</li>
													<li><div style="width:60%;"></div></li>
													<li>32%</li>
													<li class="float-right">(1 Reviews)</li>
												</ul>
												<ul class="clearfix">
													<li>2 Star</li>
													<li><div style="width:45%;"></div></li>
													<li>10%</li>
													<li class="float-right">(1 Reviews)</li>
												</ul>
												<ul class="clearfix">
													<li>1 Star</li>
													<li><div style="width:2%;"></div></li>
													<li>0%</li>
													<li class="float-right">(0 Reviews)</li>
												</ul>
											</li>
										</ul>
									</div> <!-- /.feedback-container -->
									<div class="single-review clearfix">
										<img src="images/course/30.jpg" alt="" class="float-left">
										<div class="text float-left">
											<div class="clearfix">
												<div class="float-left">
													<h6>Marie Karles</h6>
													<span>March 8, 2016 - 8:00am</span>
												</div>
												<ul class="float-right">
													<li><i class="fa fa-star" aria-hidden="true"></i></li>
													<li><i class="fa fa-star" aria-hidden="true"></i></li>
													<li><i class="fa fa-star" aria-hidden="true"></i></li>
													<li><i class="fa fa-star" aria-hidden="true"></i></li>
													<li><i class="fa fa-star" aria-hidden="true"></i></li>
												</ul>
											</div> <!-- /.clearfix -->
											<p>Sed ut perspiciatis unde omnis iste natus sit voluptatem accusantium doloremque laudantium, totamru rem aperiam, eaque ipsa quae ab illo inventore</p>
										</div> <!-- /.text -->
									</div> <!-- /.single-review -->
									<div class="single-review clearfix">
										<img src="images/course/31.jpg" alt="" class="float-left">
										<div class="text float-left">
											<div class="clearfix">
												<div class="float-left">
													<h6>Hasan Abdullah</h6>
													<span>March 8, 2016 - 8:00am</span>
												</div>
												<ul class="float-right">
													<li><i class="fa fa-star" aria-hidden="true"></i></li>
													<li><i class="fa fa-star" aria-hidden="true"></i></li>
													<li><i class="fa fa-star" aria-hidden="true"></i></li>
													<li><i class="fa fa-star" aria-hidden="true"></i></li>
													<li><i class="fa fa-star" aria-hidden="true"></i></li>
												</ul>
											</div> <!-- /.clearfix -->
											<p>Sed ut perspiciatis unde omnis iste natus sit voluptatem accusantium doloremque laudantium, totamru rem aperiam, eaque ipsa quae ab illo inventore</p>
										</div> <!-- /.text -->
									</div> <!-- /.single-review -->
									<div class="single-review clearfix">
										<img src="images/course/32.jpg" alt="" class="float-left">
										<div class="text float-left">
											<div class="clearfix">
												<div class="float-left">
													<h6>Solayman Mi.</h6>
													<span>March 8, 2016 - 8:00am</span>
												</div>
												<ul class="float-right">
													<li><i class="fa fa-star" aria-hidden="true"></i></li>
													<li><i class="fa fa-star" aria-hidden="true"></i></li>
													<li><i class="fa fa-star" aria-hidden="true"></i></li>
													<li><i class="fa fa-star" aria-hidden="true"></i></li>
													<li><i class="fa fa-star" aria-hidden="true"></i></li>
												</ul>
											</div> <!-- /.clearfix -->
											<p>Sed ut perspiciatis unde omnis iste natus sit voluptatem accusantium doloremque laudantium, totamru rem aperiam, eaque ipsa quae ab illo inventore</p>
										</div> <!-- /.text -->
									</div> <!-- /.single-review -->
								</div> <!-- /.course-feedback -->

								<div class="submit-review-form">
									<h3>Submit a Review</h3>
									<p>Your Ratings</p>
									<ul>
										<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
										<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
										<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
										<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
										<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
									</ul>
									<form action="#">
										<div class="row">
											<div class="col-sm-6">
												<label>Your Full Name</label>
												<input type="text" placeholder="Your Name">
											</div>
											<div class="col-sm-6">
												<label>E-mail</label>
												<input type="email" placeholder="sample@email.com">
											</div>
										</div>
										<label>Your Message</label>
										<textarea placeholder="Write Commnent..."></textarea>
										<input type="submit" value="Submit Review" class="s-bg-color">
									</form>
								</div> <!-- /.submit-review-form -->
							</div> <!-- /.details-wrapper -->
						</div> <!-- /.col- -->

						<!-- ************************* SIDEBAR ***************************** -->
						<div class="col-md-4 col-sm-6 col-xs-12">
							<div class="course-sidebar">
								<div class="sidebar-course-information">
									<ul class="price clearfix">
										<li class="float-left"><strong class="s-color"><del>119. <sup>99</sup></del>${course_detail.getPrice()}<sup>.99</sup></strong></li>
										<li class="float-right"><a href="#" class="tran3s"><i class="flaticon-like"></i></a></li>
									</ul>
									<ul class="info-list row">
										<li class="col-xs-6"><b>Lectures :</b> 9</li>
										<li class="col-xs-6"><b>Skill :</b>${course_detail.getSkill()}</li>
										<li class="col-xs-6"><b>Language :</b> English</li>
										<li class="col-xs-6"><b>Duration :</b> 40:23</li>
									</ul>
									<div>
										<ul class="clearfix student-image">
											<li><img src="images/course/24.jpg" alt=""></li>
											<li><img src="images/course/25.jpg" alt=""></li>
											<li><img src="images/course/26.jpg" alt=""></li>
											<li><img src="images/course/27.jpg" alt=""></li>
											<li>
												<div class="image">
													<img src="images/course/24.jpg" alt="">
													<div class="opacity">150+</div>
												</div>
											</li>
										</ul>
										<p><b>1,625</b> Students Enrolled</p>
									</div>
									<c:url var="link3" value="RemoveCourse">
										<c:param name="uid" value="${user_info.getUid()}"></c:param>  
										<c:param name="aid" value="${user_info.getAid()}"></c:param> 
										<c:param name="course_id" value="${course_id}"></c:param> 
	  								</c:url>
									<a href="${link3}" class="tran3s p-bg-color follow hvr-trim">Remove this course</a>
								</div> <!-- /.sidebar-course-information -->

								<div class="sidebar-instructor-info">
									<h4>Instructor Info</h4>
									<div class="wrapper">
										<div class="name">
											<img src="images/course/28.jpg" alt="">
											<h6>${ins_info.getIns_name()}.</h6>
											<span>${ins_info.getMajor() }</span>
											<ul>
												<li><a href="" class="tran3s"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
												<li><a href="" class="tran3s"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
												<li><a href="" class="tran3s"><i class="fa fa-dribbble" aria-hidden="true"></i></a></li>
											</ul>
										</div> <!-- /.name -->
										<p>${ins_info.getDescription()}</p>
										<a href="#" class="tran3s p-bg-color follow hvr-trim">Follow Now</a>
									</div> <!-- /.wrapper -->
								</div> <!-- /.sidebar-instructor-info -->

								<div class="sidebar-categories">
									<h4>Categories</h4>
									<div class="panel-group theme-accordion" id="accordion">
									  <div class="panel">
									    <div class="panel-heading active-panel">
									      <h6 class="panel-title">
									        <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">
									        Web Develoment</a>
									      </h6>
									    </div>
									    <div id="collapse1" class="panel-collapse collapse in">
									      <div class="panel-body">
									      	<ul>
<!-- 									      		<li><a href="#" class="tran3s">Html/Css</a></li>
									      		<li><a href="#" class="tran3s">jQuery</a></li>
									      		<li><a href="#" class="tran3s">Sass/less</a></li> -->
									      	</ul>
									      </div>
									    </div>
									  </div> <!-- /panel 1 -->
									  <div class="panel">
									    <div class="panel-heading">
									      <h6 class="panel-title">
									        <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">
									        Data Science</a>
									      </h6>
									    </div>
									    <div id="collapse2" class="panel-collapse collapse">
									      <div class="panel-body">
	<!-- 								      	<ul>
									      		<li><a href="#" class="tran3s">Html/Css</a></li>
									      		<li><a href="#" class="tran3s">jQuery</a></li>
									      		<li><a href="#" class="tran3s">Sass/less</a></li>
									      	</ul> -->
									      </div>
									    </div>
									  </div> <!-- /panel 2 -->
									  <div class="panel">
									    <div class="panel-heading">
									      <h6 class="panel-title">
									        <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">
									        Machine Learning</a>
									      </h6>
									    </div>
									    <div id="collapse3" class="panel-collapse collapse">
									      <div class="panel-body">
<!-- 									      	<ul>
									      		<li><a href="#" class="tran3s">Html/Css</a></li>
									      		<li><a href="#" class="tran3s">jQuery</a></li>
									      		<li><a href="#" class="tran3s">Sass/less</a></li>
									      	</ul> -->
									      </div>
									    </div>
									  </div> <!-- /panel 3 -->
									  <div class="panel">
									    <div class="panel-heading">
									      <h6 class="panel-title">
									        <a data-toggle="collapse" data-parent="#accordion" href="#collapse4">
									        Probability and Statistic</a>
									      </h6>
									    </div>
									    <div id="collapse4" class="panel-collapse collapse">
									      <div class="panel-body">
<!-- 									      	<ul>
									      		<li><a href="#" class="tran3s">Html/Css</a></li>
									      		<li><a href="#" class="tran3s">jQuery</a></li>
									      		<li><a href="#" class="tran3s">Sass/less</a></li>
									      	</ul> -->
									      </div>
									    </div>
									  </div> <!-- /panel 4 -->
									  <div class="panel">
									    <div class="panel-heading">
									      <h6 class="panel-title">
									        <a data-toggle="collapse" data-parent="#accordion" href="#collapse5">
									        Others</a>
									      </h6>
									    </div>
									    <div id="collapse5" class="panel-collapse collapse">
									      <div class="panel-body">
									      	<ul>
									      		<li><a href="#" class="tran3s">Html/Css</a></li>
									      		<li><a href="#" class="tran3s">jQuery</a></li>
									      		<li><a href="#" class="tran3s">Sass/less</a></li>
									      	</ul>
									      </div>
									    </div>
									  </div> <!-- /panel 5 -->
									</div> <!-- end #accordion -->
								</div> <!-- /.sidebar-categories -->
							</div> <!-- /.course-sidebar -->
						</div> <!-- /.col- -->
					</div> <!-- /.row -->
				</div> <!-- /.container -->
			</div> <!-- /.our-course -->


			
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
		<!-- js ui -->
		<script src="vendor/jquery-ui/jquery-ui.min.js"></script>
		<!-- Fancybox -->
		<script type="text/javascript" src="vendor/fancybox/dist/jquery.fancybox.min.js"></script>

		<!-- Theme js -->
		<script type="text/javascript" src="js/theme.js"></script>

		</div> <!-- /.main-page-wrapper -->
	</body>
</html>