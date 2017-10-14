import Vapor
import HTTP

final class GitRepoController {
  let drop: Droplet
  let gitRepoDispatcher: GitRepoDispatcher
  
  init(drop: Droplet) {
    self.drop = drop
    self.gitRepoDispatcher = GitRepoDispatcher(drop: drop)
  }
  
  func setupRoutes() {
    drop.get("api/gitrepo/list", handler: getAllGitRepos)
    drop.get("api/gitrepo/", ":id", handler: getStars)
  }
  
  func getAllGitRepos(_ req: Request) throws -> ResponseRepresentable {
    guard let list = try gitRepoDispatcher.getAll(req: GitRepoListRequest()) else {
      return try Response(status: .internalServerError, json: try JSON(node: ["message": "could not fetch git repos from database"]))
    }
    return try list.list.makeJSON()
  }
  
  func getStars(_ req: Request) throws -> ResponseRepresentable {
    
    /// get the in setupRoutes defined parameter as int
    guard let gitRepoId = req.parameters["id"]?.int else {
      return try JSON(node: ["status": 406, "message": "no 'id' provided"])
    }
    
    /// get the ?days=30 parameter as double
    guard let days = req.data["days"]?.double else {
      return try JSON(node: ["status": 406, "message": "no 'days' provided"])
    }
    
    let req = StarsRequest(gitRepoId: gitRepoId, days: days)
    guard let resp = try gitRepoDispatcher.getStars(req: req) else {
      return try Response(
        status: .internalServerError,
        json: try JSON(node: ["message": "could not get stars. days: \(days), gitRepoId: \(gitRepoId)"])
      )
    }
    return try resp.makeJSON()
  }
}
