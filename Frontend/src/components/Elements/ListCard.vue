<template>
  <div class="list-card">
    <h2> {{title}} </h2>
    <div class="card">
      <div class="list">
        <ul>
          <li v-for="(element, index) in list" :key="index">
            {{ element }}
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    props: {
      title: {required: true},
      list: {required: true}
    }
  }
</script>

<style lang="less">
  @import "../../assets/styles/min/ListCard";
</style>
