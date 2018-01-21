import Foundation

class Helper {
  
  static func convertDaysIntoSeconds(_ days: Double) -> Double {
    let oneDayInSeconds: Double = 86400
    return days * oneDayInSeconds
  }
  
  static func getTodayStartingAtMidnight() -> Date {
    let today = Date(timeIntervalSinceReferenceDate: Date.timeIntervalSinceReferenceDate)
    
    /// The common calendar in Europe, the Western Hemisphere, and elsewhere.
    let cal = Calendar(identifier: .gregorian)
    return cal.startOfDay(for: today)
  }
  
  static func errorJson(status: Int, message: String) throws -> JSON {
    return try JSON(node: ["status": status, "message": message])
  }
}
