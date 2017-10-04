<template>
  <div class="layout-container">
    <header-layout></header-layout>
    <slot name="content"></slot>
  </div>
</template>

<script>
  import HeaderLayout from './Header.vue'

  export default {
    components: { HeaderLayout }
  }
</script>

<style>

</style>