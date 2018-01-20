<template>
  <base-layout>
    <line-chart v-if="hasChartData" :chartData="chartData" />
    <chart-title v-if="hasChartData" :chartTitle="chartTitle" />
    <separator />
    <repo-growth gitRepoName="vapor" />
    <repo-growth gitRepoName="perfect" />
    <repo-growth gitRepoName="kitura" />
    <repo-growth gitRepoName="zewo" />
  </base-layout>
</template>

<script>
  import BaseLayout from '../layout/Base.vue';
  import LineChart from '../Elements/LineChart.js';
  import ChartTitle from '../Elements/ChartTitle.vue';
  import Separator from '../Elements/Seperator';
  import RepoGrowth from '../Elements/RepoGrowth';
  import * as Api from "../../api/api";
  import DayContext from '../../contexts/DayContext';

  export default {
    components: { BaseLayout, LineChart, Separator, ChartTitle, RepoGrowth },

    data() {
      return {
        context: new DayContext(this.$store, 30)
      }
    },

    computed: {

      hasChartData() {
        return this.chartData !== null;
      },

      chartData() {
        return this.context.chartData();
      },

      chartTitle() {
        return this.context.chartTitle();
      }
    },

    methods: {

      fetchStarsOfRepoForPastDaysOf(number = 365) {
        const repoList = this.$store.getters.getRepoList;
        repoList.forEach(repo => Api.getStarsFromRepoForGivenDays(repo.id, number));
      }
    },

    mounted() {
      Api.getRepoList(this.fetchStarsOfRepoForPastDaysOf);
    }
  }
</script>

<style lang="less">

</style>
