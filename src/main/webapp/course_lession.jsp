<%@page import="Dao.LectureUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="Dao.UserUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*" %>
<%@ page import="Model.Category" %>
<%@ page import="Dao.CourseUtil" %>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*" %>
<%@ page import="Model.User" %>
<%@ page import="Dao.UserUtil" %>
<%@ page import="Model.Chapter" %>
<%@ page import="Dao.LectureUtil" %>
<%@ page import="Model.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
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
    
    
    
	
<div class="page-wrapper">
	<!-- Content Side -->
	<div class="sidebar-page-container">
    	<div class="auto-container">
        	<div class="row clearfix">
                <div class="content-side middle-sidebar col-lg-6 col-md-12 col-sm-12">
					<!-- Sec Title -->
                	<div class="sec-title">
						<h4>${course_detail.getName() }</h4>
					</div>
					<!-- Video Box -->
					<div class="video-box">
						<figure class="video-image">
							<img src="${course_detail.getImg_path()}" alt="">
						</figure>
						<a href="https://youtu.be/7m8ek8D9me0" class="lightbox-image overlay-box"><span class="flaticon-media-play-symbol"><i class='fa fa-play'></i></span></a>
					</div>
					<!-- Video Info Boxed -->
					<div class="video-info-boxed">
						<div class="clearfix">
							<div class="pull-left">
								
								<h6>${course_detail.getDesciption() }</h6>
								<div class="author">
									<div class="user-image"><img src="images/resource/author-10.jpg" alt="" /></div>${ins_info.getIns_name()}
								</div>
								<!-- Follow -->
								<div class="follow"><a href="#">+ Follow</a></div>
								
							</div>
							
							<div class="pull-right">
								
								<ul class="social-box">
									<li class="share">Share now on</li>
									<li class="facebook"><a href="#" class="fa fa-facebook"></a></li>
									<li class="google"><a href="#" class="fa fa-google"></a></li>
									<li class="twitter"><a href="#" class="fa fa-twitter"></a></li>
								</ul>
							</div>
							
						</div>
						<video style="border:1px solid black;float:right;border-radius: 8px; margin: 40px 150px 20px 0; background: white; display: none;" id="video" height="110" width="160" autoplay></video>
						<canvas style="border:1px solid black;float:right;border-radius: 8px; margin: 40px 150px 20px 0; background: white; display: none;" id="canvas1" width="600" height="458"></canvas>
						
						<div style="margin-top: 20px; background: pink; padding: 20px; border-radius: 5px;">
							<b style="color: red; margin-left: 200px; font-size: 18px;">Help We Improve Content Quality</b>
							<button class="tran3s p-bg-color follow hvr-trim" id="on" style="padding: 10px 50px 10px 50px;border-radius: 3px;color: white;background: darkgreen">TURN ON WEBCAM</button>
							<button class="tran3s p-bg-color follow hvr-trim" id="off" style="padding: 10px 47px 10px 47px;border-radius: 3px;color: white;background: darkgray; display: none; margin:20px 0 0 537px;">TURN OFF WEBCAM</button>
							
							<div id="mood_rate" style="display:none;margin: 20px 0 0 525px;">
								<b style="margin-left:50px;">Mood</b>
								<input type="text" disabled="True" id="mood_rate_text_1" style="color: red;font-size: 16px;padding: 10px 5px 10px 5px; margin-left:20px; width:80px; ">
								<input type="text" disabled="True" id="mood_rate_text_2" style="color: red;font-size: 16px;padding: 10px 5px 10px 5px; margin-left:20px; width:80px; ">
								<input type="text" disabled="True" id="mood_rate_text_3" style="color: red;font-size: 16px;padding: 10px 5px 10px 5px; margin-left:20px; width:80px;">
								<input type="text" disabled="True" id="mood_rate_text_total" style="color: red;font-size: 16px;padding: 10px 5px 10px 5px; margin-left:20px; width:80px;">
								<i><b id="mood_rate_label" style="margin-left:50px; color:green; font-size: 20px;">Excellent!</b></i>
							</div>
						</div>
						
					</div>
					<!-- End Video Info Boxed -->
					
					<!-- Course Info Tabs-->
					<div class="course-info-tabs">
						<!-- Course Tabs-->
						<div class="course-tabs tabs-box">
							
							<!-- Tab Btns -->
							<ul class="tab-btns tab-buttons clearfix">
								<li data-tab="#prod-class" class="active-btn tab-btn">Class Details</li>
								<li data-tab="#prod-curriculum" class="tab-btn">Curriculum</li>
								<li data-tab="#prod-review" class="tab-btn">Reviews</li>
							</ul>
							
							<!-- Tabs Container -->
							<div class="tabs-content">
								
								<!-- Tab / Active Tab -->
								<div class="tab active-tab" id="prod-class">
									<div class="content">
										<!-- Class Detail Content -->
										<div class="class-detail-content">
											<h4>25 That Prevent Job Seekers From Overcoming Failure</h4>
											<div class="text">Phasellus enim magna, varius et commodo ut, ultricies vitae velit. Ut nulla tellus, eleifend euismod pellentesque vel, sagittis vel justo. In libero urna, venenatis sit amet ornare non, suscipit nec risus. Sed consequat justo non mauris pretium at tempor justo sodales. Quisque tincidunt.</div>
											<h6>What you’ll learn?</h6>
											<ul class="list-style-one">
												<li>Phasellus enim magna, up above the most like varius et commodo ut.</li>
												<li>Sed consequat justo non profit us mauris pretium at tempor justo.</li>
												<li>Ut nulla tellus, eleifend euismod pellentesque most of the vel, sagitti</li>
												<li>Phasellus enim magna, varius et commodo ut.</li>
												<li>Sed consequat justo non mauris recent pretium at tempor justo.</li>
												<li>Ut nulla tellus, eleifend euismod pellentesque vel, sagitti</li>
											</ul>
										</div>
									</div>
								</div>
								<%
								InitialContext ctx;
							  	DataSource ds;
							 	ctx = new InitialContext();
						    	ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Happourse");
								List<Chapter> chapter_list = (List<Chapter>)request.getAttribute("list_chapter");
								LectureUtil lecUtil = new LectureUtil(ds);
								%>
								
								<!-- Tab -->
								<div class="tab" id="prod-curriculum">
									<div class="content">
										
										<!-- Accordion Box -->
										<ul class="accordion-box">
																						<!-- Block -->
											<%
											  	
												int chapter_number = 0;
												Chapter ch1 = null;
												if (chapter_list.size()!=0){
													chapter_number = chapter_list.size();
													ch1 = chapter_list.get(0);
												}
												int flag = -1;
												if (chapter_number < 2){
													flag = 0;
												}
												
											%>
											<% if (ch1 != null) { %>
												<%
											    	
											    	List<Content> list_of_content1 = lecUtil.getContents(ch1.getChap_id());
												%>
												<li class="accordion block">
													<div class="acc-btn active"><div class="icon-outer"><span class="icon icon-plus flaticon-down-arrow"></span></div><%=ch1.getName() %></div>
													<div class="acc-content current">
														<c:forEach items="<%=list_of_content1%>" var="ct">
															<div class="content">
																<div class="clearfix">
																	<div class="pull-left">
																		<a href="${ct.getLink()}" class="lightbox-image play-icon"><span class="fa fa-play"></span>${ct.getName()}</a>
																	</div>
																	<div class="pull-right">
																		<div class="minutes">35 Minutes</div>
																	</div>
																</div>
															</div>
														</c:forEach>
													</div>
												</li>	
										      <% } else { %>
										         	<p> no chapter</p>
										      <% } %>
										      <% if (flag != 0) { %>
													<c:forEach begin="1" end="<%= chapter_number-1 %>" var="i">
											<!-- Block -->
											<%
												int i = (int)pageContext.getAttribute("i");
											%>
																							<%
											    	List<Content> list_of_content2 = lecUtil.getContents(chapter_list.get(i).getChap_id());
												%>
												<li class="accordion block">
													<div class="acc-btn"><div class="icon-outer"><span class="icon icon-plus flaticon-down-arrow"></span></div><%=chapter_list.get(i).getName() %></div>
													<div class="acc-content">
														<c:forEach items="<%=list_of_content2%>" var="ct">
															<div class="content">
																<div class="clearfix">
																	<div class="pull-left">
																		<a href="${ct.getLink()}" class="lightbox-image play-icon"><span class="fa fa-play"></span>${ct.getName()}</a>
																	</div>
																	<div class="pull-right">
																		<div class="minutes">35 Minutes</div>
																	</div>
																</div>
															</div>
														</c:forEach>
													</div>
												</li>
											</c:forEach>
										      <% } else { %>
										         
										      <% } %>
											
											
																					
										</ul>
										
									</div>
								</div>
								
								<!-- Tab -->
								<div class="tab" id="prod-review">
									<div class="content">
										<div class="student-review-box">
											<h6>Student Feedback</h6>
											
											<!-- Inner Student Review Box -->
											<div class="inner-student-review-box">
												<div class="row clearfix">
													
													<!-- Rating Column -->
													<div class="rating-column col-lg-3 col-md-6 col-sm-12">
														<div class="inner-column">
															<div class="total-rating">4.2</div>
															<div class="rating">
																<span class="fa fa-star"></span>
																<span class="fa fa-star"></span>
																<span class="fa fa-star"></span>
																<span class="fa fa-star"></span>
																<span class="fa light fa-star-o"></span>
															</div>
															<div class="title">Course Rating</div>
														</div>
													</div>
													<!-- Graph Column -->
													<div class="graph-column col-lg-6 col-md-12 col-sm-12">
														
														<!-- Skills -->
														<div class="skills">

															<!-- Skill Item -->
															<div class="skill-item">
																<div class="skill-header clearfix">
																	<div class="skill-percentage"><div class="count-box"><span class="count-text" data-speed="2000" data-stop="78">0</span>%</div></div>
																</div>
																<div class="skill-bar">
																	<div class="bar-inner"><div class="bar progress-line" data-width="78"></div></div>
																</div>
															</div>

															<!-- Skill Item -->
															<div class="skill-item">
																<div class="skill-header clearfix">
																	<div class="skill-percentage"><div class="count-box"><span class="count-text" data-speed="2000" data-stop="60">0</span>%</div></div>
																</div>
																<div class="skill-bar">
																	<div class="bar-inner"><div class="bar progress-line" data-width="60"></div></div>
																</div>
															</div>

															<!-- Skill Item -->
															<div class="skill-item">
																<div class="skill-header clearfix">
																	<div class="skill-percentage"><div class="count-box"><span class="count-text" data-speed="2000" data-stop="45">0</span>%</div></div>
																</div>
																<div class="skill-bar">
																	<div class="bar-inner"><div class="bar progress-line" data-width="45"></div></div>
																</div>
															</div>
															
															<!-- Skill Item -->
															<div class="skill-item">
																<div class="skill-header clearfix">
																	<div class="skill-percentage"><div class="count-box"><span class="count-text" data-speed="2000" data-stop="15">0</span>%</div></div>
																</div>
																<div class="skill-bar">
																	<div class="bar-inner"><div class="bar progress-line" data-width="15"></div></div>
																</div>
															</div>

															<!-- Skill Item -->
															<div class="skill-item">
																<div class="skill-header clearfix">
																	<div class="skill-percentage"><div class="count-box"><span class="count-text" data-speed="2000" data-stop="1">0</span>%</div></div>
																</div>
																<div class="skill-bar">
																	<div class="bar-inner"><div class="bar progress-line" data-width="1"></div></div>
																</div>
															</div>

														</div>
														
													</div>
													<!-- Stars Column -->
													<div class="stars-column col-lg-3 col-md-6 col-sm-12">
														
														<div class="rating">
															<span class="fa fa-star"></span>
															<span class="fa fa-star"></span>
															<span class="fa fa-star"></span>
															<span class="fa fa-star"></span>
															<span class="fa light fa-star-o"></span>
															<i>78%</i>
														</div>
														
														<div class="rating">
															<span class="fa fa-star"></span>
															<span class="fa fa-star"></span>
															<span class="fa fa-star"></span>
															<span class="fa fa-star"></span>
															<span class="fa light fa-star-o"></span>
															<i>60%</i>
														</div>
														
														<div class="rating">
															<span class="fa fa-star"></span>
															<span class="fa fa-star"></span>
															<span class="fa fa-star"></span>
															<span class="fa fa-star"></span>
															<span class="fa light fa-star-o"></span>
															<i>45%</i>
														</div>
														
														<div class="rating">
															<span class="fa fa-star"></span>
															<span class="fa fa-star"></span>
															<span class="fa fa-star"></span>
															<span class="fa fa-star"></span>
															<span class="fa light fa-star-o"></span>
															<i>15%</i>
														</div>
														
														<div class="rating">
															<span class="fa fa-star"></span>
															<span class="fa fa-star"></span>
															<span class="fa fa-star"></span>
															<span class="fa fa-star"></span>
															<span class="fa light fa-star-o"></span>
															<i>1%</i>
														</div>
														
													</div>
													
												</div>
											</div>
											
										</div>
										
										<!-- Review Comments Box -->
										<div class="review-comments-box">
											<h6>Reviews</h6>
											
											<!-- Reviewer Comment Box -->
											<div class="reviewer-comment-box">
												<h4>Anna Sthesia</h4>
												<div class="rating">
													<span class="total-rating">4.0</span> <span class="fa fa-star"></span><span class="fa fa-star"></span><span class="fa fa-star"></span><span class="fa fa-star"></span><span class="light fa fa-star-o"></span>&ensp; 3 days ago
												</div>
												<div class="text">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation</div>
												<div class="helpful">Was this review helpful?</div>
												<ul class="like-option">
													<li><span class="icon fa fa-thumbs-o-up"></span></li>
													<li><span class="icon fa fa-thumbs-o-down"></span></li>
													<li class="report">Report</li>
												</ul>
											</div>
											
											<!-- Reviewer Comment Box -->
											<div class="reviewer-comment-box">
												<h4>Stephane Smith</h4>
												<div class="rating">
													<span class="total-rating">4.0</span> <span class="fa fa-star"></span><span class="fa fa-star"></span><span class="fa fa-star"></span><span class="fa fa-star"></span><span class="light fa fa-star-o"></span>&ensp; 3 days ago
												</div>
												<div class="text">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation</div>
												<div class="helpful">Was this review helpful?</div>
												<ul class="like-option">
													<li><span class="icon fa fa-thumbs-o-up"></span></li>
													<li><span class="icon fa fa-thumbs-o-down"></span></li>
													<li class="report">Report</li>
												</ul>
											</div>
											
											<!-- Reviewer Comment Box -->
											<div class="reviewer-comment-box">
												<h4>Anna Mull</h4>
												<div class="rating">
													<span class="total-rating">4.0</span> <span class="fa fa-star"></span><span class="fa fa-star"></span><span class="fa fa-star"></span><span class="fa fa-star"></span><span class="light fa fa-star-o"></span>&ensp; 3 days ago
												</div>
												<div class="text">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation</div>
												<div class="helpful">Was this review helpful?</div>
												<ul class="like-option">
													<li><span class="icon fa fa-thumbs-o-up"></span></li>
													<li><span class="icon fa fa-thumbs-o-down"></span></li>
													<li class="report">Report</li>
												</ul>
											</div>
											
											<!-- Reviewer Comment Box -->
											<div class="reviewer-comment-box">
												<h4>Paul Molive</h4>
												<div class="rating">
													<span class="total-rating">4.0</span> <span class="fa fa-star"></span><span class="fa fa-star"></span><span class="fa fa-star"></span><span class="fa fa-star"></span><span class="light fa fa-star-o"></span>&ensp; 3 days ago
												</div>
												<div class="text">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation</div>
												<div class="helpful">Was this review helpful?</div>
												<ul class="like-option">
													<li><span class="icon fa fa-thumbs-o-up"></span></li>
													<li><span class="icon fa fa-thumbs-o-down"></span></li>
													<li class="report">Report</li>
												</ul>
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
</div>
	<!-- End Manage Cource Section -->
	
	
	
</div>

	<!-- Main Footer -->
	<jsp:include page="footer.jsp"></jsp:include>
	
    
	<!-- Scroll Top Button -->
			<button class="scroll-top tran3s">
				<i class="fa fa-angle-up" aria-hidden="true"></i>
			</button>






 <script src="js/ins/jquery.js"></script><!-- -->
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

		 <script type="text/javascript" src="js/html2canvas.js"></script>		
		
		
		<!-- j Query -->
		<script type="text/javascript" src="vendor/jquery.2.2.3.min.js"></script>
		<script type="text/javascript" src="js/lession.js"></script>
		<script src="js/face/face-api.min.js"></script>
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