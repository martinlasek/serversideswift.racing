import * as types from '../store/mutation-types'

/**
 * MUTATIONS
 * are to mutate the state directly
 */
export default {

  /// Mark - git repo

  [types.SET_REPO_LIST] (state, repoList) {
    state.repoList = repoList;
  }
}
