import moment from "moment";

export default class DateHelper {

  /// formats date '2017-10-24T22:15:10.414Z' to '24-10-2017'
  static formatDate(datetime) {
    return new moment(datetime, "YYYY-MM-DD").format("DD-MM-YYYY")
  }

  /// param: date of format '24-10-2017'
  static getDayFromDate(date) {
    return new moment(date, "DD-MM-YYYY").date();
  }

  /// param: date of format '24-10-2017'
  static getMonthFromDate(date) {
    return new moment(date, "DD-MM-YYYY").month() + 1;
  }

  /// param: date of format '24-10-2017'
  static getYearFromDate(date) {
    return new moment(date, "DD-MM-YYYY").year();
  }

  static getMonthByNumber(monthNumber) {
    switch (monthNumber) {
      case 1: return 'January'; break;
      case 2: return 'Feburary'; break;
      case 3: return 'March'; break;
      case 4: return 'April'; break;
      case 5: return 'May'; break;
      case 6: return 'June'; break;
      case 7: return 'July'; break;
      case 8: return 'August'; break;
      case 9: return 'September'; break;
      case 10: return 'October'; break;
      case 11: return 'November'; break;
      case 12: return 'December'; break;
      default: throw 'Month for given number: ' + monthNumber + ' does not exists'
    }
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
