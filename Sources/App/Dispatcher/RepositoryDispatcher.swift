import Vapor

class RepositoryDispatcher {
  let drop: Droplet
  
  init(drop: Droplet) {
    self.drop = drop
  }
  
  func updateStars() throws {
    try updateStarsOf(scraper: VaporScraper(drop: drop))
    try updateStarsOf(scraper: PerfectScraper(drop: drop))
    try updateStarsOf(scraper: KituraScraper(drop: drop))
    try updateStarsOf(scraper: ZewoScraper(drop: drop))
  }
  
  private func updateStarsOf(scraper: Scraper) throws {
    let starsAmount = try scraper.scrapeStars()
    
    guard let repo = try Repository.makeQuery().filter("name", scraper.name).first() else {
      try createRepository(scraper: scraper)
      try updateStarsOf(scraper: scraper)
      return
    }
    
    guard let repoId = repo.id?.int else {
      throw RepositoryError.noRepositoryIdIsSet("cannot get current repo id as int")
    }
    
    let stars = Stars(repositoryId: repoId, amount: starsAmount)
    try stars.save()
  }
  
  private func createRepository(scraper: Scraper) throws {
    let vaporRepo = Repository(name: scraper.name, url: scraper.url, website: scraper.website)
    try vaporRepo.save()
  }
}
