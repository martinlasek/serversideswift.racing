<template>
  <div class="container">
    <section>
      <slot />
    </section>
    <footer-layout />
  </div>
</template>

<script>
  import FooterLayout from './Footer.vue'

  export default {
    components: { FooterLayout }
  }
</script>
