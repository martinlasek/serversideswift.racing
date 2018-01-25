<template>
  <base-layout>
    <div class="imprint">
      <page-header title="Imprint"/>
      <div class="card">
        <h3> developed by </h3>
        <h2> Martin J. Lasek </h2>
        <p> iOS/Web Fullstack Developer </p>
        <p>
          <a href="mailto:kontakt@martinlasek.de">
            kontakt@martinlasek.de
          </a>
        </p>
        <p class="social">
          <a href="https://github.com/MartinLasek" target="_blank">Github</a> /
          <a href="https://twitter.com/martinlasek" target="_blank">Twitter</a> /
          <a href="https://www.instagram.com/martin_lasek/" target="_blank">Instagram</a>
        </p>
      </div>
    </div>
  </base-layout>
</template>

<script>
  import BaseLayout from '../layout/Base';
  import PageHeader from '../Elements/PageHeader';

  export default {
    components: {PageHeader, BaseLayout}
  }
</script>

<style lang="less">
  @import "../../assets/styles/min/Imprint";
</style>
