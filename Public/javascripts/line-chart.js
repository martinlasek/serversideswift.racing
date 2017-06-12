var vapor = document.getElementById('vapor');
var vaporStarsString = vapor.getAttribute('data-stars');
var vaporStars = getArrayOf(vaporStarsString);
var vStarsAvg = document.querySelector('.vapor .big-number');
vStarsAvg.innerHTML = calcAvgStarGrowthOf(vaporStars);

var perfect = document.getElementById('perfect');
var perfectStarsString = perfect.getAttribute('data-stars');
var perfectStars = getArrayOf(perfectStarsString);
var pStarsAvg = document.querySelector('.perfect .big-number');
pStarsAvg.innerHTML = calcAvgStarGrowthOf(perfectStars);

var kitura = document.getElementById('kitura');
var kituraStarsString = kitura.getAttribute('data-stars');
var kituraStars = getArrayOf(kituraStarsString);
var kStarsAvg = document.querySelector('.kitura .big-number');
kStarsAvg.innerHTML = calcAvgStarGrowthOf(kituraStars);

var zewo = document.getElementById('zewo');
var zewoStarsString = zewo.getAttribute('data-stars');
var zewoStars = getArrayOf(zewoStarsString);
var zStarsAvg = document.querySelector('.zewo .big-number');
zStarsAvg.innerHTML = calcAvgStarGrowthOf(zewoStars);

var datesString = document.getElementById('dates').getAttribute('data-dates');
var dates = getArrayOf(datesString);

var vStars = createStarsAmountForDateAmount(vaporStars, dates);
var pStars = createStarsAmountForDateAmount(perfectStars, dates);
var kStars = createStarsAmountForDateAmount(kituraStars, dates);
var zStars = createStarsAmountForDateAmount(zewoStars, dates);

function calcAvgStarGrowthOf(starsArray) {

  var prevStars = 0;
  var nextStars = 0;
  var grows = [];
  var sum = 0;
  var avg = 0;

  // average of stars requires minimum 2 stars-set
  if (starsArray.length < 2) {
    return avg;
  }
console.log("array length: " + starsArray.length);
console.log("array: " + starsArray);
  for(var i = 0; i < starsArray.length; i++) {

    if (i+1 < starsArray.length) {

      grows.push(starsArray[i+1] - starsArray[i])
    }
  }
console.log("array with stars: " + grows);
  sum = grows.reduce((one, two) => one+two, 0);

  if (sum <= 0) {
    return avg;
  }

  avg = sum  / grows.length;

  return avg;
}

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
      display: false
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
