enum RepositoryError: Error {
  case noRepositoryIdIsSet(String)
  case couldNotFetchGitRepos(String)
}
