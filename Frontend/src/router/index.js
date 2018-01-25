import Vue from 'vue'
import Router from 'vue-router'
import Home from '../components/sites/Home.vue'
import Versions from '../components/sites/Versions'

Vue.use(Router);

export default new Router({
  routes: [
    {
      path: '/',
      name: 'home',
      component: Home
    },
    {
      path: '/versions',
      name: 'versions',
      component: Versions
    }
  ]
})
