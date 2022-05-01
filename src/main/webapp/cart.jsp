<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<%@ page import="Model.Courses"%>
<%@ page import="Model.ManagedCourses"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*"%>
<%@ page import="Dao.CourseUtil"%>
<%@ page import="Model.Chapter"%>
<%@ page import="Model.*"%>
<%@ page import="Dao.LectureUtil"%>

<%@ page import="org.json.simple.JSONArray"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link href="css/cart/cart.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link href="css/cart/bootstap.min.css" rel="stylesheet">
<link href="css/cart/font-awesome.min.css" rel="stylesheet">
<title>cart</title>

</head>
<body oncontextmenu='return false' class='snippet-body'>
	<div class="px-4 px-lg-0">

		<%--   <!-- For demo purpose -->
      <!-- Preloader -->
    <div class="preloader"></div>
 	
    <!-- Main Header-->
	<jsp:include page="Header.jsp"></jsp:include>
    <!--End Main Header --> --%>
		<div class="container text-white py-5 text-center">
			<h1 class="display-4">HAPPOURSE CART</h1>
		</div>
		<!-- End -->

		<div class="pb-5">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 p-5 bg-white rounded shadow-sm mb-5">

						<!-- Shopping cart table -->
						<div class="table-responsive">
							<table class="table">
								<thead>
									<tr>
										<th scope="col" class="border-0 bg-light">
											<div class="p-2 px-3 text-uppercase">Course</div>
										</th>
										<th scope="col" class="border-0 bg-light">
											<div class="py-2 text-uppercase">Price</div>
										</th>
										<th scope="col" class="border-0 bg-light">
											<div class="py-2 text-uppercase">Quantity</div>
										</th>
										<th scope="col" class="border-0 bg-light">
											<div class="py-2 text-uppercase">Remove</div>
										</th>
									</tr>
								</thead>
								<%
								HashMap<Integer, CourseCart> cart = (HashMap<Integer, CourseCart>) request.getSession(false).getAttribute("cart");
								float total = 0;
								boolean flag = cart != null ? true : false;
								/* 								if (cart != null) {
															for (Map.Entry<Integer, CourseCart> entry : cart.entrySet()) {
																total += entry.getValue().course.getPrice2();
																//System.out.println(entry.getValue().course.getName());
															}
														} */
								request.setAttribute("flag", flag);
								%>

								<tbody>
									<c:if test="${flag}">
										<%
										for (Map.Entry<Integer, CourseCart> entry : cart.entrySet()) {
											Integer key = entry.getKey();
											CourseCart courseCart = entry.getValue();
											total += courseCart.course.getPrice2();
											//System.out.println(entry.getValue().course.getName());
										%>
										<tr>

											<th scope="row" class="border-0">
												<div class="p-2">
													<img src="<%=courseCart.course.getImg_path()%>" alt=""
														width="70" class="img-fluid rounded shadow-sm">
													<div class="ml-3 d-inline-block align-middle">
														<h5 class="mb-0">
															<a href="#" class="text-dark d-inline-block align-middle">
																<%=courseCart.course.getName()%></a>
														</h5>
														<span
															class="text-muted font-weight-normal font-italic d-block">Category:
															<%=courseCart.course.getCategory_name()%></span>
													</div>
												</div>
											</th>
											<td class="border-0 align-middle"><strong>$<%=courseCart.course.getPrice2()%></strong></td>
											<td class="border-0 align-middle"><strong>1</strong></td>
											<td class="border-0 align-middle"><a
												href="/Happourse/CartController/remove?id=<%=key%>"
												class="text-dark"><i class='fa fa-trash-o'></i></a></td>
										</tr>
										<%
										}
										%>
									</c:if>
									<%
									float fee = total / 100 * 2;
									float total2 = total - fee;
									%>
									<c:if test="${!flag}">
										<div class="alert alert-primary" role="alert">no data!</div>
									</c:if>
								</tbody>

							</table>
							<a href="UserPage"
								class="btn btn-dark rounded-pill py-2 btn-block">Come back</a>
						</div>
						<!-- End -->
					</div>
				</div>

				<div class="row py-5 p-4 bg-white rounded shadow-sm">
					<div class="col-lg-6">
						<div
							class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Coupon
							code</div>
						<div class="p-4">
							<p class="font-italic mb-4">If you have a coupon code, please
								enter it in the box below</p>
							<div class="input-group mb-4 border rounded-pill p-2">
								<input type="text" placeholder="Apply coupon"
									aria-describedby="button-addon3" class="form-control border-0">
								<div class="input-group-append border-0">
									<button id="button-addon3" type="button"
										class="btn btn-dark px-4 rounded-pill">
										<i class="fa fa-gift mr-2"></i>Apply coupon
									</button>
								</div>
							</div>
						</div>
						<div
							class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Instructions
							for seller</div>
						<div class="p-4">
							<p class="font-italic mb-4">If you have some information for
								the seller you can leave them in the box below</p>
							<textarea name="" cols="30" rows="2" class="form-control"></textarea>
						</div>
					</div>
					<div class="col-lg-6">
						<div
							class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Order
							summary</div>
						<div class="p-4">
							<p class="font-italic mb-4">Shipping and additional costs are
								calculated based on values you have entered.</p>
							<ul class="list-unstyled mb-4">
								<li class="d-flex justify-content-between py-3 border-bottom"><strong
									class="text-muted">Order Subtotal </strong><strong><%=total%></strong></li>
								<li class="d-flex justify-content-between py-3 border-bottom"><strong
									class="text-muted">Fee</strong><strong><%=fee%></strong></li>
								<li class="d-flex justify-content-between py-3 border-bottom"><strong
									class="text-muted">Tax</strong><strong>$0.00</strong></li>
								<li class="d-flex justify-content-between py-3 border-bottom"><strong
									class="text-muted">Total</strong>
									<h5 class="font-weight-bold"><%=total2%></h5></li>
							</ul>
							<form action= "Authorize_payment" method = "post">
								<input name="subtotal" type="hidden" value="<%=total%>">
								<input name="fee" type="hidden" value="<%=fee%>">
								<input name="tax" type="hidden" value="0">
								<input name="total" type="hidden" value="<%=total2%>">
								<button type="submit">Procceed to checkout</button>
							</form>

						</div>
					</div>
				</div>

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
	<script type="text/javascript" src="js/slide.js"></script>
	<!-- Bootstrap Select JS -->
	<script type="text/javascript"
		src="vendor/bootstrap-select/dist/js/bootstrap-select.js"></script>

	<!-- Bootstrap JS -->
	<script type="text/javascript" src="vendor/bootstrap/bootstrap.min.js"></script>

	<!-- Vendor js _________ -->
	<!-- Camera Slider -->
	<script type='text/javascript'
		src='vendor/Camera-master/scripts/jquery.mobile.customized.min.js'></script>
	<script type='text/javascript'
		src='vendor/Camera-master/scripts/jquery.easing.1.3.js'></script>
	<script type='text/javascript'
		src='vendor/Camera-master/scripts/camera.min.js'></script>
	<!-- Mega menu  -->
	<script type="text/javascript"
		src="vendor/bootstrap-mega-menu/js/menu.js"></script>

	<!-- WOW js -->
	<script type="text/javascript" src="vendor/WOW-master/dist/wow.min.js"></script>
	<!-- owl.carousel -->
	<script type="text/javascript"
		src="vendor/owl-carousel/owl.carousel.min.js"></script>
	<!-- js count to -->
	<script type="text/javascript"
		src="vendor/Counter/jquery.counterup.min.js"></script>
	<script src="vendor/Counter/jquery.waypoints.min.js"></script>
	<!-- js ui -->
	<script src="vendor/jquery-ui/jquery-ui.min.js"></script>

	<!-- Theme js -->
	<script type="text/javascript" src="js/theme.js"></script>
</body>
</html>