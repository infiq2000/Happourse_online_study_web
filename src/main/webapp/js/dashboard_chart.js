var xValues = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];

new Chart("myChart", {
  type: "line",
  data: {
    labels: xValues,
    datasets: [{ 
      data: [860,1140,1060,1060,1070,1110,1330,1110,130,18],
      borderColor: "red",
      fill: false
    }, { 
      data: [1100,1100,1700,1100,1000,1100,1000,100,1000,10],
      borderColor: "green",
      fill: false
    }, { 
      data: [300,700,1000,1000,1000,1000,1000,1000,200,100],
      borderColor: "blue",
      fill: false
    }]
  },
  options: {
    legend: {display: false}
  }
});