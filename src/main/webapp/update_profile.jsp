<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="CSS2/style.css">
<link type="text/css" rel="stylesheet" href="CSS2/add-student-style.css">
</head>
<body>
	<div id="wrapper">
		<div id="header">
			<h2>Happourse</h2>
		</div>
	</div>
	<div id="container">
		<h3>Update Profile </h3>
		<form action="UpdateInfo" method="get">
			<input type="hidden" name="uid" value="${uid}"/>
			<input type="hidden" name="aid" value="${aid}"/>
			<table>
				<tbody>
					<tr>
						<td><label>Full Name</label></td>
						<td><input type ="text" name="FirstName"/></td>
					</tr>
					<tr>
						<td><label>Major</label></td>
						<td><input type ="text" name="LastName"/></td>
					</tr>
					<tr>
						<td><label>Email</label></td>
						<td><input type ="text" name="Email"/></td>
					</tr>
					<tr>
						<td><label></label></td>
						<td><input type ="submit" value="Save" class="save"/></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>