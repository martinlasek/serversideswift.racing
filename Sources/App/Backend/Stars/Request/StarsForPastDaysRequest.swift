class StarsForPastDaysRequest {
  let days: Int
  let gitRepoId: Int
  
  init(days: Int, gitRepoId: Int) {
    self.days = days
    self.gitRepoId = gitRepoId
  }
}
