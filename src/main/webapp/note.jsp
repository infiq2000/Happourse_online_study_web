<%@page import="Dao.UserUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*" %>
<%@ page import="Model.Category" %>
<%@ page import="Dao.CourseUtil" %>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*" %>
<%@ page import="Model.*" %>
<%@ page import="Dao.UserUtil" %>
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
		UserUtil userUtil = new UserUtil(ds);
		int uid = (int)request.getSession(false).getAttribute("uid");
		
		List<Note> ls = new ArrayList<>();
		try {
			ls = userUtil.getNote(uid);
			request.setAttribute("lsNote", ls);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	%>
	<p>NOTE </p>
	<c:forEach var = "note" items="${lsNote}">
		<p> 
			${note.getTimeDate()}
			<br>
			${note.getContentN()}
			<br>
			<br>
		</p>
	</c:forEach>
</body>
</html>