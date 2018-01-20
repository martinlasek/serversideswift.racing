<template>
  <div :class="['git-repo-growth', gitRepoName]">
    <h3 v-if="hasData"> {{starsPerDay}} </h3>
    <span> {{gitRepoName}} </span>
  </div>
</template>

<script>
import Helper from "../../utils/Helper";

export default {
  props: {
    gitRepoName: {required: true}
  },

  computed: {

    hasData() {
      const gitRepoList = this.$store.getters.getRepoList;

      if (gitRepoList.length === 0) {
        return false;
      }

      const list = gitRepoList.filter(repo => repo.name === this.gitRepoName);

      if (!Helper.doesListElementsHave('stars', list)) {
        return false;
      }

      return true;
    },

    starsPerDay() {

      const gitRepoList = this.$store.getters.getRepoList;
      const list = gitRepoList.filter(repo => repo.name === this.gitRepoName);
      const starList = [];
      Object.keys(list[0].stars).forEach(key => starList.push(list[0].stars[key]));

      const growth = [];
      starList.forEach((el, index) => {

        if (starList[index+1] === undefined) {
          return;
        }

        const diff = starList[index+1].amount - el.amount;
        growth.push(diff);
      });

      const l = growth.length;
      return (growth.reduce((before, current) => before + current) / l).toFixed(2);
    }
  }
}
</script>

<style lang="less">
  @import "../../assets/styles/min/GitRepoGrowth.less";
</style>
