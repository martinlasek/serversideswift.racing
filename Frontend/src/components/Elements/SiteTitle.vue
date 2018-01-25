<template>
  <h1 class="site-title">
    <a v-if="hasLink" :href="link">
      {{ title }}
    </a>
    <span v-else>
      {{ title }}
    </span>
  </h1>
</template>

<script>
  export default {

    props: {
      title: {required: true},
      link: {default: ''}
    },

    computed: {
      hasLink() {
        return this.link.length > 0;
      }
    }
  }
</script>

<style lang="less">
  .site-title {
    text-align: center;
    margin: 0 0 30px;
    font-weight: 300;

    a {
      color: inherit;
      text-decoration: none;

      &:hover {
        text-decoration: underline;
      }
    }
  }
</style>
