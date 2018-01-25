import axios from 'axios';
import store from '../store/index';

//const BASE_URL = 'http://127.0.0.1:9001/api';

//pragma mark - use for PRODUCTION
const BASE_URL = '';

const GET_URL = {
  STARS: (gitRepoId, days) => BASE_URL + '/stars/' + gitRepoId + '?days=' + days,
  REPO_LIST: BASE_URL + '/gitrepo/list'
};

export function getStarsFromRepoForGivenDays(repoId, days) {

  axios
    .get(
      GET_URL.STARS(repoId, days)
    )
    .then(resp => {

      store.dispatch('setStarsDataToAccordingGitRepo', resp.data);
    })
    .catch(error => {

      console.log(error);
      throw `Error: Could not fetch stars for repo with id: ${repoId}`;
    })
  ;
}

export function getRepoList(callback = null) {

  axios
    .get(GET_URL.REPO_LIST)
    .then(resp => {

      store.dispatch('setRepoList', resp.data);
      if (callback !== null) {

        callback();
      }
    })
    .catch(error => {

      console.log(error);
      throw "Error: Could not fetch git repo list";
    })
  ;
}
