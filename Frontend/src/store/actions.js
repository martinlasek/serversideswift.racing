import * as types from '../store/mutation-types'
import DateHelper from "../utils/DateHelper";

/**
 *  ACTIONS
 *  are a bridge used to mutate the state
 */

// pragma mark - git repo

export const setGitRepoList = (state, gitRepolist) => {

  state.commit(types.SET_GIT_REPO_LIST, gitRepolist);
};

export const setStarsDataToAccordingGitRepo = (state, starsData) => {

  let gitRepoList = [...state.getters.getGitRepoList];
  gitRepoList = gitRepoList.map(gitRepo => {

    if (gitRepo.id === starsData.gitRepoId) {

      const stars = {};
      starsData.list.forEach(star => {

        const date = DateHelper.formatDate(star.created_at);
        stars[date] = {...star, ...{created_at: date}};
      });

      gitRepo.stars = stars;
    }

    return gitRepo;
  });

  state.commit(types.SET_GIT_REPO_LIST, gitRepoList);
};

export const clearStarsDataForRepo = (state) => {

  state.commit(types.CLEAR_DATA_FOR_GIT_REPO);
};
