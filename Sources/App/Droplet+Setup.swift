@_exported import Vapor
import Jobs

extension Droplet {

  public func setup() throws {
      
    try setupRoutes()
    
    let repoDispatcher = RepositoryDispatcher(drop: self)
    
    Jobs.add(interval: .days(1)) {
      try repoDispatcher.fetchStars()
    }
  }
}
