<template>
  <div class="layout-container">
    <header-layout />
    <sidebar-layout />
    <div class="main-container">
      <slot name="content"></slot>
    </div>
  </div>
</template>

<script>
  import HeaderLayout from './Header.vue'
  import SidebarLayout from './Sidebar.vue'

  export default {
    components: { HeaderLayout, SidebarLayout }
  }
</script>

<style>

</style>