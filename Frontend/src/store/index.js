import Vue from 'vue'
import Vuex from 'vuex'
import createPersistedState from 'vuex-persistedstate'
import * as getters from '../store/getters'
import * as actions from '../store/actions'
import mutations from '../store/mutations'

Vue.use(Vuex);

const state = {
  repoList: [],
  lineChart: {
    data: {
      labels: [],
      datasets: []
    }
  }
};

export default new Vuex.Store({
  state,
  getters,
  actions,
  mutations,
  plugins: [createPersistedState()]
});
