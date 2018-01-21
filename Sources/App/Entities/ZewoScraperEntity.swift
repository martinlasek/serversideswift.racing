import Vapor
import SwiftSoup

class ZewoScraper: StarScraper {
  let url = "https://github.com/Zewo/Zewo"
  let name = "zewo"
  let website = "http://zewo.io"
  let selector = "[href='/Zewo/Zewo/stargazers']"
  var drop: Droplet
  
  init(drop: Droplet) {
    self.drop = drop
  }
}
