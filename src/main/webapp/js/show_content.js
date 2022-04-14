function showContent(lc_id, chapter_id, name){
	//var course_id = $("body").attr("data-customvalueone");
	$.ajax({
	  url: "/Happourse/ShowContentToUpdate",
	  type: "get", //send it through get method
	  data: {
			lc_id: lc_id,
			chapter_id : chapter_id,
			name : name
	  },
	  success: function(data) {
			var row = document.getElementById ("show1") ; 
					row.innerHTML = data;
	  },
	  error: function(xhr) {
	    //Do Something to handle error
	  }
	});
	console.log("check3")
}

