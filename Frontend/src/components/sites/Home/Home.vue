<template>
  <base-layout>
    <line-chart v-if="hasChartData" :chartData="chartData" />
    <chart-title v-if="hasChartData" :chartTitle="chartTitle" />
    <separator />
    <git-repo-growth gitRepoName="vapor" />
    <git-repo-growth gitRepoName="perfect" />
    <git-repo-growth gitRepoName="kitura" />
    <git-repo-growth gitRepoName="zewo" />
  </base-layout>
</template>

<script>
  import BaseLayout from '../../layout/Base.vue';
  import LineChart from '../../Elements/LineChart.js';
  import ChartTitle from '../../Elements/ChartTitle.vue';
  import Separator from '../../Elements/Seperator';
  import GitRepoGrowth from '../../Elements/GitRepoGrowth';
  import {frameworks} from "../../../utils/constants";
  import * as Api from "../../../api/api";
  import LineChartHelper from "../../../utils/LineChartHelper";
  import Helper from "../../../utils/Helper";
  import DayContext from '../../../contexts/DayContext';

  export default {
    components: { BaseLayout, LineChart, Separator, ChartTitle, GitRepoGrowth },

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
        this.$store.dispatch('clearStarsDataForRepo');
        const gitRepoList = this.$store.getters.getGitRepoList;
        gitRepoList.forEach(repo => Api.getStarsFromRepoForGivenDays(repo.id, number));
      }
    },

    mounted() {
      Api.getAllGitRepos(this.fetchStarsOfRepoForPastDaysOf);
    }
  }
</script>

<style lang="less">

</style>
