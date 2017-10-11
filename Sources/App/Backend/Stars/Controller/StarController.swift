final class StarController {
  lazy var starsRepo = StarsRepository()
  
  func getAllStarsForPastDays(_ req: Request) throws -> ResponseRepresentable {
    guard let gitRepoId = req.json?["gitRepoId"]?.int else {
      return try JSON(node: ["status": 406, "message": "no 'gitRepoId' provided"])
    }
    guard let days = req.json?["days"]?.int else {
      return try JSON(node: ["status": 406, "message": "no 'days' provided"])
    }
    
    
    
    return ""
  }
}
