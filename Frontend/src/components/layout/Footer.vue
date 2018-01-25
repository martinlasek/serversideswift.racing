<template>
  <footer>
    <div class="container">
      <div class="left">
        <a href="https://github.com/vapor/vapor" target="_blank">Built with Vapor</a>
      </div>
      <div class="middle">
        <router-link :to="{ name: 'versions'}">Versions</router-link>
      </div>
      <div class="right">
        <router-link :to="{ name: 'imprint'}">Imprint</router-link>
      </div>
    </div>
  </footer>
</template>

<style lang="less">
  @import "../../assets/styles/min/Footer.less";
</style>
