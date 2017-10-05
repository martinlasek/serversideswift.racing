import * as types from '../store/mutation-types'

/**
 *  ACTIONS
 *  are a bridge used to mutate the state
 */

// pragma mark - git repo

export const setGitRepoList = (state, gitRepolist) => {
  state.commit(types.SET_GIT_REPO_LIST, gitRepolist);
};