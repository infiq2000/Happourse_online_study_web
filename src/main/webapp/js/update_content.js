function updateContent(){
	var course_id = $("body").attr("data-customvalueone");
	var nameContent = document.getElementById("nameContent").value;
	var desription = document.getElementById("desription").value;
	var url = document.getElementById("url").value;
	$.ajax({
	  url: "/Happourse/UpdateContent",
	  type: "get", //send it through get method
	  data: {
			course_id:course_id,
			nameContent:nameContent,
			desription : desription,
			url :url
			
	  },
	  success: function(data) {
			var row = document.getElementById ("edit1") ; 
					row.innerHTML = data;
	  },
	  error: function(xhr) {
	    //Do Something to handle error
	  }
	});
	console.log("check5")
}
function addContent(){
	var course_id = $("body").attr("data-customvalueone");
	var nameContent = document.getElementById("nameContent").value;
	var desription = document.getElementById("desription").value;
	var url = document.getElementById("url").value;
	$.ajax({
	  url: "/Happourse/AddContent2",
	  type: "get", //send it through get method
	  data: {
			course_id:course_id,
			nameContent:nameContent,
			desription : desription,
			url :url
			
	  },
	  success: function(data) {
			var row = document.getElementById ("edit1") ; 
					row.innerHTML = data;
	  },
	  error: function(xhr) {
	    //Do Something to handle error
	  }
	});
	console.log("check7")
}