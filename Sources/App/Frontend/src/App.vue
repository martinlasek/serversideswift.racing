<template>
  <div id="app">
    <router-view></router-view>
  </div>
</template>

<script>
  require('./assets/styles/template/css/app.css');
  require('./assets/styles/template/vendor/bootstrap/dist/css/bootstrap.min.css');

  export default {
    name: 'app'
  }
</script>

<style lang="less">
  @import "assets/styles/min/base.less";
</style>
