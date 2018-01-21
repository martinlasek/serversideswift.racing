import SwiftSoup

protocol StarScraper {
  var url: String {get}
  var name: String {get}
  var website: String {get}
  var selector: String {get}
  var drop: Droplet {get set}
}

extension StarScraper {
  
  func scrapeStars() throws -> Int {
    let html = try getWebsite()
    let stars = try scrapeStars(html: html)
    return stars
  }
  
  // MARK: private functions
  
  private func getWebsite() throws -> Document {
    let resp = try drop.client.get(url).description
    
    guard let html: Document = try? SwiftSoup.parse(resp) else {
      throw ScraperError.couldNotParse("could not parse response to html (\(url))")
    }
    
    return html
  }
  
  private func scrapeStars(html: Document) throws -> Int {
    let starsString = try html.select(selector).text().components(separatedBy: ",").joined()
    
    guard let stars = Int(starsString) else {
      throw ScraperError.couldNotConvert("could not convert stars as string to type int (\(url))")
    }
    
    return stars
  }
}
