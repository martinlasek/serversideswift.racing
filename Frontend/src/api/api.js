import axios from 'axios';
import store from '../store/index';

const BASE_URL = 'http://127.0.0.1:9001/api';

//pragma mark - use for PRODUCTION
//const BASE_URL = '';

const GET_URL = {
  stars: (gitRepoId, days) => BASE_URL + '/stars/' + gitRepoId + '?days=' + days,
  gitRepoList: BASE_URL + '/gitrepo/list'
};

export function getStarsFromRepoForGivenDays(repoId, days) {

  axios
    .get(
      GET_URL.stars(repoId, days)
    )
    .then(resp => {

      store.dispatch('setStarsDataToAccordingGitRepo', resp.data);
    })
    .catch(error => {

      console.log(error.response);
    })
  ;
}

export function getAllGitRepos(callback = null) {

  axios
    .get(
      GET_URL.gitRepoList
    )
    .then(resp => {

      store.dispatch('setGitRepoList', resp.data);

      if (callback !== null) {

        callback();
      }
    })
    .catch(error => {

      console.log(error.response);
    })
  ;
}
