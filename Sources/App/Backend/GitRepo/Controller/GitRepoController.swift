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
    let api = drop.grouped("api")
    api.get("gitrepo/list", handler: getAllGitRepos)
    api.get("gitrepo/", ":id", handler: getStars)
  }
  
  func getAllGitRepos(_ req: Request) throws -> ResponseRepresentable {
    guard let res = try gitRepoDispatcher.getAll(req: GitRepoListRequest()) else {
      return try Helper.errorJson(status: 500, message: "could not fetch git repos from database")
    }
    return try res.list.makeJSON()
  }
  
  func getStars(_ req: Request) throws -> ResponseRepresentable {
    
    /// get the in setupRoutes defined parameter as int
    guard let gitRepoId = req.parameters["id"]?.int else {
      return try Helper.errorJson(status: 406, message: "no 'id' provided")
    }
    
    /// get the ?days=30 parameter as double
    guard let days = req.data["days"]?.double else {
      return try Helper.errorJson(status: 406, message: "no 'days' provided")
    }
    
    let req = StarsRequest(gitRepoId: gitRepoId, days: days)
    guard let resp = try gitRepoDispatcher.getStars(req: req) else {
      return try Helper.errorJson(status: 500, message: "could not find stars for gitrepoid: '\(gitRepoId)' and days: '\(days)'")
    }
    return try resp.makeJSON()
  }
}
