class GitRepoRepository {
  
  func findAllGitRepos() throws -> [GitRepo]? {
    return try GitRepo.makeQuery().all()
  }
  
  func findGitRepoBy(id: Int) throws -> GitRepo? {
    return try GitRepo.makeQuery().find(id)
  }
}
