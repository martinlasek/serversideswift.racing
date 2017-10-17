final class StarsController {
  let drop: Droplet
  let starsDispatcher: StarsDispatcher
  
  init(drop: Droplet) {
    self.drop = drop
    self.starsDispatcher = StarsDispatcher()
  }
  
  func setupRoutes() {
    let api = drop.grouped("api")
    api.get("stars/", ":id", handler: getStars)
  }
  func getStars(_ req: Request) throws -> ResponseRepresentable {
    
    /// get the in setupRoutes defined parameter as int
    guard let gitRepoId = req.parameters["id"]?.int else {
      return try Helper.errorJson(status: 406, message: "no 'id' provided")
    }
    
    /// get the ?days=30 parameter as double
    guard let days = req.data["days"]?.double else {
      return try Helper.errorJson(status: 406, message: "no 'days' provided")
    }
    
    let req = StarListRequest(gitRepoId: gitRepoId, days: days)
    guard let resp = try starsDispatcher.getStarList(req: req) else {
      return try Helper.errorJson(status: 500, message: "could not find stars for gitrepoid: '\(gitRepoId)' and days: '\(days)'")
    }
    return try resp.makeJSON()
  }
}
