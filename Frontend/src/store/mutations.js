import * as types from '../store/mutation-types'

/**
 * MUTATIONS
 * are to mutate the state directly
 */
export default {

// pragma mark - git repo

  [types.SET_GIT_REPO_LIST] (state, gitRepoList) {
    state.gitRepoList = gitRepoList;
  },

  [types.SET_DATA_FOR_GIT_REPO] (state, gitRepoData) {

    state.lineChart.data.push(gitRepoData);
  },

  [types.CLEAR_DATA_FOR_GIT_REPO] (state) {

    state.lineChart.data = [];
  }
}
