class StarsRepository {
  
  func findAllStarsSince(date: Date, of repoId: Int) throws -> [Stars] {
    return try Stars.makeQuery().filter(Stars.createdAtKey, .greaterThan, date).filter("repository_id", repoId).sort(Stars.createdAtKey, .ascending).all()
  }
  
  func findAllStarsBy(repoId: Int) throws -> [Stars] {
    return try Stars.makeQuery().filter("repository_id", repoId).all()
  }
}
