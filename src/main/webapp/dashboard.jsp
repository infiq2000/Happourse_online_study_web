<%@page import="Controller.DashBoard"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*" %>
<%@ page import="Model.Courses" %>
<%@ page import="Model.ManagedCourses" %>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*" %>
<%@ page import="Dao.CourseUtil" %>
<%@ page import="Model.Chapter" %>
<%@ page import="Model.*" %>
<%@ page import="Dao.LectureUtil" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="org.json.simple.JSONArray" %>
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
							<%
							String[] COLORS = {"#4dc9f6","#f67019","#f53794","#537bc4",
							  		"#acc236",
							  		"#166a8f",
							  		"#00a950",
							  		"#58595b",
							  		"#8549ba"
							};
								JSONArray json = new JSONArray();
							    JSONArray rev;
								List<ChartInfo> chart = (List<ChartInfo>)request.getAttribute("revenue");
								List<Courses> ls = (List<Courses>)request.getAttribute("listCourses");
								for(int i=0 ; i < ls.size();i++){
									JSONObject tmp = new JSONObject();
									double[] mon = new double[12];
									rev = new JSONArray();
									for(ChartInfo ci : chart){
										if (ci.getCourse_id()==ls.get(i).getCourses_id()){
											mon[ci.getMonth()-1] = ci.getRevenue();
										}
										
									}
									for(int j=0;j<12;j++){
										rev.add(mon[j]);
									}
									tmp.put("label",ls.get(i).getName());
									tmp.put("data", rev);
									tmp.put("borderColor",COLORS[i]);
									tmp.put("fill", "false");
									tmp.put("tension",0.1);
									json.add(tmp);
								}
								String rs = json.toString();
								request.setAttribute("jsonString", json.toString());
							%>

<body  data-customvalueone="${jsonString}" class="">


 	
    <!-- Preloader -->
    <div class="preloader"></div>
 	
    <!-- Main Header-->
	<jsp:include page="Header.jsp"></jsp:include>
    <!--End Main Header -->
    
    
    
	
<div class="page-wrapper">

	<!-- Dashboard Section -->
    <div class="dashboard-section">
    	<div class="auto-container">
    		
			<!-- Sec Title -->
			<div class="sec-title">
				<div class="clearfix">
					<div class="pull-left">
						<h4>Instructor Dashboard</h4>
					</div>
					<div class="pull-right">
						<a href="add_course.jsp" class="see-all">Create New Course</a>
					</div>
				</div>
			</div>
			
			<div class="row clearfix">
				
				<!-- Dashboard Block -->
				<div class="dashboard-block col-lg-3 col-md-6 col-sm-12">
					<div class="inner-box">
						<div class="content">
							<!--  <div class="icon-box">
								<span class="icon flaticon-article"></span>
							</div>-->
							<div class="courses">Total Courses<span>${total_courses}</span></div>
						</div>
					</div>
				</div>
				
				<!-- Dashboard Block -->
				<div class="dashboard-block col-lg-3 col-md-6 col-sm-12">
					<div class="inner-box">
						<div class="content">
							<!--<div class="icon-box">
								<span class="icon flaticon-coding"></span>
							</div>-->
							<div class="courses">Total Students<span>${total_students}</span></div>
						</div>
					</div>
				</div>
				
				<!-- Dashboard Block -->
				<div class="dashboard-block col-lg-3 col-md-6 col-sm-12">
					<div class="inner-box">
						<div class="content">
							<!--<div class="icon-box">
								<span class="icon flaticon-dollar-sign"></span>
							</div>-->
							<div class="courses">Total Sales<span>$${total_sales}</span></div>
						</div>
					</div>
				</div>
				
				<!-- Dashboard Block -->
				<div class="dashboard-block col-lg-3 col-md-6 col-sm-12">
					<div class="inner-box">
						<div class="content">
							<!--<div class="icon-box">
								<span class="icon flaticon-scholarship"></span>
							</div>-->
							<div class="courses">Account Balance<span>$${balance}</span></div>
						</div>
					</div>
				</div>
				
			</div>
			
			<!-- Dashboard Graph Section -->

				<div class="dashboard-graph-section">
					<!-- Sec Title -->
					<div class="sec-title">
						<div class="clearfix">
							<div class="pull-left">
								<h4>Sale Course Performance</h4>
							</div>
							<div class="pull-right">
								<a href="Earnings" class="see-all">View Earnings</a>
							</div>

							<input id="theData" type="hidden" value="${jsonString }" >
							<div style="background: white;width: 999px;padding: 20px;margin: 90px 0 0 13%;border-radius: 5px;">
								<canvas id="myChart" style="width: 1000px; max-width: 1000px; display: block; height: 400px;"></canvas>
							</div>
						</div>
					</div>
					<!-- Graph Box -->
					<%-- <div class="graph-box">
						<!-- Graph -->
						<canvas id="canvas" style="height: 430px; width: 100%;"></canvas>
					</div> --%>
					
				</div>
				
				<!-- End Dashboard Graph Section -->

			
			<!-- Sec Title -->
			<div class="sec-title">
				<h4>My Courses</h4>
			</div>
			
			<div class="single-item-carousel owl-carousel owl-theme">
			<%
				List<Courses> listCourses = (List<Courses>)request.getAttribute("listCourses");
				int page_number = (int)listCourses.size()/4;
				if (listCourses.size()%4 != 0){
					page_number += 1;
				}
			%>
				<c:forEach begin = "1" end = "<%=page_number %>" var="i">
					<div class="slide">
						<div class="row clearfix">
						 <%
						 	int i = (int)pageContext.getAttribute("i");
						 	int start = 4*(i-1);
						 	int end = 4*i-1;
						 %>
							<c:forEach begin = "<%=start%>" end = "<%=end%>" var="y">
								<%
								int y = (int)pageContext.getAttribute("y");
								Courses temp = null;
								if (y < listCourses.size()){
									temp = listCourses.get(y);
								}
								
								%>
						<% if (temp != null) { %>
				         <div class="course-block col-lg-3 col-md-6 col-sm-12">
								<div class="inner-box">
									<div class="image">
										<a href="#"><img src="images/resource/course-10.jpg" alt="" /></a>
										<div class="time">03 hours</div>
									</div>								
									<div class="lower-content">
										<h6><a href="ManageChapters?course_id=<%=temp.getCourses_id() %>"><%=temp.getName()%></a></h6>
										<ul class="post-meta">
											<li><%=temp.getCategory_name()%></li>
										</ul>
										<div class="clearfix">
											<div class="pull-left">
												<div class="author">By: <span><%=temp.getIns_name()%> </span></div>
											</div>
											<div class="pull-right">
												<div class="price"><%=temp.getPrice()%></div>
											</div>
										</div>
									</div>

								</div>
							</div>
				      <% } else { %>
				         
				      <% } %>
							</c:forEach>		
						</div>
					</div>
				</c:forEach>

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

