import * as types from '../store/mutation-types'
import DateHelper from "../utils/DateHelper";

/**
 *  ACTIONS
 *  are a bridge used to mutate the state
 */

/// Mark - git repo

export const setRepoList = (state, repoList) => {
  state.commit(types.SET_REPO_LIST, repoList);
};

export const setStarsDataToAccordingGitRepo = (state, starsData) => {

  let repoList = state.getters.getRepoList;
  repoList = repoList.map(repo => {

    if (repo.id === starsData.gitRepoId) {

      const stars = {};
      starsData.list.forEach(star => {

        const date = DateHelper.formatDate(star.created_at);
        stars[date] = {...star, ...{created_at: date}};
      });

      repo.stars = stars;
    }

    return repo;
  });

  state.commit(types.SET_REPO_LIST, repoList);
};
