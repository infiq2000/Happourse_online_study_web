document.getElementById("s2").onclick = function (){
			var course_id = $("body").attr("data-customvalueone");
			var chapter_id = $("body").attr("data-customvaluetwo");
			var nameContent = document.getElementById("nameContent").value;
			var url = document.getElementById("url").value;
			var  desription = document.getElementById("desription").value
			$.ajax({
				  url: "/Happourse/AddContent",
				  type: "get", //send it through get method
				  data: {
						nameContent : nameContent,
						course_id: course_id,
						chapter_id: chapter_id,
						desription : desription,
						url:url
				  },
				  success: function(data) {
					var json = JSON.parse(data);
				   	var row = document.getElementById ("video1") ; 
					row.innerHTML = json.link;
					var row2 = document.getElementById("video2");
					row2.innerHTML = json.test;
					var row3 = document.getElementById("chapter231");
					row3.innerHTML += json.show;
					var row4 = document.getElementById("content");
					row4.innerHTML = json.ip;
				  },
				  error: function(xhr) {
				    //Do Something to handle error
				  }
				});
		 console.log("check2")
		}