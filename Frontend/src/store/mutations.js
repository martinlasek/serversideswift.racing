import * as types from '../store/mutation-types'

/**
 * MUTATIONS
 * are to mutate the state directly
 */
export default {

// pragma mark - git repo

  /** stores git repo list in global state */
  [types.SET_GIT_REPO_LIST] (state, gitRepoList) {
    state.gitRepoList = gitRepoList;
  }
}