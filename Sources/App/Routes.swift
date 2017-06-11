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
          repo.name,
          [
            "url": repo.url,
            "website": repo.website,
            "stars": try repoDispatcher.getAllStarsBy(repoId: repo.id!.int!).makeJSON()
          ]
        )
      }
      
      return j
    }
  }
}
