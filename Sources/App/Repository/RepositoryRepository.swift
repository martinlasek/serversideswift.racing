class RepositoryRepository {
  
  func findAllRepositories() throws -> [Repository] {
    
    return try Repository.makeQuery().all()
  }
}
