import Helper from '../utils/Helper';
import DateHelper from '../utils/DateHelper';
import LineChartHelper from '../utils/LineChartHelper';
import {frameworks} from '../utils/constants'

export default class DayChartHelper {

  static createDataSetForEachRepo(days, repoList) {

    /**
     * override the address in heap to the store with
     * address to new created list by map
     * */
    return repoList.map(repo => {

      const processedStars = LineChartHelper.createListOfStarsForEachDay(days, repo.stars);
      const dataSet = {
        label: repo.name,
        data: processedStars.map(star => star.amount),
        chartLabels: processedStars.map(star => DateHelper.getDayFromDate(star.created_at)),
        originData: processedStars
      };

      return {...dataSet, ...frameworks[repo.name].lineChartStyle};
    });
  }
}
