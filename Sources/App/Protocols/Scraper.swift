protocol Scraper {
  var url: String {get}
  var name: String {get}
  var website: String {get}
  var selector: String {get}
  
  func scrapeStars() throws -> Int
}
