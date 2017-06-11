import Vapor
import SwiftSoup

extension Droplet {
  
  func setupRoutes() throws {
    
    get("/") { request in
      
      let repoDispatcher = RepositoryDispatcher(drop: self)
      try repoDispatcher.updateStars()
      
      return "success"
    }
  }
}
