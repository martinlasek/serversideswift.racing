import Helper from '../utils/Helper';
import DateHelper from '../utils/DateHelper';
import LineChartHelper from '../utils/LineChartHelper';
import {frameworks} from '../utils/constants'

export default class DayContext {

  constructor(store, days) {

    this._store = store;
    this._days = days;
    this._gitRepoList = Helper.deepCopy(this._store.getters.getGitRepoList);

    this.initChartData();
  }

  /// needs some refactoring love <3
  initChartData() {

    if (this._gitRepoList.length === 0) {
      return;
    }

    if (!Helper.doesListElementsHave('stars', this._gitRepoList)) {
      return;
    }

    const timeSpan = DateHelper.getListWithPastDays(this._days);

    this._gitRepoList = this._gitRepoList.map(repo => {

      const processedStars = LineChartHelper.createListOfStarsForEachDay(timeSpan, repo.stars);
      const dataSet = {
        label: repo.name,
        data: processedStars.map(star => star.amount),
        chartLabels: processedStars.map(star => DateHelper.getDayFromDate(star.created_at))
      }

      return {...dataSet, ...frameworks[repo.name].lineChartStyle};
    });

    this._gitRepoList = Helper.sortDescOnDataSum('data', this._gitRepoList);
  }

  chartData() {

    if (this._gitRepoList.length === 0) {
      return null;
    }

    if (!Helper.doesListElementsHave('data', this._gitRepoList)) {
      return null;
    }

    return {
      labels: this._gitRepoList[0].chartLabels,
      datasets: this._gitRepoList
    };
  }
}
