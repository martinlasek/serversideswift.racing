<template>
  <div class="separator">
    <h3>stars per day</h3>
  </div>
</template>

<script>
  export default {

  }
</script>

<style>
  .separator {
    position: relative;
    font-size: 12px;
    line-height: 20px;
    margin: 25px 0;
    text-align: center;
    text-transform: uppercase;
  }

  .separator:before {
    position: absolute;
    top: 50%;
    display: block;
    content: "";
    width: 100%;
    height: 1px;
    background-color: #434857;
  }

  .separator h3 {
    margin-top: 0;
    margin-bottom: 0;
    font-size: 100%;
    position: relative;
    z-index: 2;
    display: inline-block;
    padding-left: 1em;
    padding-right: 1em;
    color: #6f7890;
    vertical-align: middle;
    background-color: #252830;
  }
</style>
