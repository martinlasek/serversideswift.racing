<template>
  <div class="day-chart">
    <line-chart v-if="hasChartData" :chartData="chartData" />
    <chart-title v-if="hasChartData" :chartTitle="chartTitle" />
  </div>
</template>

<script>
  import LineChart from './LineChart.js';
  import ChartTitle from './ChartTitle.vue';
  import DayChartHelper from '../../contexts/DayChartHelper';
  import Helper from '../../utils/Helper';
  import DateHelper from '../../utils/DateHelper';

  export default {
    components: { LineChart, ChartTitle },

    computed: {

      hasChartData() {
        return this.chartData !== null && this.chartData.labels.length > 0;
      },

      chartData() {

        const repoList = this.$store.getters.getRepoList;

        if (repoList.length === 0) {
          return null;
        }

        if (!Helper.doesListElementsHave('stars', repoList)) {
          return null;
        }

        const timeSpan = DateHelper.getListWithPastDays(30);
        let dataSets = DayChartHelper.createDataSetForEachRepo(timeSpan, repoList);
        dataSets = Helper.sortDescOnSumOfGivenProp('data', dataSets);

        return {
          labels: dataSets[0].chartLabels,
          datasets: dataSets
        };
      },

      chartTitle() {
        const k = this.chartData.datasets[0].originData;
        const l = k.map(star => DateHelper.getMonthFromDate(star.created_at));
        const m = [...new Set(l)]; // creates an array with unique elements
        const n = m.map(monthNr => DateHelper.getMonthByNumber(monthNr)); // convert number into names
        const o = n.map(month => month.slice(0, 3) + '.'); // take first three letters
        return o.length > 1 ? o.join(' / ') : o[0]; // concatenate month names when more than one exists
      }
    },
  }
</script>
