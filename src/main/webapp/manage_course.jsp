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
<!-- Manage Cource Section -->
    <div class="manage-cource-section">
    	<div class="auto-container">
			<!-- Sec Title -->
			<div class="sec-title">
				<div class="clearfix">
					<div class="pull-left">
						<h4>Manage Courses</h4>
					</div>
					<div class="pull-right">
						<a href="add_course.jsp" class="see-all">Add New Course</a>
					</div>
				</div>
			</div>
			<div class="inner-container">
				<div class="container-content">
					<!-- Title Box -->
					<div class="title-box clearfix">
						<!-- Title Column -->
						<div class="title-column" style="width:600px;">
							<h6 >Title</h6>
						</div>
						<!-- Title Column -->
						<div class="title-column" style="width:130px;">
							<h6 >Publish Date</h6>
						</div>
						<!-- Title Column -->
						<div class="title-column" style="width:150px;">
							<a href="SortCourseBySalesNumber?desc=${desc}"><h6 >Sales</h6></a>
						</div>
						<!-- Title Column -->
						<div class="title-column" style="width:200px;">
							<h6>Category</h6>
						</div>
						<!-- Title Column -->
						<div class="title-column" style="width:180px;">
							<h6>Action</h6>
						</div>
						<!-- Title Column -->
						<div class="title-column" style="width:70px;">
							<h6>Mood</h6>
						</div>
					</div>
					<table class="table">
					  <thead>
					  </thead>
					  <tbody>
					  	<c:forEach var="tempCourses" items="${listCourses}">
							<tr>
							  <td class="title" scope="col"><a href="ManageChapters?course_id=${tempCourses.getCourses_id()}">${tempCourses.getName()}</a></td>
							  <td class="post-date" scope="col" style="text-align:center;">${tempCourses.getPublishDate() }</td>
							  <td class="sales" scope="col" style="text-align:center;">${tempCourses.getCountCourses()} Sales</td>
							  <td class="category" scope="col" style="text-align:center;">${tempCourses.getCategory()}</td>
							  <td class="actions" scope="col" style="text-align:center;">
							  	<a href="DeleteCourse?course_id=${tempCourses.getCourses_id()}" onclick="if (!(confirm('Ban muon xoa khoa hoc?'))) return false"><i class='fa fa-trash-o'></i></a>
							  	<a href="EditCourse?courseID=${tempCourses.getCourses_id()}"><i class='fa fa-edit'></i></a>
							  	<a href="#"><i class='fa fa-check-square'></i></a>
							  </td>
							  <td style="text-align:center; color:${tempCourses.getColor()}">${tempCourses.getMood()}</td>
							</tr>
						</c:forEach>
					  </tbody>
					</table>
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
	<!-- End Manage Cource Section -->
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