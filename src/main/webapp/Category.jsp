<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*" %>
<%@ page import="Model.Category" %>
<%@ page import="Model.Hashtag" %>
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
					    	
					    	List<Hashtag> ls_hashtag = couUtil.getAllHashtags();
					    	request.setAttribute("list_hashtag", ls_hashtag);					    	
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
									<form action="CourseByHashtag" class="main-wrapper">
										<div class="tag-option">
											<h5>Tag</h5>
											<ul class="clearfix">													
												
												<select class="custom-select-box" name ="choosen" style="width: 90%;">
													 <c:forEach var="hashtag" items="${list_hashtag }">
													 	<option value = "${hashtag.getHashid()}">  ${hashtag.getHashtag_name() }</option>
													 </c:forEach>	
												</select>

											</ul>
										</div> <!-- /.tag-option -->

<!-- 										<div class="course-price-filter">
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
											</div> /price-ranger
										</div> /.course-price-filter -->

										

										<div class="button-wrapper"><input type="submit" value="Apply filters" class="p-bg-color tran3s"></div>
									</form> <!-- /.main-wrapper -->
								</div> <!-- /.course-filter -->
							</div> <!-- /.course-sidebar -->
						</div> <!-- /.col- -->

</body>
</html>