var xValues = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];

var COLORS = [
		'#4dc9f6',
		'#f67019',
		'#f53794',
		'#537bc4',
		'#acc236',
		'#166a8f',
		'#00a950',
		'#58595b',
		'#8549ba'
	];

new Chart("myChart", {
  type: "line",
  data: {
    labels: xValues,
    datasets: [{ 
		label: 'Course 1',
      	data: [860,1140,1060,1060,1070,1110,1330,1110,130,18],
      	borderColor: COLORS[0],
      	fill: false,
      	tension: 0.1
    }, 
    { 
		label: 'Course 2',
      	data: [1100,1100,1700,1100,1000,1100,1000,100,1000,10],
      	borderColor: COLORS[1],
      	fill: false,
      	tension: 0.1
    }, 
    { 
		label: 'Course 3',
      	data: [300,700,1000,1000,1000,1000,1000,1000,200,100],
      	borderColor: COLORS[2],
      	fill: false,
      	tension: 0.1
    }]
  },
  /*options: {
    legend: {display: false}
  }*/
});