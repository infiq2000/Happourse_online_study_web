var title = document.getElementsByClassName('title');
var duration = document.getElementsByClassName('duration');
var chart = document.getElementById('chart');

for(var i=0; i<title.length; i++){
	
    title[i].addEventListener("click", function(){
		console.log(title[i].innerHTML)
		if (chart.style.display == 'none'){
			chart.style.display = 'block';
		}else{
			chart.style.display = 'none'
		}
		
	});
    
}

var xValues = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

var COLORS = ['#f67019',];

new Chart("myChart", {
  type: "line",
  data: {
    labels: xValues,
    datasets: [{ 
		label: 'Content 1',
      	data: [1,1,1,1,0,1,1,1,0,0],
      	borderColor: COLORS[0],
      	fill: false,
      	tension: 0.1
    },]
  },
  /*options: {
    legend: {display: false}
  }*/
});