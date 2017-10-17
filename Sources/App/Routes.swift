import Vapor
import SwiftSoup

extension Droplet {
  func setupRoutes() throws {
    let gitRepoController = GitRepoController(drop: self)
    let starsController = StarsController(drop: self)
    gitRepoController.setupRoutes()
    starsController.setupRoutes()
  }
}
