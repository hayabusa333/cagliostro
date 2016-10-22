var config = {
   type: 'bar',
   data: {
       labels: ["2010", "2011", "2012", "2013", "2014", "2015", "2016"],
       datasets: [{
           label: "JAPAN",
           backgroundColor: "#3A7AC9",
           borderColor: "rgba(2,63,138,0.8)",
           data: [5, 7, 8, 3, 1, 4, 10]
       }]
   },
   options: {
      scales: {
         yAxes: [{
            ticks: {
               beginAtZero:true,
            }
         }]
      }
   }
};

var ctx = document.getElementById("myChart").getContext("2d");
window.myLine = new Chart(ctx, config);

