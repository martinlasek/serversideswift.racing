import Helper from '../utils/Helper';
import DateHelper from '../utils/DateHelper';
import LineChartHelper from '../utils/LineChartHelper';
import {frameworks} from '../utils/constants'

export default class DayContext {

  constructor(store, days) {
    this._store = store;
    this._days = days;
    this._gitRepoList = this._store.getters.getRepoList;

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

    /**
     * override the address in heap to the store with
     * address to new created list by map
     * */
    this._gitRepoList = this._gitRepoList.map(repo => {

      const processedStars = LineChartHelper.createListOfStarsForEachDay(timeSpan, repo.stars);
      const dataSet = {
        label: repo.name,
        data: processedStars.map(star => star.amount),
        chartLabels: processedStars.map(star => DateHelper.getDayFromDate(star.created_at)),
        originData: processedStars
      };

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

  chartTitle() {
    const k = this._gitRepoList[0].originData;
    const l = k.map(star => DateHelper.getMonthFromDate(star.created_at));
    const m = [...new Set(l)]; // creates an array with unique elements
    const n = m.map(monthNr => DateHelper.getMonthByNumber(monthNr)); // convert number into names
    const o = n.map(month => month.slice(0, 3) + '.'); // take first three letters
    const p = o.length > 1 ? o.join(' / ') : o[0]; // concatenate month names when more than one exists
    return p;
  }
}
