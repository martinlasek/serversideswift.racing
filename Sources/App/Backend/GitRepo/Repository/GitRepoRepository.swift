class GitRepoRepository {
  
  func findAllGitRepos() throws -> [GitRepo]? {
    return try GitRepo.makeQuery().all()
  }
  
  func findStarsSince(date: Date, of gitRepoId: Int) throws -> [Stars]? {
    return try Stars.makeQuery().filter(Stars.createdAtKey, .greaterThan, date).filter("repository_id", gitRepoId).sort(Stars.createdAtKey, .ascending).all()
  }
  
  func findGitRepoBy(id: Int) throws -> GitRepo? {
    return try GitRepo.makeQuery().find(id)
  }
}
