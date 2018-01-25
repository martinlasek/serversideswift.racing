<template>
  <base-layout>
    <site-title title="serversideswift.racing" link="/" />
    <day-chart />
    <separator />
    <repo-growth gitRepoName="vapor" link="https://github.com/vapor/vapor" />
    <repo-growth gitRepoName="perfect" link="https://github.com/perfectlysoft/perfect" />
    <repo-growth gitRepoName="kitura" link="https://github.com/IBM-Swift/Kitura" />
    <repo-growth gitRepoName="zewo" link="https://github.com/Zewo/Zewo" />
  </base-layout>
</template>

<script>
  import BaseLayout from '../layout/Base.vue';
  import LineChart from '../Elements/LineChart.js';
  import ChartTitle from '../Elements/ChartTitle.vue';
  import Separator from '../Elements/Seperator';
  import RepoGrowth from '../Elements/RepoGrowth';
  import * as Api from '../../api/api';
  import DayChart from '../Elements/DayChart';
  import SiteTitle from '../Elements/SiteTitle';

  export default {
    components: { BaseLayout, LineChart, Separator, ChartTitle, RepoGrowth, DayChart, SiteTitle },

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
