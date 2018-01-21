import Vapor
import SwiftSoup

class KituraScraper: StarScraper {
  let url = "https://github.com/IBM-Swift/Kitura"
  let name = "kitura"
  let website = "http://www.kitura.io"
  let selector = "[href='/IBM-Swift/Kitura/stargazers']"
  var drop: Droplet
  
  init(drop: Droplet) {
    self.drop = drop
  }
}
