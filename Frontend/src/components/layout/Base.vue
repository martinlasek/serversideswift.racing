<template>
  <div>
    <div class="container">
      <section>
        <slot />
      </section>
    </div>
    <footer-layout />
  </div>
</template>

<script>
  import FooterLayout from './Footer.vue'

  export default {
    components: { FooterLayout }
  }
</script>
