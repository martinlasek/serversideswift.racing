import FluentProvider
import PostgreSQLProvider

extension Config {
  
  public func setup() throws {
    try setupProviders()
    try setupPreparations()
  }
  
  private func setupProviders() throws {
    try addProvider(FluentProvider.Provider.self)
    try addProvider(PostgreSQLProvider.Provider.self)
  }
  
  private func setupPreparations() throws {
    preparations.append(GitRepo.self)
    preparations.append(Stars.self)
  }
}
