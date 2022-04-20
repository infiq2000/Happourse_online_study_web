function price(){
	var minPrice = document.getElementById("minPrice").value;
	var maxPrice = document.getElementById("maxPrice").value;
	$.ajax({
	  url: "/Happourse/SearchByPrice",
	  type: "get", //send it through get method
	  data: {
	  	minPrice: minPrice,
	  	maxPrice: maxPrice
	  },
	  success: function(data) {
		var row = document.getElementById ("course") ; 
		row.innerHTML = data;
	  },
	  error: function(xhr) {
	    //Do Something to handle error
	  }
	});
	console.log("check6")
}