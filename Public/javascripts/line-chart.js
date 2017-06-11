var ctx = document.getElementById("myChart");
var myLineChart = new Chart(ctx, {
  type: 'line',
  data: {
    labels: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12', '13', '14', '15', '16'],
    datasets: [
      {
      label: 'vapor',
      data: [12, 14, 17, 21, 23, 29, 32, 47, 61, 74, 99, 103, 111, 123, 132, 142],
      borderColor: '#92a8d1',
      fill: false
      },
      {
      label: 'perfect',
      data: [9, 17, 18, 22, 30, 32, 35, 51, 66, 72, 87, 96, 104, 110, 117, 127],
      borderColor: '#f78d28',
      fill: false
      },
      {
      label: 'kitura',
      data: [3, 11, 12, 14, 17, 18, 20, 23, 28, 32, 44, 56, 56, 56, 56, 56],
      borderColor: '#00bbe6',
      fill: false
      },
      {
      label: 'zewo',
      data: [1, 6, 7, 9, 10, 12, 14, 15, 17, 19, 23, 27, 30, 30, 30, 30, 30],
      borderColor: '#dd342b',
      fill: false
      }
    ]
  },
  options: {
    legend: {
      position: "bottom"
    },
    scales: {
      yAxes: [{
        ticks: {
          fontSize: "20"
        },
        gridLines: {
          color: '#004f77'
        }
      }],
      xAxes: [{
        ticks: {
          fontSize: "14"
        },
        gridLines: {
          color: '#004f77'
        }
      }]
    },
    maintainAspectRatio: false,
    responsive: true
  }
});
Chart.defaults.global.defaultFontColor = '#ffffff'
