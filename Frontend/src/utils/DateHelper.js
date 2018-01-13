import moment from "moment";

export default class DateHelper {

  /// formats date '2017-10-24T22:15:10.414Z' to '24-10-2017'
  static formatDate(datetime) {
    return new moment(datetime, "YYYY-MM-DD").format("DD-MM-YYYY")
  }

  /// returns '24' from '24-10-2017'
  static getDayFromDate(date) {
    return new moment(date, "DD-MM-YYYY").date();
  }

  /// returns '10' from '24-10-2017'
  static getMonthFromDate(date) {
    return date.split('-')[1];
  }

  /// returns '2017' from '24-10-2017'
  static getYearFromDate(date) {
    return date.split('-')[2];
  }

  /// returns list with dates starting from today til given past days
  static getListWithPastDays(days, asc = true) {
    const lastDays = [];
    for (let day = 1; day <= days; day++) {
      let date = moment().subtract(day, 'days').format("DD-MM-YYYY");
      lastDays.push(date)
    }
    return asc ? lastDays.reverse() : lastDays;
  }
}
