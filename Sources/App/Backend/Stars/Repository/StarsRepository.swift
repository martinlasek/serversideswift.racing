class StarsRepository {
  
  func findStarsSince(date: Date, of gitRepoId: Int) throws -> [Stars]? {
    return try Stars.makeQuery()
      .filter(Stars.createdAtKey, .greaterThanOrEquals, date)
      .filter("repository_id", gitRepoId)
      .sort(Stars.createdAtKey, .ascending)
      .all()
  }
  
  func findAllStarsBy(repoId: Int) throws -> [Stars] {
    return try Stars.makeQuery().filter("repository_id", repoId).all()
  }
}
