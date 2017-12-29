import { Line } from 'vue-chartjs'

export default {
  extends: Line,

  mounted() {

    this.renderChart({
      labels: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30'],
      datasets: [
        {
          label: 'Vapor',
          borderColor: '#8a60c9',
          backgroundColor: '#ffffff00',
          pointBackgroundColor: '#8a60c9',
          pointBorderColor: '#ffffff00',
          pointHoverBackgroundColor: '#ffffff',
          data: [20, 29, 23, 34, 35, 42, 55, 20, 29, 23, 34, 20, 29, 23, 34, 35, 42, 55, 35, 42, 55, 20, 29, 23, 34, 35, 42, 55, 60, 70]
        },
        {
          label: 'Perfect',
          borderColor: '#dda25d',
          backgroundColor: '#ffffff00',
          data: [60, 55, 32, 10, 2, 12, 53]
        },
        {
          label: 'Kitura',
          borderColor: '#1ba8dd',
          backgroundColor: '#ffffff00',
          data: [23, 27, 32, 41, 49, 57, 77 ]
        },
        {
          label: 'Zewo',
          borderColor: '#e64759',
          backgroundColor: '#ffffff00',
          data: [10, 20, 15, 30, 25, 40, 350]
        }
      ]
    }, {responsive: true, maintainAspectRatio: false, legend: false})
  }
}
