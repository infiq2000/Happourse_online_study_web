function showChart(lc_id, name_lec){
	$.ajax({
	  url: "/Happourse/ShowChartInContent",
	  type: "get", //send it through get method
	  data: {
	  	lc_id: lc_id,
	  	name_lec : name_lec
	  },
	  success: function(data) {
			//alert(data);
			//document.getElementById("data").value=String(data);
			let dt = document.querySelector("#data");
			dt.value = String(data);
			var row = document.getElementById ("hihe") ; 
			row.innerHTML = data;
			var xValues = [0, 1, 2, 3];
var COLORS = ['#f67019',];
var row = $("#data").val();
var s1= JSON.parse(row);
new Chart("myChart", {
	  type: "line",
	  data: {
	    labels: xValues,
	    datasets: s1 /*[{ 
			label: 'Content 1',
	      	data: [1,0,1,1],
	      	borderColor: COLORS[0],
	      	fill: false,
	      	tension: 0.1
	    },] */
	  },
	  /*options: {
	    legend: {display: false}
	  }*/
	});
	console.log("check7")
	  },
	  error: function(xhr) {
	    //Do Something to handle error
	  }
	});

}