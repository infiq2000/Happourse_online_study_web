function updateChapter(){
	var course_id = $("body").attr("data-customvalueone");
	var tmp = document.getElementById("nameChapter231").value;
	$.ajax({
	  url: "/Happourse/UpdateChapter",
	  type: "get", //send it through get method
	  data: {
			name:tmp,
			course_id:course_id
	  },
	  success: function(data) {
			var row = document.getElementById ("edit1") ; 
					row.innerHTML = data;
	  },
	  error: function(xhr) {
	    //Do Something to handle error
	  }
	});
	console.log("check4")
}