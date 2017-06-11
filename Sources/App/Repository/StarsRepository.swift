class StarsRepository {
  
  func findAllStarsBy(repoId: Int) throws -> [Stars] {
    return try Stars.makeQuery().filter("repository_id", repoId).all()
  }
}
