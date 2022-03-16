<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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

	<!-- Edit Cource Section -->
    <div class="edit-cource-section">
    	<div class="auto-container">
			<!-- Sec Title -->
			<div class="sec-title">
				<div class="clearfix">
					<div class="pull-left">
						<h4>New Chapter</h4>
					</div>
					<!--<div class="pull-right">
						<a href="enrolled-courses.html" class="see-all">Add Your Course</a>
					</div>-->
				</div>
			</div>
			<div class="inner-container">
				<div class="row clearfix">
					
					<!-- Left Column -->
					<div class="left-column col-lg-8 col-md-12 col-sm-12">
						<div class="inner-column">
							
							<!-- Edit Course Form -->
							<div class="edit-course-form">
								<form method="post" action="index.html">
									
									<!-- Form Group -->
									<div class="form-group">
										<label>Course Title</label>
									</div>
									
									
									<!-- Form Group -->
									<div class="form-group">
										
										<!-- Accordion Box -->
										<label class="chapter">- Chapter</label>
										<ul class="option-cource-box" id="chapter">

											<!-- Chapter -->
											<li id="chapter1">																								
												<div class="form-group" style="margin-left: 40px;">
													<label style="font-size:14px;">Chapter Title</label>
													<input type="text" name="username" value="" placeholder="Chapter 1" required>

													
												</div>
												
												
												
												<!-- Content -->
												<label  style="margin: 0 0 20px 40px;">Content</label>
												<ul id="content">
													<li style="margin: 0 0 40px 40px;">
														<label class="ct1" style="margin: 0 0 20px 40px;">- Content 1</label>
														<div class="form-group" id="c1" style="margin-left:40px;">
															<label style="font-size:14px;">Content Title</label>
															<input type="text" name="username" value="" placeholder="Content 1" required>

															<label style="font-size:14px;">Content Description</label>
															<span class="support"><strong>Markdown supported:</strong>  *Italic*  l  **Bold**   l   - List Item   l   --- Horizontal Rule</span>
															<textarea class="" name="message" placeholder="Shortly describe this content"></textarea>

															<label style="font-size:14px;">Url</label>
															<input type="text" name="username" value="" placeholder="Url 1">

															<label style="font-size:14px;">Duration</label>
															
															<div style="margin: 0 0 20px 40px;">
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
																<button id="s1" style="margin-left: 40px; background: pink; " type="button" class="theme-btn btn-style-two"><span class="txt">Save</span></button>																
															</div>
														</div>
														
													</li>
													
													<li style="margin: 0 0 40px 40px;">
														<label class="ct2" style="margin: 0 0 20px 40px; display:none;">+ Content 2</label>
														<div class="form-group" id="c2" style="margin-left:40px; display:none;">
															<label style="font-size:14px;">Content Title</label>
															<input type="text" name="username" value="" placeholder="Content 2" required>

															<label style="font-size:14px;">Content Description</label>
															<span class="support"><strong>Markdown supported:</strong>  *Italic*  l  **Bold**   l   - List Item   l   --- Horizontal Rule</span>
															<textarea class="" name="message" placeholder="Shortly describe this content"></textarea>

															<label style="font-size:14px;">Url</label>
															<input type="text" name="username" value="" placeholder="Url 2">

															<label style="font-size:14px;">Duration</label>
															
															<div style="margin: 0 0 20px 40px;">
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
															
															<div class="button-box text-center" id="s2" style="margin-top: 40px;">
																<button style="margin-left: 40px; background: pink; " type="button" class="theme-btn btn-style-two"><span class="txt">Save</span></button>																
															</div>
														</div>
														
													</li>
													
													<li style="margin: 0 0 40px 40px;">
														<label class="ct3" style="margin: 0 0 20px 40px; display:none;">+ Content 3</label>
														<div class="form-group" id="c3" style="margin-left:40px; display:none;">
															<label style="font-size:14px;">Content Title</label>
															<input type="text" name="username" value="" placeholder="Content 3" required>

															<label style="font-size:14px;">Content Description</label>
															<span class="support"><strong>Markdown supported:</strong>  *Italic*  l  **Bold**   l   - List Item   l   --- Horizontal Rule</span>
															<textarea class="" name="message" placeholder="Shortly describe this content"></textarea>

															<label style="font-size:14px;">Url</label>
															<input type="text" name="username" value="" placeholder="Url 3">

															<label style="font-size:14px;">Duration</label>
															
															<div style="margin: 0 0 20px 40px;">
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
															<div class="button-box text-center" id="s3" style="margin-top: 40px;">
																<button style="margin-left: 40px; background: pink; " type="button" class="theme-btn btn-style-two"><span class="txt">Save</span></button>																
															</div>
														</div>
														
													</li>
													
													<li style="margin: 0 0 40px 40px;">
														<label class="ct4" style="margin: 0 0 20px 40px; display:none;">+ Content 4</label>
														<div class="form-group" id="c4" style="margin-left:40px; display:none;">
															<label style="font-size:14px;">Content Title</label>
															<input type="text" name="username" value="" placeholder="Content 4" required>

															<label style="font-size:14px;">Content Description</label>
															<span class="support"><strong>Markdown supported:</strong>  *Italic*  l  **Bold**   l   - List Item   l   --- Horizontal Rule</span>
															<textarea class="" name="message" placeholder="Shortly describe this content"></textarea>

															<label style="font-size:14px;">Url</label>
															<input type="text" name="username" value="" placeholder="Url 4">

															<label style="font-size:14px;">Duration</label>
															
															<div style="margin: 0 0 20px 40px;">
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
															<div class="button-box text-center" id="s4" style="margin-top: 40px;">
																<button style="margin-left: 40px; background: pink; " type="button" class="theme-btn btn-style-two"><span class="txt">Save</span></button>																
															</div>
														</div>
														
													</li>
													
													<li style="margin: 0 0 40px 40px;">
														<label class="ct5" style="margin: 0 0 20px 40px; display:none;">+ Content 5</label>
														<div class="form-group" id="c5" style="margin-left:40px; display:none;">
															<label style="font-size:14px;">Content Title</label>
															<input type="text" name="username" value="" placeholder="Content 5" required>

															<label style="font-size:14px;">Content Description</label>
															<span class="support"><strong>Markdown supported:</strong>  *Italic*  l  **Bold**   l   - List Item   l   --- Horizontal Rule</span>
															<textarea class="" name="message" placeholder="Shortly describe this content"></textarea>

															<label style="font-size:14px;">Url</label>
															<input type="text" name="username" value="" placeholder="Url 5">

															<label style="font-size:14px;">Duration</label>
															
															<div style="margin: 0 0 20px 40px;">
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
															<div class="button-box text-center" id="s5" style="margin-top: 40px;">
																<button style="margin-left: 40px; background: pink; " type="button" class="theme-btn btn-style-two"><span class="txt">Save</span></button>																
															</div>
														</div>
														
													</li>
													
													<li style="margin: 0 0 40px 40px;">
														<label class="ct6" style="margin: 0 0 20px 40px; display:none;">+ Content 6</label>
														<div class="form-group" id="c6" style="margin-left:40px; display:none;">
															<label style="font-size:14px;">Content Title</label>
															<input type="text" name="username" value="" placeholder="Content 6" required>

															<label style="font-size:14px;">Content Description</label>
															<span class="support"><strong>Markdown supported:</strong>  *Italic*  l  **Bold**   l   - List Item   l   --- Horizontal Rule</span>
															<textarea class="" name="message" placeholder="Shortly describe this content"></textarea>

															<label style="font-size:14px;">Url</label>
															<input type="text" name="username" value="" placeholder="Url 6">

															<label style="font-size:14px;">Duration</label>
															
															<div style="margin: 0 0 20px 40px;">
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
															<div class="button-box text-center" id="s6" style="margin-top: 40px;">
																<button style="margin-left: 40px; background: pink; " type="button" class="theme-btn btn-style-two"><span class="txt">Save</span></button>																
															</div>
														</div>
														
													</li>
													
													<li style="margin: 0 0 40px 40px;">
														<label class="ct7" style="margin: 0 0 20px 40px; display:none;">+ Content 7</label>
														<div class="form-group" id="c7" style="margin-left:40px; display:none;">
															<label style="font-size:14px;">Content Title</label>
															<input type="text" name="username" value="" placeholder="Content 7" required>

															<label style="font-size:14px;">Content Description</label>
															<span class="support"><strong>Markdown supported:</strong>  *Italic*  l  **Bold**   l   - List Item   l   --- Horizontal Rule</span>
															<textarea class="" name="message" placeholder="Shortly describe this content"></textarea>

															<label style="font-size:14px;">Url</label>
															<input type="text" name="username" value="" placeholder="Url 7">

															<label style="font-size:14px;">Duration</label>
															
															<div style="margin: 0 0 20px 40px;">
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
															<div class="button-box text-center" id="s7" style="margin-top: 40px;">
																<button style="margin-left: 40px; background: pink; " type="button" class="theme-btn btn-style-two"><span class="txt">Save</span></button>																
															</div>
														</div>
														
													</li>
													
													<li style="margin: 0 0 40px 40px;">
														<label class="ct8" style="margin: 0 0 20px 40px; display:none;">+ Content 8</label>
														<div class="form-group" id="c8" style="margin-left:40px; display:none;">
															<label style="font-size:14px;">Content Title</label>
															<input type="text" name="username" value="" placeholder="Content 8" required>

															<label style="font-size:14px;">Content Description</label>
															<span class="support"><strong>Markdown supported:</strong>  *Italic*  l  **Bold**   l   - List Item   l   --- Horizontal Rule</span>
															<textarea class="" name="message" placeholder="Shortly describe this content"></textarea>

															<label style="font-size:14px;">Url</label>
															<input type="text" name="username" value="" placeholder="Url 8">

															<label style="font-size:14px;">Duration</label>
															
															<div style="margin: 0 0 20px 40px;">
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
															<div class="button-box text-center" id="s8" style="margin-top: 40px;">
																<button style="margin-left: 40px; background: pink; " type="button" class="theme-btn btn-style-two"><span class="txt">Save</span></button>																
															</div>
														</div>
														
													</li>
													
													<li style="margin: 0 0 40px 40px;">
														<label class="ct9" style="margin: 0 0 20px 40px; display:none;">+ Content 9</label>
														<div class="form-group" id="c9" style="margin-left:40px; display:none;">
															<label style="font-size:14px;">Content Title</label>
															<input type="text" name="username" value="" placeholder="Content 9" required>

															<label style="font-size:14px;">Content Description</label>
															<span class="support"><strong>Markdown supported:</strong>  *Italic*  l  **Bold**   l   - List Item   l   --- Horizontal Rule</span>
															<textarea class="" name="message" placeholder="Shortly describe this content"></textarea>

															<label style="font-size:14px;">Url</label>
															<input type="text" name="username" value="" placeholder="Url 9">

															<label style="font-size:14px;">Duration</label>
															
															<div style="margin: 0 0 20px 40px;">
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
															<div class="button-box text-center" id="s9" style="margin-top: 40px;">
																<button style="margin-left: 40px; background: pink; " type="button" class="theme-btn btn-style-two"><span class="txt">Save</span></button>																
															</div>
														</div>
														
													</li>
													
													<li style="margin: 0 0 40px 40px;">
														<label class="ct10" style="margin: 0 0 20px 40px; display:none;">+ Content 10</label>
														<div class="form-group" id="c10" style="margin-left:40px; display:none;">
															<label style="font-size:14px;">Content Title</label>
															<input type="text" name="username" value="" placeholder="Content 10" required>

															<label style="font-size:14px;">Content Description</label>
															<span class="support"><strong>Markdown supported:</strong>  *Italic*  l  **Bold**   l   - List Item   l   --- Horizontal Rule</span>
															<textarea class="" name="message" placeholder="Shortly describe this content"></textarea>

															<label style="font-size:14px;">Url</label>
															<input type="text" name="username" value="" placeholder="Url 10">

															<label style="font-size:14px;">Duration</label>
															
															<div style="margin: 0 0 20px 40px;">
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
															<div class="button-box text-center" id="s10" style="margin-top: 40px;">
																<button style="margin-left: 40px; background: pink; " type="button" class="theme-btn btn-style-two"><span class="txt">Save</span></button>																
															</div>
														</div>
														
													</li>
												</ul>
												
											</li>
										</ul>
										
										<!-- Button Box -->
										<div class="button-box text-center" style="margin-top: 40px;">
											<a href="add_course.jsp"><button type="button" class="theme-btn btn-style-one" ><span class="txt">Save Chapter</span></button></a>
											<button style="margin-left: 40px;" type="button" class="theme-btn btn-style-two"><span class="txt">Save & Create New Chapter</span></button>
											
										</div>
									</div>
											
											
									
									
									
								</form>
							</div>
							
						</div>
					</div>
					
					<!-- Right Column -->
					<div class="right-column col-lg-4 col-md-12 col-sm-12">
						<div class="inner-column">
							
							
							<h6>Video</h6>
							
							<!-- Video Box -->
							
							
							<div class="video-boxed" style="background-image: url(images/logo/logo10.jpg); margin-top: 20px;">
								<a href="https://www.youtube.com/watch?v=-ncIVUXZla8&list=RDMM-ncIVUXZla8&start_radio=1&ab_channel=AviciiOfficialVEVO" class="lightbox-image intro-video-box"><span class="fa fa-play"><i class="ripple"></i></span></a>
							</div>
							<!-- End Video Box -->
							
							<!-- Url Box -->
							<div class="url-boxed">
								<label>URL</label>
								
								<input type="text" name="username" value="" placeholder="https://www.youtube.com/Hapourse.com" required>
								<span class="valid">Enter valid url address</span>
							</div>
							<!-- End Url Box -->
							
							
							
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
		
		
	</script>

</body>
</html>