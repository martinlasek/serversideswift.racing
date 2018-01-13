import moment from "moment";

export default class DateHelper {

  /// formats date '2017-10-24T22:15:10.414Z' to '24-10-2017'
  static formatDate(datetime) {
    return new moment(datetime, "YYYY-MM-DD").format("DD-MM-YYYY")
  }

  /// returns array with dates starting from today til given past days
  static getArrayWithPastDaysAsc(days) {
    const lastDays = [];
    for (let day = 1; day <= days; day++) {
      let date = moment().subtract(day, 'days').format("DD-MM-YYYY");
      lastDays.push(date)
    }

    return lastDays.reverse(); // asc
  }
}
