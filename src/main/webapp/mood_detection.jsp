<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Mood Detection</title>
    <link rel="stylesheet" href="css/face/styles.css" />
</head>
<body>

	<input id="cam" name = "checkboxInstructor" type="checkbox" value="run" style="margin: 0 0 20px 20px; width: 18px; height: 18px;">
	<label for="cam" style="margin-bottom: 20px; font-weight: normal;">Run</label>
	<video id="video" height="500" width="700" autoplay muted></video>

    <script src="js/face/face-api.min.js"></script>
    <script src="js/face/main.js"></script>
</body>
</html>