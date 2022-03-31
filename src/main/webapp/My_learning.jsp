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
			<jsp:include page="Header.jsp" />
						
			<!-- 
			=============================================
				Theme Inner Banner
			============================================== 
			-->
			<jsp:include page="inner_banner.jsp"></jsp:include>


			<!-- 
			=============================================
				Our Course
			============================================== 
			-->
			<div class="our-course course-list">
				<div class="container">
					<div class="row">
						<div class="col-lg-9 col-md-8 col-xs-12 popular-course float-right">
							<div class="course-style-filter clearfix">
								<ul class="float-left clearfix">
									<li><a href="#" class="tran3s active">Current</a></li>
								</ul>
								<ul class="float-right">
									<li><a href="course-grid.html" class="tran3s"><i class="fa fa-th-large" aria-hidden="true"></i></a></li>
									<li><a href="#" class="tran3s active"><i class="fa fa-list" aria-hidden="true"></i></a></li>
								</ul>
							</div> <!-- /.course-style-filter -->
								<c:forEach var="tempCourse" items="${listCourses}">
									<div class="single-course clearfix trending">
									<div class="image-box float-left"><img src="images/course/33.jpg" alt=""></div>
									<div class="text float-left">
										<div class="name clearfix">
											<div class="image"><img src="images/logo/logo10.jpg" alt=""></div>
											<div class="float-left">
												<h6> ${tempCourse.getIns_name()}</h6>
												<i>${tempCourse.getIns_major()}</i>
											</div>
											<strong class="s-color float-right"><del>159. <sup>99</sup></del>$${tempCourse.getPrice()}<sup>.99</sup></strong>
										</div>
										<c:url var="tempLink2" value="CourseDetail">
													<c:param name="course_id" value="${tempCourse.getCourses_id()}"></c:param>
	  									</c:url>
										<h5><a href="${tempLink2}" class="tran3s">${tempCourse.getName()}</a></h5>
										<p>${tempCourse.getDesciption()}</p>
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
								</c:forEach>
							<ul class="theme-pagination clearfix">
								<li><a href="" class="tran3s active">1</a></li>
								<li><a href="" class="tran3s">2</a></li>
								<li><a href="" class="tran3s">3</a></li>
								<li><a href="#" class="tran3s">Next</a></li>
							</ul> <!-- /.theme-pagination -->
						</div> <!-- /.popular-course -->

						<!-- ************************* SIDEBAR ***************************** -->
						<jsp:include page="Category.jsp" />
					</div> <!-- /.row -->
				</div> <!-- /.container -->
			</div> <!-- /.our-course -->


			
			<!-- 
			=============================================
				Footer
			============================================== 
			-->
			<jsp:include page="footer.jsp"></jsp:include>

	        

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

		<!-- Theme js -->
		<script type="text/javascript" src="js/theme.js"></script>

		</div> <!-- /.main-page-wrapper -->
	</body>
</html>