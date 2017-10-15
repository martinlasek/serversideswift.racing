class Helper {
  
  static func convertDaysIntoSeconds(_ days: Double) -> Double {
    let oneDayInSeconds: Double = 86400
    return days * oneDayInSeconds
  }
  
  static func errorJson(status: Int, message: String) throws -> JSON {
    return try JSON(node: ["status": status, "message": message])
  }
}
