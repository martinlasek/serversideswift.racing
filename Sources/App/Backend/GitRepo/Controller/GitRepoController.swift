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
  }
  
  func getAllGitRepos(_ req: Request) throws -> ResponseRepresentable {
    guard let list = try gitRepoDispatcher.getAllGitRepos(req: GitRepoListRequest()) else {
      return try Response(status: .internalServerError, json: try JSON(node: ["message": "could not fetch git repos from database"]))
    }
    return try list.list.makeJSON()
  }
}
