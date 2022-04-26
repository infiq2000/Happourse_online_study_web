<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<%@ page import="Dao.*"%>
<%@ page import="Model.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<!-- For IE -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- For Resposive Device -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Happourse</title>

<!-- Favicon -->
<link rel="icon" type="image/png" sizes="56x56"
	href="images/fav-icon/icon.png">


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
		<jsp:include page="inner_banner.jsp"></jsp:include>


		<!-- 
			=============================================
				Shop Page 
			============================================== 
			-->
		<div class="shop-page">
			<div class="container">
				<div class="row">
					<div
						class="col-lg-12 col-md-8 col-xs-12 all-product-wrapper shop-details">
						<div class="single-product-details clearfix row">
							<div class="image col-lg-5 col-xs-12">
								<img src="${course_detail.getImg_path()}" alt="">
							</div>
							<!-- /.image -->
							<div class="info col-lg-7 col-xs-12">
								<h3>${course_detail.getName()}</h3>
								<strong
									style="background: red; padding: 10px; border-radius: 5px; color: white;">$${course_detail.getPrice2()}</strong>
								<ul class="rating">
									<c:forEach var="i" begin="1" end="5">
										<c:choose>
											<c:when test="${course_detail.getStar_rate() >= i}">
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
											</c:when>
											<c:otherwise>
												<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<li>${course_detail.getStar_rate()}</li>
									<li>${course_detail.getTotal_comment()}Reviews</li>
								</ul>
								<p>${course_detail.getDesciption()}</p>
								<div class="clearfix">
									<div class="quantity float-left">
										<h6>Instructor: ${ins_info.getIns_name()}</h6>
									</div>
									<!-- /.quantity -->
									<div class="color-show float-left"></div>
								</div>
								<c:url var="Link4" value="Enroll">
									<c:param name="course_id" value="${course_id}"></c:param>
								</c:url>
								<a href="${Link4}" class="add-cart tran3s"
									onclick="if (!(confirm('Ban da muon dang ki khoa hoc?'))) return false"
									style="background: red; color: white;">BUY NOW </a>
								<form action="CartController/add" method = "Post">
									<input name="course_id" type="hidden" value="${course_id}">
									 <button>ADD TO CART</button>
								</form>
								 <a href="#" class="wishlist tran3s">ADD TO WISHLIST</a>
							</div>
							<!-- /.info -->
						</div>
						<!-- /.single-product-details -->

						<div class="review-tab">
							<ul class="nav nav-tabs">
								<li class="active"><a data-toggle="tab" href="#home">Description</a></li>
								<li><a data-toggle="tab" href="#menu1">Reviews</a></li>
							</ul>
							<div class="tab-content">
								<div id="home" class="tab-pane fade in active">
									${course_detail.getDesciption()}</div>
								<div id="menu1" class="tab-pane fade"></div>
							</div>
						</div>
						<%
						List<Courses> listCourses = (List<Courses>) request.getAttribute("listCourses");
						int page_number = (int) listCourses.size();
						%>
						<div class="related-product all-product-wrapper">
							<h5>Releted Products</h5>
							<div class="row">
								<div class="related-product-slider">
									<c:forEach begin="1" end="<%=page_number%>" var="i">
										<%
										int y = (int) pageContext.getAttribute("i");
										Courses temp = null;
										if (y < listCourses.size()) {
											temp = listCourses.get(y);
										}
										%>
										<%
										if (temp != null) {
										%>
										<div class="item">
											<div class="single-item">
												<img src="<%=temp.getImg_path()%>" alt="">
												<h5>
													<a href="" class="tran3s"><%=temp.getName()%></a>
												</h5>
												<div class="clearfix">
													<strong class="float-left">$<%=temp.getPrice2()%></strong>
												</div>
											</div>
											<!-- /.single-item -->
										</div>
										<%
										} else {
										%>

										<%
										}
										%>
									</c:forEach>

								</div>
								<!-- /.related-product-slider -->
							</div>
							<!-- /.row -->
						</div>
						<!-- /.related-product -->
					</div>
					<!-- /.shop-large-side -->

				</div>
				<!-- /.row -->
			</div>
			<!-- /.container -->
		</div>
		<!-- /.shop-page -->




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
		<script type="text/javascript"
			src="vendor/bootstrap-select/dist/js/bootstrap-select.js"></script>

		<!-- Bootstrap JS -->
		<script type="text/javascript" src="vendor/bootstrap/bootstrap.min.js"></script>

		<!-- Vendor js _________ -->
		<!-- Camera Slider -->
		<script type='text/javascript'
			src='vendor/Camera-master/scripts/jquery.mobile.customized.min.js'></script>
		<script type='text/javascript'
			src='vendor/Camera-master/scripts/jquery.easing.1.3.js'></script>
		<script type='text/javascript'
			src='vendor/Camera-master/scripts/camera.min.js'></script>
		<!-- Mega menu  -->
		<script type="text/javascript"
			src="vendor/bootstrap-mega-menu/js/menu.js"></script>

		<!-- WOW js -->
		<script type="text/javascript" src="vendor/WOW-master/dist/wow.min.js"></script>
		<!-- owl.carousel -->
		<script type="text/javascript"
			src="vendor/owl-carousel/owl.carousel.min.js"></script>
		<!-- js count to -->
		<script type="text/javascript"
			src="vendor/Counter/jquery.counterup.min.js"></script>
		<script src="vendor/Counter/jquery.waypoints.min.js"></script>
		<!-- js ui -->
		<script src="vendor/jquery-ui/jquery-ui.min.js"></script>

		<!-- Theme js -->
		<script type="text/javascript" src="js/theme.js"></script>

	</div>
	<!-- /.main-page-wrapper -->
</body>
</html>