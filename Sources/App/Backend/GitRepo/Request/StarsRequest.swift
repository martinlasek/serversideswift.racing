class StarsRequest {
  let gitRepoId: Int
  let days: Date
  
  init(gitRepoId: Int, days: Double) {
    self.gitRepoId = gitRepoId
    self.days = Date(timeIntervalSinceReferenceDate: Date.timeIntervalSinceReferenceDate - Helper.convertSecondsFromAmount(days))
  }
}
