import { Line, mixins } from 'vue-chartjs';
const { reactiveProp } = mixins;

export default {
  extends: Line,

  mixins: [reactiveProp],

  mounted() {

    // pragma mark - unsure about giving gradients since it irritates a little
/**
    const vaporGradient = this.$refs.canvas.getContext('2d').createLinearGradient(0, 0, 0, 450);
    const perfectGradient = this.$refs.canvas.getContext('2d').createLinearGradient(0, 0, 0, 450);
    const kituraGradient = this.$refs.canvas.getContext('2d').createLinearGradient(0, 0, 0, 450);
    const zewoGradient = this.$refs.canvas.getContext('2d').createLinearGradient(0, 0, 0, 450);

    vaporGradient.addColorStop(0, 'rgba(106, 111, 201, 0.5)');
    vaporGradient.addColorStop(0.5, 'rgba(106, 111, 201, 0.25)');
    vaporGradient.addColorStop(1, 'rgba(106, 111, 201, 0)');

    perfectGradient.addColorStop(0, 'rgba(221, 162, 93, 0.5)');
    perfectGradient.addColorStop(0.5, 'rgba(221, 162, 93, 0.25)');
    perfectGradient.addColorStop(1, 'rgba(221, 162, 93, 0)');

    kituraGradient.addColorStop(0, 'rgba(27, 168, 221, 0.5)');
    kituraGradient.addColorStop(0.5, 'rgba(27, 168, 221, 0.25)');
    kituraGradient.addColorStop(1, 'rgba(27, 168, 221, 0)');

    zewoGradient.addColorStop(0, 'rgba(230, 71, 89, 0.5)');
    zewoGradient.addColorStop(0.5, 'rgba(230, 71, 89, 0.25)');
    zewoGradient.addColorStop(1, 'rgba(230, 71, 89, 0)');

    this.chartData.datasets.map(data => {

      switch (data.label) {
        case frameworks.zewo.name: data.backgroundColor = zewoGradient; break;
        case frameworks.kitura.name: data.backgroundColor = kituraGradient; break;
        case frameworks.perfect.name: data.backgroundColor = perfectGradient; break;
        case frameworks.vapor.name: data.backgroundColor = vaporGradient; break;
      }
    });
**/
    const options = {
      responsive: true,
      maintainAspectRatio: false,
      legend: false,
      scales: {
        yAxes: [{
          ticks: {
            fontColor: '#828a9f'
          },
          gridLines: {
            display: true,
            color: '#828a9f',
            lineWidth: 0.1
          }
        }],
        xAxes: [{
          ticks: {
            fontColor: '#828a9f'
          },
          gridLines: {
            display: true,
            color: '#828a9f',
            lineWidth: 0.1
          }
        }]
      }
    };

    this.renderChart(this.chartData, options)
  }
}
