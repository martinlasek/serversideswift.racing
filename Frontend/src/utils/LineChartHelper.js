import store from "../store";
import moment from "moment";
import Helper from './Helper';
import DateHelper from './DateHelper';

export default class LineChartHelper {

  static createListOfStarsForEachDay(days, stars) {
    const list = [];

    days.forEach(day => {
      const star = (stars[day] === undefined) ? {created_at: day, amount: null} : stars[day];
      list.push(star);
    });

    return list;
  }
}
