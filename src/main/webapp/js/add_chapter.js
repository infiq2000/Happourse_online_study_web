document.getElementById("s1").onclick = function (){
			var valuePassedFromJSP = $("body").attr("data-customvalueone");
			var tmp = document.getElementById("nameChapter").value;
			$.ajax({
				  url: "/Happourse/AddChapter",
				  type: "get", //send it through get method
				  data: {
						txtName : tmp,
						course_id:valuePassedFromJSP
				  },
				  success: function(data) {
				   	var row = document.getElementById ("chapter231") ; 
					row.innerHTML = data;
				  },
				  error: function(xhr) {
				    //Do Something to handle error
				  }
				});
		 console.log("check2")
		}