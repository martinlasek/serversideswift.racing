import Helper from '../utils/Helper';

export default class DayContext {

  constructor(store, days) {

    this._store = store;
    this._days = days;
    this._gitRepoList = Helper.deepCopy(this._store.getters.getGitRepoList);

    this.initChartData();
  }

  initChartData() {

    if (this._gitRepoList.length === 0) {
      return;
    }

    if (!Helper.doesListElementsHave('stars', this._gitRepoList)) {
      return [];
    }

    
  }

  chartData() {
    return this._gitRepoList;
  }
}
