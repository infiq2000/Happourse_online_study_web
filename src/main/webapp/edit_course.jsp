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
<%@ page import="Model.*" %>

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

<body data-customvalueone="${course_id}" class="">

	<p>Hello ${course_id}</p>
 	
    <!-- Preloader -->
    <div class="preloader"></div>
 	
    <!-- Main Header-->
	<jsp:include page="Header.jsp"></jsp:include>
    <!--End Main Header -->
    
    
    
	
<div class="page-wrapper">

	<!-- Edit Cource Section -->
    <div class="edit-cource-section">
    	<div class="auto-container">
			<!-- Sec Title -->
			<div class="sec-title">
				<div class="clearfix">
					<div class="pull-left">
						<h4>Edit Courses</h4>
						<p>Hello ${course_id}</p>
					</div>
				</div>
			</div>
		
			<div class="inner-container">
				<div class="row clearfix">
					<form action="UpdateCourse?course_id=${course_id}" method="POST" enctype="multipart/form-data">
						<!-- Left Column -->
						<div class="left-column col-lg-8 col-md-12 col-sm-12">
							<div class="inner-column">
								<h6>Basic Information</h6>
								
								<!-- Edit Course Form -->
								<div class="edit-course-form">
									<!-- Form Group -->
									<div class="form-group">
										<label>Course Title</label>
										<input type="text" name="username" value = "${course_name}" required>
									</div>
									
									<div class="form-group">
										<label>Description</label>
										<span class="support"><strong>Markdown supported:</strong>  *Italic*  l  **Bold**   l   - List Item   l   --- Horizontal Rule</span>
										<textarea class="" name="message" placeholder = "${course_description}">${course_description}</textarea>
									</div>
								</div>
								<c:choose>
							  		<c:when test = "${updated == 1}">
							  			<p>UPDATED</p>
							  		</c:when>
							  		<c:otherwise>
							  			
							  		</c:otherwise>
							  	</c:choose>	
							</div>
						</div>
						
						<!-- Right Column -->
						<div class="right-column col-lg-4 col-md-12 col-sm-12">
							<div class="inner-column">
								<h6>Options</h6>
								<div class="option-cource-box">
									<div class="box-inner">
										<div class="form-group">
											<label>Image</label>
											<img id="an" style="width: 250px; height: 120px;border-radius:5px;" src="images/logo/logo10.jpg" alt=""/>
											<div id="displayImg" style="width: 120px; border-radius:5px;"></div>
											<input type="file" name="upload" id="upload" onchange="ImagesFileAsURL()" style="display: inline; margin-top: 15px;"/>
										</div>
										<div class="form-group">
											<label>Category</label>
											<%
												  	InitialContext ctx;
												  	DataSource ds;
												 	ctx = new InitialContext();
											    	ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Happourse");
											    	CourseUtil couUtil = new CourseUtil(ds);
											    	List<Category> cate = couUtil.getCategories();
											    	request.setAttribute("cate", cate);
											    	
												%>
		
												<label>Category</label>
												<select class="custom-select-box" name ="chon">
													 <c:forEach var="categoryName" items="${cate }">
													 	<option value = "${categoryName.getCid()}">  ${categoryName.getName() }</option>
													 </c:forEach>	
												</select>
											<!-- <select class="custom-select-box">
												<option>UI/UX</option>
												<option>Category 01</option>
												<option>Category 02</option>
											</select> -->
											<span class="select-category">Select a category</span>
										</div>
										
										<div class="form-group">
												<label style="margin-right: 20px; font-size:14px;">Price ($)</label>
												<div style=" width: 50px; display:inline;">
													<input type="text" name="price" value="${course.getPrice() }" placeholder="$ ${course.getPrice()}" required>
												</div>
										</div>
										
										<div class="form-group tags">
											<label>Tags</label>
											<a href="#">JavaScript</a>
											<a href="#">UI/ UX Design</a>
											<a href="#">Typography</a>
											<a href="#">Web Design</a>
											<a href="#">Education</a>
											<a href="#">Courses</a>
										</div>
										
									</div>
								</div>
							</div>
						</div>
						<div class="button-box text-center" style="margin-top: 40px;">
							<button type="submit" name="cmd" value = "save" class="theme-btn btn-style-one" style="margin-left: 40px;"><span class="txt">Save Course</span></button>
						</div>
					</form>
					<div class="left-column col-lg-4 col-md-12 col-sm-12">
							<div class="inner-column">
								<!-- Edit Course Form -->
								<div id="edit1" class="edit-course-form">
									<div class="form-group" style="width:680px; margin-top:0px;">
										<!-- Accordion Box -->
											<label class="chapter-s">- Chapter</label>
												<%
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
																String nameChapter = ch1.getName();
															%>
															<li class="accordion block">
																<div class="acc-btn active"><div class="icon-outer"><span class="icon icon-plus flaticon-down-arrow"></span></div><%=ch1.getName() %></div>
																<div class="acc-content current">
																	<c:forEach items="<%=list_of_content1%>" var="ct">
																		<div class="content">
																			<div class="clearfix">
																				<div class="pull-left">
																					<p onclick = "showContent('${ct.getLc_id()}','${ct.getChap_id() }','<%=nameChapter %>')" ><span class="fa fa-play"></span>${ct.getName()}</p>
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
																		String nameChapter = chapter_list.get(i).getName();
																	%>
																	<li class="accordion block">
																		<div class="acc-btn"><div class="icon-outer"><span class="icon icon-plus flaticon-down-arrow"></span></div><%=chapter_list.get(i).getName() %></div>
																		<div class="acc-content">
																			<c:forEach items="<%=list_of_content2%>" var="ct">
																				<div class="content">
																					<div class="clearfix">
																						<div class="pull-left">
																							<p onclick = "showContent('${ct.getLc_id()}', '${ct.getChap_id() }','<%=nameChapter %>')" class="lightbox-image play-icon"><span class="fa fa-play"></span>${ct.getName()}</p>
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
										</div> <!--ss  -->
									</div>
								</div>
							</div>
						</div>
					
					<div class="right-column col-lg-4 col-md-12 col-sm-12" style="margin-left:268px;">
						<div class="inner-column">
							<!-- Edit Course Form -->
							<div class="edit-course-form">
								<h6 style="margin-top: 0px;">Update</h6>
								<div id="show1" class="option-cource-box" style="width: 600px;">
									<div class="box-inner">
									
										<div class="edit_chapter">
											<div class="form-group" style="margin-left: 10px;">
												<label style="font-size:14px;">Chapter Title</label>
												<input id="nameChapter231" type="text" name="username" value="" placeholder="Chapter 1" required>
											</div>
											
											<div class="button-box text-center"  style="margin-top: 40px;">
												<button onclick="updateChapter()" id="s1" style="margin-left: 40px; background: pink; " type="button" class="theme-btn btn-style-two"><span class="txt">Save</span></button>	
												<button id="s2" style="margin-left: 40px; background: pink; " type="button" class="theme-btn btn-style-two"><span class="txt">Add</span></button>															
											</div>
										</div>
										
										<div class="edit_content" style="display:block;">
											<!-- Content -->
											<div class="form-group" id="c1" style="margin-left:10px;">
												<label style="font-size:14px;">Content Title</label>
												<input id = "nameContent" type="text" name="username" value="" placeholder="Content 1" required>

												<label style="font-size:14px; margin-top:20px;">Content Description</label>
												<span class="support"><strong>Markdown supported:</strong>  *Italic*  l  **Bold**   l   - List Item   l   --- Horizontal Rule</span>
												<textarea id = "desription" class="" name="message" placeholder="Shortly describe this content"></textarea>

												<label style="font-size:14px; margin-top:20px;">Url</label>
												<input id = "url" type="text" name="username" value="" placeholder="Url 1">

												<label style="font-size:14px; margin-top:20px;">Duration</label>
												
												<div style="margin: 0 0 10px 40px;">
													<label style="margin-right: 24px; font-size:14px;">Minute</label>
													<div style=" width: 80px; display:inline;">
														<input style="width: 80px; display:inline;" onclick="var result = document.getElementById('quantity1'); var qty = result.value; if( !isNaN(qty) &amp; qty > 1 ) result.value--;return false;" type='button' value='-' />
														<input style="width: 80px; display:inline; background: white;" id='quantity1' min='0' name='quantity' type='text' value='0' />
														<input style="width: 80px; display:inline;" onclick="var result = document.getElementById('quantity1'); var qty = result.value; if( !isNaN(qty)) result.value++;return false;" type='button' value='+' />
													</div>
												</div>
												
												<div style="margin-left: 40px;">
													<label style="margin-right: 20px; font-size:14px;">Second</label>
													<div style=" width: 80px; display:inline;">
														<input style="width: 80px; display:inline;" onclick="var result = document.getElementById('quantity2'); var qty = result.value; if( !isNaN(qty) &amp; qty > 1 ) result.value--;return false;" type='button' value='-' />
														<input style="width: 80px; display:inline; background: white;" id='quantity2' min='1' max='59' name='quantity' type='text' value='1' />
														<input style="width: 80px; display:inline;" onclick="var result = document.getElementById('quantity2'); var qty = result.value; if( !isNaN(qty)) result.value++;return false;" type='button' value='+' />
													</div>
												</div>
												
												<div class="button-box text-center"  style="margin-top: 40px;">
													<button onclick="updateContent()" id="s1" style="margin-left: 40px; background: pink; " type="button" class="theme-btn btn-style-two"><span class="txt">Save</span></button>																
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
	</div>
	<!-- End Manage Cource Section -->	
</div>

	<!-- Main Footer -->
	<jsp:include page="footer.jsp"></jsp:include>
	
    
	<!-- Scroll Top Button -->
			<button class="scroll-top tran3s">
				<i class="fa fa-angle-up" aria-hidden="true"></i>
			</button>






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

		<script type="text/javascript" src="js/edit_course.js"></script>

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
		<script type="text/javascript" src="js/show_content.js"></script>
		<script type="text/javascript" src="js/update_chapter.js"></script>
		<script type="text/javascript" src="js/update_content.js"></script>
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