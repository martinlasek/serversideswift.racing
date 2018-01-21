@_exported import Vapor
import Jobs

extension Droplet {

  public func setup() throws {
      
    try setupRoutes()
    
    let gitRepoDispatcher = GitRepoDispatcher(drop: self)
    
    Jobs.add(interval: .hours(1)) {
      try gitRepoDispatcher.fetchStars()
    }
  }
}
