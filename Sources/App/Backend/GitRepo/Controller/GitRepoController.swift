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
    drop.get("api/gitrepo/stars", handler: getStars)
  }
  
  func getAllGitRepos(_ req: Request) throws -> ResponseRepresentable {
    guard let list = try gitRepoDispatcher.getAll(req: GitRepoListRequest()) else {
      return try Response(status: .internalServerError, json: try JSON(node: ["message": "could not fetch git repos from database"]))
    }
    return try list.list.makeJSON()
  }
  
  func getStars(_ req: Request) throws -> ResponseRepresentable {
    guard let gitRepoId = req.json?["gitRepoId"]?.int else {
      return try JSON(node: ["status": 406, "message": "no 'gitRepoId' provided"])
    }
    guard let days = req.json?["days"]?.double else {
      return try JSON(node: ["status": 406, "message": "no 'days' provided"])
    }
    let req = StarsRequest(gitRepoId: gitRepoId, days: days)
    return ""
  }
}
