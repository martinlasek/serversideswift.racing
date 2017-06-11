var vapor = document.getElementById('vapor');
var vaporStarsString = vapor.getAttribute('data-stars');
var vaporStars = getArrayOf(vaporStarsString);

var perfect = document.getElementById('perfect');
var perfectStarsString = perfect.getAttribute('data-stars');
var perfectStars = getArrayOf(perfectStarsString);

var kitura = document.getElementById('kitura');
var kituraStarsString = kitura.getAttribute('data-stars');
var kituraStars = getArrayOf(kituraStarsString);

var zewo = document.getElementById('zewo');
var zewoStarsString = zewo.getAttribute('data-stars');
var zewoStars = getArrayOf(zewoStarsString);

var datesString = document.getElementById('dates').getAttribute('data-dates');
var dates = getArrayOf(datesString);

var vStars = createStarsAmountForDateAmount(vaporStars, dates);
var pStars = createStarsAmountForDateAmount(perfectStars, dates);
var kStars = createStarsAmountForDateAmount(kituraStars, dates);
var zStars = createStarsAmountForDateAmount(zewoStars, dates);

function createStarsAmountForDateAmount(stars, dates) {

  if (dates.length > stars.length) {

    var fillerStars = stars[0];
    var tmpStars = [];

    dates.forEach(function() {
      tmpStars.push(fillerStars);
    });

    var amountToRemove = dates.length - stars.length;
    tmpStars = tmpStars.slice(0, amountToRemove);

    return tmpStars.concat(stars);
  }

  return stars;
}

// creates array like [1, 2, 3] from string looking like "[1, 2, 3,]"
function getArrayOf(starsString) {
  var array = starsString.split(',').filter(s => s != '');
  return array;
}

var ctx = document.getElementById("myChart");
var myLineChart = new Chart(ctx, {
  type: 'line',
  data: {
    labels: dates,
    datasets: [
      {
        label: 'vapor',
        data: vStars,
        borderColor: '#92a8d1',
        fill: false
      },
      {
        label: 'perfect',
        data: pStars,
        borderColor: '#f78d28',
        fill: false
      },
      {
        label: 'kitura',
        data: kStars,
        borderColor: '#00bbe6',
        fill: false
      },
      {
        label: 'zewo',
        data: zStars,
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
