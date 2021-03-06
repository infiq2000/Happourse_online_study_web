<%@page import="Model.Hashtag"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*" %>
<%@ page import="Model.Courses" %>
<%@ page import="Model.ManagedCourses" %>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*" %>
<%@ page import="Dao.CourseUtil" %>
<%@ page import="Model.Chapter" %>
<%@ page import="Model.Content" %>
<%@ page import="Dao.LectureUtil" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<!-- For IE -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge">

	<!-- For Resposive Device -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>Happourse - Online Study Website </title>
	
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




			<!-- 
			=============================================
				Our Instructors Profile
			============================================== 
			-->
			<!-- Instructor Page Section -->
<div class="page-wrapper" style="padding-bottom: 50px;">

	<div class="edit-course-form">
		<div class="inner-container">
			<div class="row clearfix"><!-- Left Column -->
				
	        
	        
			<!-- <img style="min-width: 120px;max-height: 200px;border-radius: 10%;margin:0 0 30px 470px;" src="images/logo/t.JPG" alt=""/>
			<input type="file" name="uploadField" style="margin: 0 0 20px 20px; display: inline;"/> -->
						<form action="UpdateTest2" method="POST" enctype="multipart/form-data" style="background: #f5e5e8;padding: 20px; border-radius: 5px;">
							<div class="left-column col-lg-4 col-md-12 col-sm-12">
								<div class="inner-column">
									<div class="form-group" style="margin-left:20%; width:500px;">
										<h2>Change Information</h2>
										<div>
											<img id="an" style="width: 120px;margin:0 0 0 20px;" src="${userInfo.getImg_path()}" alt=""/>
											<div id="displayImg" style="width: 120px;margin-bottom:30px;"></div>
											<input type="file" name="image" id="upload" onchange="ImagesFileAsURL()" style="margin-bottom:20px; display: inline; height: 55px;"/>
										</div>
										
										<div>		
											<label style="font-size:14px;">Username</label>
											<input style="margin-bottom:20px;" type="text" name="username" value="${userInfo.getUsername()}" placeholder="${userInfo.getUsername()}">
										</div>	
										
										<div>
											<label style="font-size:14px;">Full name</label>
											<input style="margin-bottom:20px;" type="text" name="fullName" value="${userInfo.getFullName()}" placeholder="${userInfo.getFullName()}A">
										</div>
										
										<div>
											<label style="font-size:14px;">Email</label>
											<input style="margin-bottom:20px;" type="email" name="email" value="${userInfo.getEmail()}" placeholder="${userInfo.getEmail()}m" >
										</div>
										
										<div>
											<label style="font-size:14px;">Major</label>
											<input style="margin-bottom:20px;" type="text" name="major" value="${userInfo.getMajor()}" placeholder="${userInfo.getMajor()}" required>
										</div>
										
										<div>
											<label style="font-size:14px;">${exper}</label>
											<input style="margin-bottom:20px;" type="text" name="experiment" value="${userInfo.getExperiment()}" placeholder="${userInfo.getExperiment()}">
										</div>
										
										<div>
											<label style="font-size:14px;">Birthday</label>
											<input style="margin-bottom:20px;" type="text" name="birth" value="${userInfo.getBirth()}" placeholder="${userInfo.getBirth()}">
										</div>
										
									</div>
								</div>
							</div>
							<div class="right-column col-lg-4 col-md-12 col-sm-12">
								<div class="inner-column">
									
									<div class="form-group" style="margin-left:65%; width:500px;">
										<div>
											<label style="font-size:14px;">Address</label>
											<input style="margin-bottom:20px;" type="text" name="address" value="${userInfo.getAddress()}" placeholder="${userInfo.getAddress()}">
										</div>
										
										<div>
											<label style="font-size:14px;">Country</label>
											<input style="margin-bottom:20px;" type="text" name="country" value="${userInfo.getCountryName()}" placeholder="${userInfo.getCountryName()}">
										</div>
										
										<%
											int account_type = (int) session.getAttribute("account_type");			
										%>
										<% if (account_type == 0) { %>
							         		<label style="font-size:14px;">Phone number</label>
											<input style="margin-bottom:20px;" type="text" name="phoneNumber" value="${userInfo.getPhoneNumber()}" placeholder="${userInfo.getPhoneNumber()}">
							      		<% } %>
										
										<label style="font-size:14px;">About Me</label>
										<span class="support"><strong style="font-size:14px;">Markdown supported</strong>  *Italic*  l  **Bold**   l   - List Item   l   --- Horizontal Rule</span>
										<textarea style="margin-bottom:20px;" class="" name="about" placeholder="Shortly describe about me">${userInfo.getDescribe()}</textarea>
									
										
									</div>
									
									<div class="option-cource-box" style="margin-left:268px; width:500px; background: #f5e5e8; padding:0px;">
										<div class="box-inner" style="width: 120%;">
											<label style="font-size:14px; font-weight: 500; font-family: 'Roboto', sans-serif;">Hashtags</label></br>
											
											<c:forEach var = "hashtag" items = "${all_hashtags }" >
												<%
													List<Hashtag> user_hashtags = (List<Hashtag>)request.getAttribute("user_hashtags");
													List<Integer> lst_id = new ArrayList<>();
													for (Hashtag tmp : user_hashtags){
														lst_id.add(tmp.getHashid());
													}
													Hashtag hashtag = (Hashtag)pageContext.getAttribute("hashtag");
													if (lst_id.contains(hashtag.getHashid())){
												%>
													<label style="font-size: 14px; font-weight: 500; font-family: 'Roboto', sans-serif; margin: 10px 20px 10px 20px;background: #ebcfdd; color:#9a9696; padding: 10px;border-radius: 5px; width:220px;" >
														
														<input type="checkbox" style="height: 20px; width: 30px;" checked>
														<%= hashtag.getHashtag_name()%>
													</label>
												<%
													} else{
												%>
													<label style="font-size: 14px;font-weight: 500; font-family: 'Roboto', sans-serif; margin: 10px 20px 10px 20px;background: #ebcfdd; color:#9a9696; padding: 10px;border-radius: 5px; width:220px;" >
														
														<input type="checkbox" style="height: 20px; width: 30px;">
														<%= hashtag.getHashtag_name()%>
													</label>
												<%} %>
											</c:forEach> 
											
											
											
											<!-- <label style = "font-size: 25px" >
												Java
												<input type="checkbox">
											</label>
											
											<label style = "font-size: 25px" >
												Java
												<input type="checkbox" checked>
											</label>
											
											<label style = "font-size: 25px" >
												Java
												<input type="checkbox">
											</label>
											
											<label style = "font-size: 25px" >
												Java
												<input type="checkbox">
											</label>
											
											<label style = "font-size: 25px" >
												Java
												<input type="checkbox">
											</label>
											
											<label style = "font-size: 25px" >
												Java
												<input type="checkbox">
											</label> -->
											
										</div>
									</div>
									
									<div class="form-group" style="margin-left:65%; width:500px;">
										<button type="submit" class="button-box text-center theme-btn btn-style-one" style="margin-top: 40px;">Save Information</button>
									</div>
								</div>
							</div>
						</form>
					
	
				<div class="right-column col-lg-4 col-md-12 col-sm-12" style="margin-top: 40px;">
					<div class="inner-column">
						<form action="ChangePassword" method="post">
							<div class="form-group" style="margin-left:20%; width:500px;">
								<h2>Change Password</h2>
								<label style="font-size:14px;">Old password</label>
								<input style="margin-bottom:20px;" type="password" name="oldPassword" value="">
								
								<label style="font-size:14px;">New password</label>
								<input style="margin-bottom:20px;" type="password" name="newPassword" value="">
								
								<label style="font-size:14px;">Repeat new password</label>
								<input style="margin-bottom:20px;" type="password" name="repeatNewPassword" value="">
								
								<button class="button-box text-center theme-btn btn-style-one" style="margin-top: 40px;">Save Password</button>
							</div>
						</form>	
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	<!-- End Instructor Page Section -->
	
	
	
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
<script src="js/ins/canvasjs.min.js"></script>
<script src="js/ins/charts-script.js"></script>

<!-- Js File_________________________________ -->

		<!-- j Query -->
		<script type="text/javascript" src="vendor/jquery.2.2.3.min.js"></script>
		<script type="text/javascript" src="js/update.js"></script>
		<script type="text/javascript" src="js/update_profile.js"></script>
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