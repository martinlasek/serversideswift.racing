<template>
  <div class="layout-container">
    <header-layout />
    <sidebar-layout />
    <div class="main-container">
      <section>
        <slot name="content"></slot>
      </section>
      <footer-layout />
    </div>
  </div>
</template>

<script>
  import HeaderLayout from './Header.vue'
  import SidebarLayout from './Sidebar.vue'
  import FooterLayout from './Footer.vue'

  export default {
    components: { HeaderLayout, SidebarLayout, FooterLayout }
  }
</script>