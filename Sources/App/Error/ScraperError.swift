enum ScraperError: Error {
  case couldNotParse(String)
  case couldNotConvert(String)
}
