var title = document.querySelectorAll('#title');
var duration = document.querySelectorAll('#duration');
var chart = document.getElementById('chart');

for(var i=0; i<title.length; i++){
    title[i].addEventListener("click", function(){
	
		console.log(duration[0].innerHTML)	
		if (chart.style.display == 'none'){
			chart.style.display = 'block';
		}else{
			chart.style.display = 'none'
		}
	});
}


var xValues = [0, 1, 2, 3];

var COLORS = ['#f67019',];

new Chart("myChart", {
  type: "line",
  data: {
    labels: xValues,
    datasets: [{ 
		label: 'Content 1',
      	data: [1,0,1,1],
      	borderColor: COLORS[0],
      	fill: false,
      	tension: 0.1
    },]
  },
  /*options: {
    legend: {display: false}
  }*/
});