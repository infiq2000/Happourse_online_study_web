<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<header class="theme-menu-wrapper menu-style-one">
				<div class="container">
					<div class="header-wrapper clearfix">
						<!-- Logo -->
						<div class="logo float-left tran4s"><a href="UserPage"><img src="images/logo/x.png" alt="Logo"></a></div>

						<!-- ============================ Theme Menu ========================= -->
						<nav class="theme-main-menu float-right navbar" id="mega-menu-wrapper">
							<!-- Brand and toggle get grouped for better mobile display -->
						   <div class="navbar-header">
						     <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-1" aria-expanded="false">
						       <span class="sr-only">Toggle navigation</span>
						       <span class="icon-bar"></span>
						       <span class="icon-bar"></span>
						       <span class="icon-bar"></span>
						     </button>
						   </div>
						   <!-- Collect the nav links, forms, and other content for toggling -->
						   <div class="collapse navbar-collapse" id="navbar-collapse-1">
								<ul class="nav">
									
									<li class="dropdown-holder menu-list"><a href="index.jsp" class="tran3s">Home</a>
										<ul class="sub-menu">
											<li><a href="index.jsp">Home version one</a></li>
											<li><a href="index.jsp">Home version Two</a></li>
										</ul>
									</li>
									<li class="dropdown-holder menu-list"><a href="#" class="tran3s">Course</a>
										<ul class="sub-menu">
											<li><a href="course-grid.html">Course grid</a></li>
											<li><a href="course-list.html">Course List</a></li>
											<li><a href="course-details.html">Course Details</a></li>
											<li class="dropdown-holder"><a href="#">Third Level menu</a>
												<ul class="second-sub-menu">
													<li><a href="#">menu one</a></li>
													<li><a href="#">menu two</a></li>
												</ul>
											</li>
										</ul>
									</li>
									<li class="dropdown-holder menu-list"><a href="#" class="tran3s">Pages</a>
										<ul class="sub-menu width-half">
											<li><a href="about-us.html">About Us</a></li>
											<li><a href="our-teacher.html">Our teacher</a></li>
											<li><a href="teachers-profile.html">teachers profile</a></li>
											<li><a href="shop.html">Shop page</a></li>
											<li><a href="shop-details.html">Shop Details</a></li>
											<li><a href="portfolio-3-column.html">portfolio 3 column</a></li>
											<li><a href="portfolio-4-column.html">portfolio 4 column</a></li>
											<li><a href="pricing-plan.html">Pricing Plan</a></li>
											<li><a href="faq.html">Faq Page</a></li>
											<li><a href="404.html">Error Page</a></li>
											<li><a href="sign-up.html">Registration</a></li>
											<li class="dropdown-holder"><a href="#">Third Level menu</a>
												<ul class="second-sub-menu">
													<li><a href="#">menu one</a></li>
													<li><a href="#">menu two</a></li>
												</ul>
											</li>
										</ul>
									</li>
									
									<li class="dropdown-holder menu-list"><a href="#" class="tran3s">Blog</a>
										<ul class="sub-menu">
											<li><a href="blog-grid.html">Blog grid</a></li>
											<li><a href="blog-list.html">Blog List</a></li>
											<li><a href="blog-details.html">blog Details</a></li>
										</ul>
									</li>
									
									<li><a href="contact-us.html" class="tran3s">Contact Us</a></li>
									
									<li>
										<div class="search-container">
										    <form class="sbox" action="SearchCoursesByName" method="get">
												<input class="stext tran5s" type="text" name="search" placeholder="Search...">
												<button class="tran6s" type="submit"><i class="fa fa-search"></i></button>												
											</form>
										</div>
									</li>
									
									<li class="dropdown-holder menu-list"><a href="#" class="tran3s">Instuctor</a>
										<ul class="sub-menu">
											<li><a href="dashboard.jsp">Instructor Dashboard</a></li>
											<li><a href="#">Manage Courses</a></li>
											<li><a href="#">Edit Course</a></li>
											<li><a href="#">Earnings</a></li>
											<li><a href="#">Instructor Profile</a></li>
											<li><a href="#">Popular Instructors</a></li>
										</ul>
									</li>
									
									<%
										String name = (String)session.getAttribute("name");
									%>
									
									<li class="dropdown-holder menu-list" ><a class="tran3s"><span class="login">HI <%=name %></span></a> 
										<ul class="sub-menu">
											<li><a href="Profile">My Profile</a></li>
											<li><a href="UpdateTest">Update Profile</a></li>
											<li><a href="MyLearning">My Learning</a></li>
											<li><a href="Logout">Log out</a></li>
										</ul>
									</li>
								</ul>
						   </div><!-- /.navbar-collapse -->
						</nav> <!-- /.theme-main-menu -->
					</div> <!-- /.header-wrapper -->
				</div>
			</header> <!-- /.theme-menu-wrapper -->		
</body>
</html>