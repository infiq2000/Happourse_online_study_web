<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*" %>
<%@ page import="Model.Courses" %>
<%@ page import="Model.ManagedCourses" %>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*" %>
<%@ page import="Dao.CourseUtil" %>
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
    
    
    
<div class="page-wrapper">	
<div class="sidebar-page-container">
    	<div class="auto-container">
        	<div class="row clearfix">
				
				<!-- Content Side -->
                <div class="content-side col-lg-12 col-md-12 col-sm-12">
					<!-- Sec Title -->
					<div class="sec-title">
						<h4>Blog Detail</h4>
					</div>
					
					<!-- News Detail -->
					<div class="news-detail">
						<div class="inner-box">
							<div class="image" style="height: 300px;width: 600px;margin: 10px 50% 10px 30%;">
								<img src="images/blog/b1.jpg" alt="" />
							</div>
							<div class="lower-content">
								<h6>Introduction to YOLOv5 Object Detection with Tutorial</h6>
								
								<div class="clearfix">
									<div class="pull-left">
										<div class="author">By: Tuan Khoi</div>
									</div>
									<div class="pull-left">
										<ul class="news-info">
											<li>1100k Views</li>
											<li>27 Nov 2021</li>
										</ul>
									</div>
									
								</div>
								</br>
								<h6>Introduction</h6>
								<p>In this article, we will go through the tutorial of YOLOv5 for object detection which is supposed to be the latest model of the YOLO family. We will understand what is YOLOv5 and do a high-level comparison between YOLOv4 vs YOLOv5. Finally, we will show you how to use YOLOv5 for object detection on various images and videos.</p>
								<i><p>(But please note that the inclusion of YOLOv5 in the YOLO family is a matter of debate in the community, and neither its paper has been released officially for peer review. So its architectural and performance details mentioned here, as collected from the various sources have to be taken with a pinch of salt.)</p></i>
								<h6>Different Types of YOLOv5</h6>
								<p>YOLOv5 has multiple varieties of pre-trained models as we can see above. The difference between them is the trade-off between the size of the model and inference time. The lightweight model version YOLOv5s is just 14MB but not very accurate. On the other side of the spectrum, we have YOLOv5x whose size is  168MB but is the most accurate version of its family.</p>
								<p>The YOLO family of models consists of three main architectural blocks i) Backbone, ii) Neck and iii) Head.</p>
								<ul class="social-box">
									<li class="share">Share now on</li>
									<li class="facebook"><a href="#" class="fa fa-facebook"></a></li>
									<li class="google"><a href="#" class="fa fa-google"></a></li>
									<li class="twitter"><a href="#" class="fa fa-twitter"></a></li>
								</ul>
							</div>
						</div>

						
						<!-- Comments Area -->
						<div class="comments-area">
							<div class="group-title">
								<h6>Recent Comments</h6>
							</div>
							
							<div class="comment-box">
								<div class="comment">
									<div class="author-thumb"><img src="images/resource/author-15.jpg" alt=""></div>
									<div class="comment-info clearfix"><strong>Anna Sthesia</strong><div class="comment-time">March 28, 2022</div></div>
									<div class="text">Nice</div>
									<ul class="reply-option">
										<li><a href="#"><span class="fa fa-reply"></span>Reply</a></li>
										<li><a href="#"><span class="icon fa fa-flag"></span>Report</a></li>
									</ul>
								</div>
							</div>
							
							<div class="comment-box reply-comment">
								<div class="comment">
									<div class="author-thumb"><img src="images/resource/author-16.jpg" alt=""></div>
									<div class="comment-info clearfix"><strong>Petey Cruiser </strong><div class="comment-time">May 26, 2022</div></div>
									<div class="text">Nice</div>
									<ul class="reply-option">
										<li><a href="#"><span class="fa fa-reply"></span>Reply</a></li>
										<li><a href="#"><span class="icon fa fa-flag"></span>Report</a></li>
									</ul>
								</div>
							</div>
							
							<div class="comment-box">
								<div class="comment">
									<div class="author-thumb"><img src="images/resource/author-17.jpg" alt=""></div>
									<div class="comment-info clearfix"><strong>Jimmy Changa </strong><div class="comment-time">June 24, 2019</div></div>
									<div class="text">Nice</div>
									<ul class="reply-option">
										<li><a href="#"><span class="fa fa-reply"></span>Reply</a></li>
										<li><a href="#"><span class="icon fa fa-flag"></span>Report</a></li>
									</ul>
								</div>
							</div>
							
							<div class="comment-box reply-comment">
								<div class="comment">
									<div class="author-thumb"><img src="images/resource/author-18.jpg" alt=""></div>
									<div class="comment-info clearfix"><strong>Zack Lee</strong><div class="comment-time">May 26, 2020</div></div>
									<div class="text">Nice</div>
									<ul class="reply-option">
										<li><a href="#"><span class="fa fa-reply"></span>Reply</a></li>
										<li><a href="#"><span class="icon fa fa-flag"></span>Report</a></li>
									</ul>
								</div>
							</div>
							
						</div>
						
						<!-- Comment Form -->
						<div class="comment-form">
							<div class="group-title"><h6>Leave Comment</h6></div>
							<div class="form-box">
								<!--Comment Form-->
								<form method="post" action="blog.jsp">
									<div class="row clearfix">
										
										<div class="col-lg-6 col-md-6 col-sm-12 form-group">
											<input type="text" name="username" placeholder="Full Name*" required>
										</div>
										
										<div class="col-lg-6 col-md-6 col-sm-12 form-group">
											<input type="email" name="email" placeholder="Email Address*" required>
										</div>
										
										<div class="col-lg-12 col-md-12 col-sm-12 form-group">
											<textarea class="" name="message" placeholder="Write your thought..."></textarea>
										</div>
										
										<div class="col-lg-12 col-md-12 col-sm-12 form-group">
											<button class="theme-btn btn-style-one" type="submit" name="submit-form"><span class="txt">Post Comment</span></button>
										</div>
										
									</div>
								</form>
							</div>
						</div>
						<!--End Comment Form -->
						
					</div>
					
				</div>
			</div>
		</div>
	</div>
</div>

	<!-- Main Footer -->
	<jsp:include page="footer.jsp"></jsp:include>
	
    
	<!-- Scroll Top Button -->
			<button class="scroll-top tran3s">
				<i class="fa fa-angle-up" aria-hidden="true"></i>
			</button>



<!--<script src="js/ins/jquery.js"></script>-->
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
		<script type="text/javascript" src="js/slide.js"></script>
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
		
		function add_content(){
			
			var qt = document.getElementById("quantity4");
			for (i = 1; i < qt.value; i++){		
				var node = document.getElementById("content1").cloneNode(true)
				var ul = document.getElementById("content");
				ul.appendChild(node);
			}
			
		}
		
		function remove_content(){
			var parent = document.getElementById("content");
		    var child = document.getElementById("content1");
		    parent.removeChild(child);
		}
		
		function add_chapter(){
			
			var qt = document.getElementById("quantity3");
			for (i = 1; i < qt.value; i++){	
				var node = document.getElementById("chapter1").cloneNode(true)
				var ul = document.getElementById("chapter");
				ul.appendChild(node);
			}
		}
		
		function remove_chapter(){
			var parent = document.getElementById("chapter");
		    var child = document.getElementById("chapter1");
		    parent.removeChild(child);
		}
	</script>

</body>
</html>