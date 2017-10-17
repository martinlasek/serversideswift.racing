class StarsDispatcher {
  let starsRepo: StarsRepository
  
  init() {
    self.starsRepo = StarsRepository()
  }
  
  func getStarList(req: StarListRequest) throws -> StarListResponse? {
    guard let list = try starsRepo.findStarsSince(date: req.day, of: req.gitRepoId) else { return nil }
    if list.isEmpty { return nil }
    return StarListResponse(gitRepoId: req.gitRepoId, list: list)
  }
}
