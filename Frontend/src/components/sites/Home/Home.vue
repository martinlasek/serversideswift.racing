<template>
  <base-layout>
    <line-chart v-if="hasChartData" :chartData="chartData"/>
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

  export default {
    components: { BaseLayout, LineChart, Separator },

    computed: {

      hasChartData() {

        return this.chartData !== null;
      },

      chartData() {

        const list = LineChartHelper.dayContext();

        if (list.length === 0) {

          return null;
        }
        console.log(list);
        const structuredDataList = list.map(fw => {

          const e = {
            label: fw.name,
            data: fw.processedStars.map(d => d.amount)
          };

          return {...e, ...frameworks[fw.name].lineChartStyle}
        });

        const sortedList = LineChartHelper.sortDescOnDataSum(structuredDataList);

        return {
          labels: list[0].processedStars.map(el => el.created_at.split('-')[0]),
          datasets: sortedList
        };
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
