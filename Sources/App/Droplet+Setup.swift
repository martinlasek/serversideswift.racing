@_exported import Vapor
import Jobs

extension Droplet {

  public func setup() throws {
      
    try setupRoutes()
    
    let repoDispatcher = RepositoryDispatcher(drop: self)
    
    Jobs.add(interval: .seconds(23)) {
      try repoDispatcher.fetchStars()
    }
  }
}
