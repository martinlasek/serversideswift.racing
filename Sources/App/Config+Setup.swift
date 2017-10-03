import FluentProvider
import PostgreSQLProvider
import LeafProvider

extension Config {
  
  public func setup() throws {
    Node.fuzzy = [Row.self, JSON.self, Node.self]

    try setupProviders()
    try setupPreparations()
  }
  
  private func setupProviders() throws {
    try addProvider(FluentProvider.Provider.self)
    try addProvider(PostgreSQLProvider.Provider.self)
    try addProvider(LeafProvider.Provider.self)
  }
  
  private func setupPreparations() throws {
    preparations.append(GitRepo.self)
    preparations.append(Stars.self)
  }
}
