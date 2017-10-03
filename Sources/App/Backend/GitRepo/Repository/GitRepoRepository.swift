class GitRepoRepository {
  
  func findAllGitRepos() throws -> [GitRepo]? {
    return try GitRepo.makeQuery().all()
  }
}
