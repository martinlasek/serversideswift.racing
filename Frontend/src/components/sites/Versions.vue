<template>
  <base-layout>
    <page-header title="Versions" />
    <list-card v-for="version in versions" :title="version.number" :list="version.changes"/>
  </base-layout>
</template>

<script>
  import BaseLayout from '../layout/Base.vue';
  import PageHeader from '../Elements/PageHeader';
  import ListCard from '../Elements/ListCard';
  import {versions} from '../../utils/versions';

  export default {
    components: { BaseLayout, PageHeader, ListCard },

    data() {
      return {
        versions: versions
      }
    }
  }
</script>
