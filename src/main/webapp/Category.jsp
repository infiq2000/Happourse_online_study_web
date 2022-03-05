<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*" %>
<%@ page import="Model.Category" %>
<%@ page import="Dao.CourseUtil" %>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
						<%
						  	InitialContext ctx;
						  	DataSource ds;
						 	ctx = new InitialContext();
					    	ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Happourse");
					    	CourseUtil couUtil = new CourseUtil(ds);
					    	List<Category> cate = couUtil.getCategories();
					    	request.setAttribute("cate", cate);
					    	
						%>
						<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
							<div class="course-sidebar">
								<div class="sidebar-categories">
									<h4>Categories</h4>
									<div class="panel-group theme-accordion" id="accordion">
									  <c:forEach var="categoryName" items="${cate }">
										  <div class="panel">
										    <div class="panel-heading active-panel">
										      <h6 class="panel-title">
										      	<c:url var="CateLink" value="CourseByCategory">
													<c:param name="cid" value="${categoryName.getCid()}"></c:param>
													<c:param name="uid" value="${user_info.getUid()}"></c:param>
													<c:param name="aid" value="${user_info.getAid()}"></c:param>
	  											</c:url>
										        <a data-toggle="collapse" data-parent="#accordion" href="${CateLink}">
										        ${categoryName.getName() }</a>
										      </h6>										      
										    </div>
										    <div id="collapse1" class="panel-collapse collapse in">
										      <div class="panel-body">
										      	<!-- <ul>
										      		<li><a href="#" class="tran3s">Html/Css</a></li>
										      		<li><a href="#" class="tran3s">jQuery</a></li>
										      		<li><a href="#" class="tran3s">Sass/less</a></li>
										      	</ul> -->
										      </div>
										    </div>
										  </div> 
									  </c:forEach>	
									</div> <!-- end #accordion -->
								</div> <!-- /.sidebar-categories -->
			
								<!-- "Filter" -->
			
								<div class="course-filter">
									<h4>Search By Filters</h4>
									<form action="" class="main-wrapper">
										<div class="tag-option">
											<h5>Tag</h5>
											<ul class="clearfix">
												<li>
													<input type="checkbox" id="book" checked>
													<label for="book">Book</label>
												</li>
												<li>
													<input type="checkbox" id="linux">
													<label for="linux">Linux</label>
												</li>
												<li>
													<input type="checkbox" id="design" checked>
													<label for="design">Design</label>
												</li>
												<li>
													<input type="checkbox" id="development" checked>
													<label for="development">Development</label>
												</li>
												<li>
													<input type="checkbox" id="art" checked>
													<label for="art">Art</label>
												</li>
												<li>
													<input type="checkbox" id="web">
													<label for="web">Design</label>
												</li>
												<li>
													<input type="checkbox" id="software">
													<label for="software">Softwear</label>
												</li>
												<li>
													<input type="checkbox" id="php" checked>
													<label for="php">PHP</label>
												</li>
											</ul>
										</div> <!-- /.tag-option -->

										<div class="course-price-filter">
											<h5>Price Range</h5>
											<div class="price-ranger">
												<div class="ranger-min-max-block">
													<ul class="clearfix">
														<li class="float-left">
															<label for="min">From</label>
															<input type="text" class="min" readonly>
														</li>
														<li class="float-left">
															<label for="max">To</label>
															<input type="text" class="max" readonly>
														</li>
													</ul>
												</div>
												<div id="slider-range"></div>
											</div> <!-- /price-ranger -->
										</div> <!-- /.course-price-filter -->

										<div class="course-work-level">
											<h5>Work level</h5>
											<ul class="clearfix">
												<li>
													<input type="checkbox" id="starting">
													<label for="starting">Starting</label>
												</li>
												<li>
													<input type="checkbox" id="begainer">
													<label for="begainer">Begainer</label>
												</li>
												<li>
													<input type="checkbox" id="expert" checked>
													<label for="expert">Expert</label>
												</li>
												<li>
													<input type="checkbox" id="intermediate">
													<label for="intermediate">Intermediate</label>
												</li>
												<li>
													<input type="checkbox" id="advance">
													<label for="advance">Advance</label>
												</li>
											</ul>
										</div> <!-- /.course-work-level -->

										<div class="course-location">
											<h5>Location</h5>
											<div class="form-group">
										      <div>
										        <select id="loaction" class="selectpicker show-tick form-control" data-live-search="true">
										          <option>Dhaka</option>
										          <option>Bab Ezzouar</option>
										          <option>Baguio</option>
										          <option>London</option>
										          <option>Paris</option>
										          <option>Dubai</option>
										          <option>New York</option>
										          <option>Singapore</option>
										          <option>Kuala Lumpur</option>
										          <option>Istanbul</option>
										          <option>Tokyo</option>
										          <option>Seoul</option>
										          <option>Amsterdam</option>
										          <option>Osaka</option>
										          <option>Vienna</option>
										        </select>
										      </div>
										    </div>
										</div> <!-- /.course-location -->

										<div class="button-wrapper"><input type="submit" value="Apply filters" class="p-bg-color tran3s"></div>
									</form> <!-- /.main-wrapper -->
								</div> <!-- /.course-filter -->
							</div> <!-- /.course-sidebar -->
						</div> <!-- /.col- -->

</body>
</html>