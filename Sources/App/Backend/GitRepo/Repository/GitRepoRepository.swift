class GitRepoRepository {
  
  func findAllRepositories() throws -> [GitRepo] {
    
    return try GitRepo.makeQuery().all()
  }
}
