import Vapor
import SwiftSoup

extension Droplet {
  
  func setupRoutes() throws {
    
    get("/") { request in
      
      let repoDispatcher = RepositoryDispatcher(drop: self)
      
      let repos = try repoDispatcher.getAllRepositories()
      
      var j = JSON()
      
      for repo in repos {
        
        try j.set(
          repo.name, [
            "name": repo.name,
            "url": repo.url,
            "website": repo.website,
            "stars": try repoDispatcher.getStarsOfLastThirtyDays(of: repo.id!.int!).makeJSON(),
            "stars_per_day": repoDispatcher.getStarsPerDay(of: repo.id!.int!)
          ]
        )
      }
      
      try self.addLastThirtyDatesToJson(j: &j)
      let n = j.makeNode(in: nil)
      return try self.view.make("base", n)
    }
  }
  
  //  returns json with last thirty dates in form of: 2017-05-12
  //
  func addLastThirtyDatesToJson(j: inout JSON) throws {
    
    let dayInSeconds = Days.one.rawValue
    let today = Date.timeIntervalSinceReferenceDate
    var days = [String]()
    
    for day in 1...30 {
      
      let stringDate = try removeTimeFrom(date: Date(timeIntervalSinceReferenceDate: today-(dayInSeconds * Double(day))))
      days.append(stringDate)
    }
    
    try j.set("dates", days.reversed().array)
  }
  
  //  trims day from given date
  //  returns string of day like: 2017-05-12
  //
  func removeTimeFrom(date: Date) throws -> String {
    
    guard let dateString = String(describing: date).components(separatedBy: " ").first else {
      throw DateError.couldNotTrimTimeFromDate("could not get first element of array that was created from date in order to split day from time")
    }
    
    return dateString
  }
}
