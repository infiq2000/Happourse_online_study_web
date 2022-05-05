<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<style>
	body {
	  display: -webkit-flex; 
	  display: flex;    
	  -webkit-justify-content: center;
	  justify-content: center;
	}
	#tar_box {
	  width: 500px;
	  height: 500px;
	  border: 1px solid red;
	}
	</style>
	
	<script type="text/javascript">
	    function uploadFile(file) {
	        var formData = new FormData();
	        formData.append("userfile", file);
	        var request = new XMLHttpRequest();
	        request.onload = function () {
	          if (request.status == 200) {
	            document.location.href='/';
	          } else {
	            alert('Error! Upload failed');
	          }
	        };
	        request.open("POST", "/compose/send");
	        request.send(formData);
	      }
	
	      $("body").bind('paste', function(je){
	        var e = je.originalEvent;
	        for (var i = 0; i < e.clipboardData.items.length; i++) {
	          var item = e.clipboardData.items[i];
	          console.log('Item: ' + item.type);
	          if (item.type.indexOf('image') != -1) {
	            //item.
	            uploadFile(item.getAsFile());
	          } else {
	            // ignore not images
	            console.log('Discarding not image paste data');
	          }
	        }
	      });
	</script>
</body>
</html>