<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*" %>
<%@ page import="Model.Category" %>
<%@ page import="Dao.CourseUtil" %>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*" %>
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
<!-- Earning Section -->
    <div class="earning-section">
    	<div class="auto-container">
			<!-- Sec Title -->
			<div class="sec-title">
				<h4>Earnings</h4>
			</div>
			
			<!-- Earning Graph Box -->
			<div class="earning-graph-box">
				<div class="inner-graph-box">
					<div class="row clearfix">
				
						<!-- Earning Block -->
						<div class="earning-block col-lg-4 col-md-6 col-sm-12">
							<div class="inner-box">
								<div class="content">
									<div class="courses">Total Revenue<span>$${totalRevenue }</span><i>$${totalRevenueMonth } this month</i></div>
								</div>
							</div>
						</div>
						
						<!-- Earning Block -->
						<div class="earning-block col-lg-4 col-md-6 col-sm-12">
							<div class="inner-box">
								<div class="content">
									<div class="courses">Total Enrollments<span>${countCourses }</span><i>${countCoursesMonth } this month</i></div>
								</div>
							</div>
						</div>
						
					</div>
					
					<!-- Graph Box -->
					<%-- <div class="graph-box">
						<!-- Graph -->
						<canvas id="canvas" style="height: 430px; width: 100%;"></canvas>
					</div> --%>
					
					<div style="background: white;width: 999px;padding: 20px;margin: 90px 0 0 13%;border-radius: 5px;">
						<b><h4>Sale Report</h4></b>
						<canvas id="myChart" style="width: 1000px; max-width: 1000px; display: block; height: 400px;"></canvas>
					</div>
					
				</div>
			</div>
		</div>
	</div>
	<!-- End Earning Section -->
	
	<!-- Statement Section -->
    <div class="statement-section">
    	<div class="auto-container">
			<!-- Sec Title -->
			<div class="sec-title">
				<h4>Statements</h4>
			</div>
			<div class="inner-container">
				<!-- Title Box -->
				<div class="title-box">
					<div class="clearfix">
						
						<!-- Title Column -->
						<div class="title-column">
							<h6>Courses</h6>
						</div>
						
						<!-- Title Column -->
						<div class="title-column">
							<h6>Fees</h6>
						</div>
						
						<!-- Title Column -->
						<div class="title-column">
							<h6>Revenue</h6>
						</div>
						
					</div>
				</div>
				<!-- End Title Box -->
				
				<!-- Cource Statement Box -->
				<c:forEach var="tempCourses" items="${listCourses}">
					<div class="cource-statement-box">
						<div class="box-inner">
							<div class="clearfix">
							
								<!-- Cource Column -->
								<div class="cource-column">
									<div class="course-block-two">
										<div class="cource-inner-box">
											<div class="cource-image">
												<a href="#"><img src="images/resource/statement-1.jpg" alt="" /></a>
											</div>
											<h5><a href="#">${tempCourses.getName()}</a></h5>
											<div class="cource-sales">${tempCourses.getCountCourses() } Sales</div>
										</div>
									</div>
								</div>
								
								<!-- Fees Column -->
								<div class="fees-column">
									<div class="cource-fees">$${tempCourses.getPrice() * tempCourses.getCountCourses() * 5 / 100} USD</div>
								</div>
								
								<!-- Price Column -->
								<div class="price-column">
									<div class="cource-price">$${tempCourses.getPrice() * tempCourses.getCountCourses()} USD</div>
								</div>
								
							</div>
						</div>
					</div>
				</c:forEach>
				<!-- End Cource Statement Box -->
				
				<div class="total-revenue">Total Revenue = $${totalRevenue } USD</div>
				
			</div>
			
		</div>
	</div>
	<!-- End Statement Section -->
		</div>

	<!-- Main Footer -->
	<jsp:include page="footer.jsp"></jsp:include>
	
    
	<!-- Scroll Top Button -->
			<button class="scroll-top tran3s">
				<i class="fa fa-angle-up" aria-hidden="true"></i>
			</button>




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
            <span class="palate color-one active" data-theme-file="css/ins/color-themes/theme-one.css"></span>
            <span class="palate color-two" data-theme-file="css/ins/color-themes/theme-two.css"></span>
            <span class="palate color-three" data-theme-file="css/ins/color-themes/theme-three.css"></span>
            <span class="palate color-four" data-theme-file="css/ins/color-themes/theme-four.css"></span>
            <span class="palate color-five" data-theme-file="css/ins/color-themes/theme-five.css"></span>
            <span class="palate color-six" data-theme-file="css/ins/color-themes/theme-six.css"></span>
            <span class="palate color-seven" data-theme-file="css/ins/color-themes/theme-seven.css"></span>
            <span class="palate color-eight" data-theme-file="css/ins/color-themes/theme-eight.css"></span>
			<span class="palate color-nine" data-theme-file="css/ins/color-themes/theme-nine.css"></span>
			<span class="palate color-ten" data-theme-file="css/ins/color-themes/theme-ten.css"></span>
			<span class="palate color-eleven" data-theme-file="css/ins/color-themes/theme-eleven.css"></span>
			<span class="palate color-twelve" data-theme-file="css/ins/color-themes/theme-twelve.css"></span>
        </div>
    </div>

</div>

<script src="js/ins/jquery.js"></script>
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
<!-- <script src="js/ins/canvasjs.min.js"></script>
<script src="js/ins/charts-script.js"></script> -->

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script type="text/javascript" src="js/earning_chart.js"></script>

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