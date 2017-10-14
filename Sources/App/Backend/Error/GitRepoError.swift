enum GitRepoError: Error {
  case couldNotGetRepoList(String)
  case couldNotGetStars(String)
}
