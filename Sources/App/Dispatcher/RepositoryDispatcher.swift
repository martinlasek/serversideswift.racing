import Vapor

class RepositoryDispatcher {
  let drop: Droplet
  
  init(drop: Droplet) {
    self.drop = drop
  }
  
  func updateStars() throws {
    try updateVaporStars()
  }
  
  private func updateVaporStars() throws {
    let scraper = VaporScraper(drop: drop)
    let starsAmount = try scraper.scrapeStars()
    
    guard let repo = try Repository.makeQuery().filter("name", VaporScraper.name).first() else {
      try createVaporRepository()
      try updateVaporStars()
      return
    }
    
    guard let repoId = repo.id?.int else {
      throw RepositoryError.noRepositoryIdIsSet("cannot get current repo id as int")
    }
    
    let stars = Stars(repositoryId: repoId, amount: starsAmount)
    try stars.save()
  }
  
  private func createVaporRepository() throws {
    let vaporRepo = Repository(name: VaporScraper.name, url: VaporScraper.url, website: VaporScraper.website)
    try vaporRepo.save()
  }
}
