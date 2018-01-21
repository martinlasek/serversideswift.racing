import Foundation

class Helper {
  
  static func convertDaysIntoSeconds(_ days: Double) -> Double {
    let oneDayInSeconds: Double = 86400
    return days * oneDayInSeconds
  }
  
  static func getTodayStartingAtMidnight() -> Date {
    
    /// get todays date
    let today = Date(timeIntervalSinceReferenceDate: Date.timeIntervalSinceReferenceDate)
    
    // initiate date formatter
    let dateFormatter = DateFormatter()
    
    /// format date to string having only date (no hours/minutes/seconds)
    dateFormatter.dateFormat = "YYYY-MM-DD"
    let dateAsString = dateFormatter.string(from: today)
    
    /// format dateAsString back to Date object (here it somehow turns it into yesterday 23pm)
    /// that's why we add another hour to get 00:00 of today
    return dateFormatter.date(from: dateAsString)!.addingTimeInterval(3600)
  }
  
  static func errorJson(status: Int, message: String) throws -> JSON {
    return try JSON(node: ["status": status, "message": message])
  }
}
