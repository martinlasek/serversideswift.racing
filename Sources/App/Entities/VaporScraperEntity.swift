import Vapor
import SwiftSoup

class VaporScraper: StarScraper {
  let url = "https://github.com/vapor/vapor"
  let name = "vapor"
  let website = "https://vapor.codes"
  let selector = "[href='/vapor/vapor/stargazers']"
  var drop: Droplet
  
  init(drop: Droplet) {
    self.drop = drop
  }
}
