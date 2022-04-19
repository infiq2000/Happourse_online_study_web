var xValues = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
var jsonString = '[{"borderColor":"#4dc9f6","tension":0.1,"data":[0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0],"label":"test34","fill":"false"},{"borderColor":"#f67019","tension":0.1,"data":[10.0,0.0,10.0,10.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0],"label":"Learn Python - Full Course for Beginners","fill":"false"},{"borderColor":"#f53794","tension":0.1,"data":[0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,20.0,0.0,0.0],"label":"SQL Tutorial - Full Database Course for Beginners","fill":"false"},{"borderColor":"#537bc4","tension":0.1,"data":[0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0],"label":"Machine Learning Course for Beginners","fill":"false"}]';
//var js2 = document.getElementById("theData").value;
var obj = JSON.parse(jsonString);
//var obj2 = JSON.parse(js2)
//alert(data)*/
console.log(obj)
//console.log(js2)
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
    datasets: obj
/*    [{ 
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
    }]*/
  },
/*  options: {
    legend: {display: false}
  }*/
});