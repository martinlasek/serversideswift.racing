import Vue from 'vue'
import Vuex from 'vuex'
import createPersistedState from 'vuex-persistedstate'
import * as getters from '../store/getters'
import * as actions from '../store/actions'
import mutations from '../store/mutations'

Vue.use(Vuex);

const state = {
  gitRepoList: [],
  lineChart: {
    data: [],
    units: {
      day: true,
      month: false,
      year: false
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
