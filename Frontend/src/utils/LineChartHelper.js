import store from "../store";
import moment from "moment";
import Helper from './Helper';
import DateHelper from './DateHelper';

export default class LineChartHelper {

  static dayContext(days = 30) {

    let gitRepoList = [...store.getters.getGitRepoList];

    if (gitRepoList.length === 0) { return []; }

    if (!Helper.doesListElementsHave('stars', gitRepoList)) {
      return [];
    }

    const lastThirtyDays = DateHelper.getArrayWithPastDaysAsc(days);
    
    /**
     * map stars list to key value list of length of given days
     * where day is key to star object having an amount (amount = null if day wasn't given)
     * */
    gitRepoList = gitRepoList.map(repo => {

      const stars = [];
      lastThirtyDays.forEach(day => {

        (repo.stars[day] !== undefined) ? stars.push(repo.stars[day]) : stars.push({created_at: day, amount: null});
      });

      /**
       * need to create a new prop to store result in
       * as it seems that property stars is still referencing to the same
       * stars address on heap of the gitRepoList object in store
       * */
      repo.processedStars = stars;
      return repo;
    });

    return gitRepoList;

    /**
     * create a list of last 30 dates
     * map the stars list to have same date format (maybe do it only for the last 60 days)
     * loop through the last 30 days and check if indexOf starsList has an entry
     * if TRUE push it to the new list with data if FALSE push it without data
     * set the list of last 30 days with data to object that have framework name in it
     * push that object with data to chartData in store
     * */

    //const r = [...gitRepoList[0].stars];
    //console.log(r.splice(-30));
    //console.log(gitRepoList[0].stars);
    //const s = gitRepoList[0].stars[0].created_at;
    //const t = new moment(s, "YYYY-MM-DD");
    //console.log(t.date());
    //console.log(t.month() + 1 ); // starting at 0
    //console.log(t.year());

  }

  /** sorts elements in given list on the sum of their data array values */
  static sortDescOnDataSum(list) {

    return list.sort((before, current) => {

      /** sum all data values */
      const a = before.data.reduce((a, b) => a + b);
      const b = current.data.reduce((a, b) => a + b);

      if (a < b) {
        return -1;
      }

      if (a > b) {
        return 1;
      }

      return 0;
    });
  }
}
