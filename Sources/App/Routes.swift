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
      return try self.view.make("home", n)
    }
    
    get("/imprint") { req in
      
      return try self.view.make("imprint")
    }
    
    get("/image") { req in
      
      let url = "https://twitter.com/martinlasek"
      let selector = ".ProfileAvatar-image"
      
      let resp = try self.client.get(url).description
        
      guard let html: Document = try? SwiftSoup.parse(resp) else {
        throw ScraperError.couldNotParse("could not parse response to html (\(url))")
      }
      
      guard let imageElement = try html.select(selector).first() else {
        throw ScraperError.couldNotSelectElement("failed to get image url from twitter profile picture")
      }
      
      let imageUrl = try imageElement.attr("src")
      
      var j = JSON()
      try j.set("url", String(imageUrl))
      
      return j
    }
  }
  
  //  returns json with last thirty dates in form of: 2017-05-12
  //
  func addLastThirtyDatesToJson(j: inout JSON) throws {
    
    let dayInSeconds = Days.one.rawValue
    let today = Date.timeIntervalSinceReferenceDate
    var days = [String]()
    
    // WORKAROUND: start on the day before yesterday
    // because server will now magically start the day before yesterday instead
    for day in 2...31 {
      
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
