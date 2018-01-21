import Vapor
import SwiftSoup

class PerfectScraper: StarScraper {
  let url = "https://github.com/PerfectlySoft/Perfect"
  let name = "perfect"
  let website = "https://www.perfect.org"
  let selector = "[href='/PerfectlySoft/Perfect/stargazers']"
  var drop: Droplet
  
  init(drop: Droplet) {
    self.drop = drop
  }
}
