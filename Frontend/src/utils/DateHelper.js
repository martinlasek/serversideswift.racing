import moment from "moment";

export default class DateHelper {

  /** formats date '2017-10-24T22:15:10.414Z' to '24-10-2017' */
  static formatDate(datetime) {

    return new moment(datetime, "YYYY-MM-DD").format("DD-MM-YYYY")
  }
}
