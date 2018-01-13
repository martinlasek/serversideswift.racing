<template>
  <base-layout>
    <line-chart v-if="hasChartData" :chartData="chartData" />
    <separator />
  </base-layout>
</template>

<script>
  import BaseLayout from '../../layout/Base.vue'
  import LineChart from '../../Elements/LineChart.js'
  import Separator from '../../Elements/Seperator'
  import {frameworks} from "../../../utils/constants";
  import * as Api from "../../../api/api";
  import LineChartHelper from "../../../utils/LineChartHelper";
  import Helper from "../../../utils/Helper";
  import DayContext from '../../../contexts/DayContext';

  export default {
    components: { BaseLayout, LineChart, Separator },

    computed: {

      hasChartData() {
        return this.chartData !== null;
      },

      chartData() {

        const ctxt = new DayContext(this.$store, 30);
        return ctxt.chartData();
      }
    },

    methods: {

      fetchStarsFromRepoForLast30Days() {

        const gitRepoList = this.$store.getters.getGitRepoList;

        this.$store.dispatch('clearStarsDataForRepo');

        gitRepoList.forEach(repo => {
          Api.getStarsFromRepoForGivenDays(repo.id, 365);
        });
      }
    },

    mounted() {

      Api.getAllGitRepos(this.fetchStarsFromRepoForLast30Days);
    }
  }
</script>

<style>

</style>
