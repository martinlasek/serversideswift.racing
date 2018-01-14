<template>
  <h3 class="chart-title"> {{chartTitle}} </h3>
</template>

<script>
export default {

  props: {
    chartTitle: {required: true}
  }
}
</script>

<style lang="less">
  .chart-title {
    text-align: center;
  }
</style>