<!-- Chart -->
<!-- <script src="js/ins/canvasjs.min.js"></script>
<script src="js/ins/charts-script.js"></script> -->

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<!-- <script type="text/javascript" src="js/dashboard_chart.js"></script> -->

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
<script type="text/javascript">
var xValues = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
/* var jsonString = '[{"borderColor":"#4dc9f6","tension":0.1,"data":[0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0],"label":"test34","fill":"false"},{"borderColor":"#f67019","tension":0.1,"data":[10.0,0.0,10.0,10.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0],"label":"Learn Python - Full Course for Beginners","fill":"false"},{"borderColor":"#f53794","tension":0.1,"data":[0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,20.0,0.0,0.0],"label":"SQL Tutorial - Full Database Course for Beginners","fill":"false"},{"borderColor":"#537bc4","tension":0.1,"data":[0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0],"label":"Machine Learning Course for Beginners","fill":"false"}]';
var obj = JSON.parse(jsonString);
console.log(obj) */
var js2 = '${jsonString}'
var obj2 = JSON.parse(js2);
alert(obj2);
console.log(obj2); 
var COLORS = [
		'#4dc9f6',
		'#f67019',
		'#f53794',
		'#537bc4',
		'#acc236',
		'#166a8f',
		'#00a950',
		'#58595b',
		'#8549ba'
	];

new Chart("myChart", {
  type: "line",
  data: {
    labels: xValues,
    datasets: obj2
/*    [{ 
		label: 'Course 1',
      	data: [860,1140,1060,1060,1070,1110,1330,1110,130,18],
		borderColor: COLORS[0],
      	fill: false,
      	tension: 0.1
    }, 
    { 
		label: 'Course 2',
      	data: [1100,1100,1700,1100,1000,1100,1000,100,1000,10],
		borderColor: COLORS[1],
      	fill: false,
      	tension: 0.1
    }, 
    { 
		label: 'Course 3',
      	data: [300,700,1000,1000,1000,1000,1000,1000,200,100],
    	borderColor: COLORS[2],
      	fill: false,
      	tension: 0.1
    }]*/
  },
/*  options: {
    legend: {display: false}
  }*/
});
</script>
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