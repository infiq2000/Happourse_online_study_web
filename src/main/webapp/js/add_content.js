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
				   	var row = document.getElementById ("msg2") ; 
					row.innerHTML  = data;
				  },
				  error: function(xhr) {
				    //Do Something to handle error
				  }
				});
		 console.log("check2")
		}