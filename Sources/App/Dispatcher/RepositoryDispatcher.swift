import Vapor

class RepositoryDispatcher {
  let repoRepo = RepositoryRepository()
  let starsRepo = StarsRepository()
  let drop: Droplet
  
  init(drop: Droplet) {
    self.drop = drop
  }

  // MARK: public functions
  
  func fetchStars() throws {
    try fetchStarsOf(scraper: VaporScraper(drop: drop))
    try fetchStarsOf(scraper: PerfectScraper(drop: drop))
    try fetchStarsOf(scraper: KituraScraper(drop: drop))
    try fetchStarsOf(scraper: ZewoScraper(drop: drop))
  }
  
  func getAllRepositories() throws -> [Repository] {
    return try repoRepo.findAllRepositories()
  }
  
  func getAllStarsBy(repoId: Int) throws -> [Stars] {
    return try starsRepo.findAllStarsBy(repoId: repoId)
  }
  
  // MARK: private functions
  
  private func fetchStarsOf(scraper: Scraper) throws {
    let starsAmount = try scraper.scrapeStars()
    
    guard let repo = try Repository.makeQuery().filter("name", scraper.name).first() else {
      try createRepository(scraper: scraper)
      try fetchStarsOf(scraper: scraper)
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
