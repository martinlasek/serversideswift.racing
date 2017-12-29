<template>
  <base-layout>
    <template slot="content">
      serversideswift.racing
      <line-chart />
    </template>
  </base-layout>
</template>

<script>
  import BaseLayout from '../layout/Base.vue'
  import LineChart from '../Elements/LineChart.js'

  export default {
    components: { BaseLayout, LineChart }
  }
</script>

<style>

</style>
