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

		<title>Happourse - Online Study Website</title>

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
			<jsp:include page="inner_banner.jsp"></jsp:include>


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
								<img src="${course_detail.getImg_path()}" alt="">
								<a href="CourseLesson?course_id=${course_id}" class="tran3s p-bg-color follow hvr-trim" style="padding: 15px 102px 15px 102px;border-radius: 3px;color: white; display:inline">LEARN NOW</a>
								<p class="p1"> </p>
								<div class="learn-list">
									<h3>What Will I Learn?</h3>
									<ul class="row">
										<li class="col-sm-12 col-xs-12"><span>${course_detail.getDesciption()}</span></li>
									</ul>
								</div>

								<div class="curriculum-panel">
									<div class="clearfix">
										<h3 class="float-left">Curriculum</h3>
										<ul class="float-right">
											<li><span>${chapter.size()}</span> Lectures</li>
											<li><span>40 : 30</span></li>
										</ul>
									</div>
									<div class="panel-group theme-accordion" id="accordionTwo">
									<c:forEach var="tempChapter" items="${chapter}" varStatus="myIndex">
									 <div class="panel">
									    <div class="panel-heading">
									      <h5 class="panel-title">
									        <a data-toggle="collapse" data-parent="#accordionTwo" href="#" class="clearfix">
									        	<h6 class="float-left">
										        	<span>Lecture 1. ${myIndex.index}</span>
										        	${tempChapter.getName()}
										        </h6>
										        <p class="float-right">26:19min</p>
									        </a>
									      </h5>
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
												<h2>${averageRating }</h2>
												<p>Avarage rating (${reviewList.size() })</p>
												<ul>
													<c:forEach var="i" begin="1" end="5">
											      		<c:choose>
											      			<c:when test="${numberStars >= i}">
											      				<li><i class="fa fa-star" aria-hidden="true"></i></li>
											      			</c:when>
											      			<c:otherwise>
											      				<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
											      			</c:otherwise>
											      		</c:choose>
											        </c:forEach>
										        </ul>
											</li>
											<li class="float-left">
												<c:forEach var="temp" begin="1" end="5">
													<ul class="clearfix">
														<li>${6-temp} Star</li>
														<li><div style="width:${Math.round(listFeedback[6-temp]*100/reviewList.size())}%;"></div></li>
														<li>${Math.round(listFeedback[6-temp]*100/reviewList.size())}%</li>
														<li class="float-right">(${listFeedback[6-temp]} Reviews)</li>
													</ul>										
												</c:forEach>
											</li>
										</ul>
									</div> <!-- /.feedback-container -->
									<c:forEach var="tempReview" items="${reviewList}">
										<div class="single-review clearfix">
											<img src="${tempReview.getImg_path() }" alt="" class="float-left">
											<div class="text float-left">
												<div class="clearfix">
													<div class="float-left">
														<h6>${tempReview.getUser_name() }</h6>
														<span>${tempReview.getReview_date() }</span>
													</div>
													<ul class="float-right">
												      	<c:forEach var="i" begin="1" end="5">
												      		<c:choose>
												      			<c:when test="${tempReview.getStar_rate() >= i}">
												      				<li><i class="fa fa-star" aria-hidden="true"></i></li>
												      			</c:when>
												      			<c:otherwise>
												      				<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
												      			</c:otherwise>
												      		</c:choose>
												        </c:forEach>
													</ul>
												</div> <!-- /.clearfix -->
												<p>${tempReview.getReview_content() }</p>
											</div> <!-- /.text -->
										</div> <!-- /.single-review -->
									</c:forEach>
								</div> <!-- /.course-feedback -->
								<c:choose>
									<c:when test="${checkReviewed == 0}">
										<div class="submit-review-form">
										  <form action="ReviewCourse" method="get">
											<h3>Submit a Review</h3>
											<label>Your Ratings</label>
											<div class="row">
											    <div class="col-lg-12">
											      <div class="star-rating">
											        <span class="fa fa-star-o" data-rating="1"></span>
											        <span class="fa fa-star-o" data-rating="2"></span>
											        <span class="fa fa-star-o" data-rating="3"></span>
											        <span class="fa fa-star-o" data-rating="4"></span>
											        <span class="fa fa-star-o" data-rating="5"></span>
											        <input type="hidden" name="review-rate" class="rating-value" value="0">
											        <input type="hidden" name="course_id" value="${course_id}">
											      </div>
											    </div>
											</div>
											<br>
											<label>Your Message</label>
											<textarea placeholder="Write Commnent..." name="review-content"></textarea>
											<input type="submit" value="Submit Review" class="s-bg-color">
										  </form>
										</div> <!-- /.submit-review-form -->
									</c:when>
								</c:choose>
								
							</div> <!-- /.details-wrapper -->
						</div> <!-- /.col- -->

						<!-- ************************* SIDEBAR ***************************** -->
						<div class="col-md-4 col-sm-6 col-xs-12">
							<div class="course-sidebar">
								<div class="sidebar-course-information">
									<ul class="price clearfix">
										<li class="float-left"><strong class="s-color"><del>${course_detail.getPrice2() + 19}$<sup>.99</sup></del>${course_detail.getPrice2()}$<sup></sup></strong></li>
										<li class="float-right"><a href="#" class="tran3s"><i class="flaticon-like"></i></a></li>
									</ul>
									<ul class="info-list row">
										<li class="col-xs-6"><b>Lectures :</b> ${chapter.size()}</li>
										<li class="col-xs-6"><b>Tags :</b>${hashtagOfCourse}</li>
										<li class="col-xs-6"><b>Language :</b> ${course_detail.getLanguage()}</li>
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
										<p><b>${num_students }</b> Students Enrolled</p>
									</div>
									<c:url var="removeCourse" value="RemoveCourse">
										<c:param name="course_id" value="${course_id}"></c:param> 
	  								</c:url>
									<a href="${removeCourse}" class="tran3s p-bg-color follow hvr-trim" style="padding: 10px 50px 10px 50px;border-radius: 3px;color: white;background: darkblue;">REMOVE THIS COURSE</a>
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
										<a href="#" class="tran3s p-bg-color follow hvr-trim" style="background: darkblue;">Follow Now</a>
									</div> <!-- /.wrapper -->
								</div> <!-- /.sidebar-instructor-info -->
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
		<!-- Fancybox -->
		<script type="text/javascript" src="vendor/fancybox/dist/jquery.fancybox.min.js"></script>

		<!-- Theme js -->
		<script type="text/javascript" src="js/theme.js"></script>
		
		<script>
		var $star_rating = $('.star-rating .fa');

		var SetRatingStar = function() {
		  return $star_rating.each(function() {
		    if (parseInt($star_rating.siblings('input.rating-value').val()) >= parseInt($(this).data('rating'))) {
		      return $(this).removeClass('fa-star-o').addClass('fa-star');
		    } else {
		      return $(this).removeClass('fa-star').addClass('fa-star-o');
		    }
		  });
		};

		$star_rating.on('click', function() {
		  $star_rating.siblings('input.rating-value').val($(this).data('rating'));
		  return SetRatingStar();
		});

		SetRatingStar();
		$(document).ready(function() {

		});
		</script>

		</div> <!-- /.main-page-wrapper -->
	</body>
</html>