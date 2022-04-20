<%@page import="Dao.UserUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*" %>
<%@ page import="Model.Category" %>
<%@ page import="Dao.CourseUtil" %>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*" %>
<%@ page import="Model.User" %>
<%@ page import="Dao.UserUtil" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
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
			<jsp:include page="inner_banner.jsp" />

	
			<!-- 
			=============================================
				Our Course
			============================================== 
			-->
			<div class="our-course course-grid">
				<div class="container">
					<div class="row">
						
						<!-- 	"Show course" -->
						
						<div class="col-lg-9 col-md-8 col-xs-12 popular-course float-right">
	<!-- 						<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
								<div class="course-sidebar">
	
									<div class="course-filter">
											<div class="course-price-filter">
												<h5>Price Range</h5>
												<div class="price-ranger">
													<div class="ranger-min-max-block">
														<ul class="clearfix">
															<li class="float-left">
																<label for="min">From</label>
																<input type="text" class="min" readonly>
															</li>
															<li class="float-left">
																<label for="max">To</label>
																<input type="text" class="max" readonly>
															</li>
														</ul>
													</div>
													<div id="slider-range"></div>
												</div> /price-ranger
											</div> /.course-price-filter
									</div> /.course-filter
								</div> /.course-sidebar
							</div> /.col- -->
							<div class="course-style-filter clearfix">
								<ul class="float-left clearfix">
									<li><a href="CourseByType?type=all" class="tran3s ${allActive }" id="type1">All</a></li>
									<li><a href="CourseByType?type=new" class="tran3s ${newActive }" id="type2">New</a></li>
									<li><a href="CourseByType?type=popular" class="tran3s ${popularActive }" id="type3">Popular</a></li>
									<li><a href="CourseByType?type=free" class="tran3s ${freeActive }" id="type4">Free</a></li>
								</ul>
								<ul class="float-right">
									<li><a href="#" class="tran3s active"><i class="fa fa-th-large" aria-hidden="true"></i></a></li>
									<li><a href="course-list.html" class="tran3s"><i class="fa fa-list" aria-hidden="true"></i></a></li>
								</ul>
							</div>
							<div id="course" class="row">
								<c:forEach var="tempCourse" items="${listCourses}">
									<div class="col-lg-4 col-sm-6 col-xs-6">
										<div class="single-course" style="border: 0px;">
											<div class="image-box"><img style="width: 270px;height: 120px;" src="${tempCourse.getImg_path()}" alt=""></div>
											<div class="text">
												<div class="image"><img src="${tempCourse.getImg_path_instructor() }" alt=""></div>
												<div class="name clearfix">
													<h6 class="float-left">${tempCourse.getIns_name() }</h6>
													<span class="p-bg-color float-right">${tempCourse.getPrice2()} $ <sup>.99</sup></span>
												</div>
												<c:url var="tempLink" value="CourseDetail">
													<c:param name="course_id" value="${tempCourse.getCourses_id()}"></c:param>
	  											</c:url>
												<h5><a href="${tempLink}" class="tran3s" style="height:90px;">${tempCourse.getName()}</a></h5>
												<ul class="clearfix">
													<li class="float-left">
														<i class="flaticon-people"></i>
														<a href="#" class="tran3s">${tempCourse.getCountCourses()}</a>
													</li>
													<li class="float-left">
														<i class="flaticon-comments"></i>
														<a href="#" class="tran3s">${tempCourse.getTotal_comment()}</a>
													</li>
													<li class="float-right">
														<i class="flaticon-heart"></i>
														<a href="#" class="tran3s">${tempCourse.getStar_rate()}</a>
													</li>
												</ul>
											</div>
										</div> <!-- /.single-course -->

									</div> <!-- /.col- -->
								</c:forEach> 
							</div> <!-- /.row -->
							<ul class="theme-pagination clearfix">
								<c:forEach begin="1" end="${pagesNumber }" var="page">
									<li><a href="PageCourses?page=${page }&txtSearch=${search }&cid=${cid}&type=${type}" class="tran3s">${page }</a></li>
								</c:forEach>							
								<!--  <li><a href="#" class="tran3s">Next</a></li> -->
							</ul> <!-- /.theme-pagination -->
						</div> <!-- /.popular-course -->

						<!-- ************************* SIDEBAR ***************************** -->
						<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
							<div class="course-sidebar">	
								<div class="course-filter">
										<div class="course-price-filter">
											<h4>Price Range</h4>
											<div class="price-ranger">
												<div class="ranger-min-max-block">
													<ul class="clearfix">
														<li class="float-left">
															<label for="min">From</label>
															<input id ="minPrice" type="text" class="min" readonly>
														</li>
														<li class="float-left">
															<label for="max">To</label>
															<input id ="maxPrice" type="text" class="max" readonly>
														</li>
														<button onclick="price()" class="tran6s" type="submit"><i class="fa fa-search"></i></button>	
													</ul>
												</div>
												<div id="slider-range"></div>
											</div> 
										</div> 
								</div> <!-- /.course-filter -->
							</div> <!-- /.course-sidebar -->
						</div> <!-- /.col- -->
						<jsp:include page="Category.jsp" />
						
					<div id="slider-range"></div>
				</div> <!-- /price-ranger -->
						
						<!-- Doan category bi xoa -->

						<!--Doan category bi xoa  -->
						
						
					</div> <!-- /.row -->
				</div> <!-- /.container -->
			</div> <!-- /.our-course -->


			
			<!-- 
			=============================================
				Footer
			============================================== 
			-->
			<jsp:include page="footer.jsp" />


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
		<script type="text/javascript" src="js/SearchPrice.js"></script> 
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
		<script type="text/javascript" src="js/usepage.js"></script>

		</div> <!-- /.main-page-wrapper -->
	</body>
</html>