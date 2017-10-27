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
  }
  
  func getAllGitRepos(_ req: Request) throws -> ResponseRepresentable {
    guard let res = try gitRepoDispatcher.getAll(req: GitRepoListRequest()) else {
      return try Helper.errorJson(status: 500, message: "could not fetch git repos from database")
    }
    
    return try res.list.makeJSON()
  }
}
