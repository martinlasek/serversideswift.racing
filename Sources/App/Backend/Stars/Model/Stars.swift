import Vapor
import FluentProvider
import HTTP

final class Stars: Model {
  let storage = Storage()
  let repositoryId: Int
  let amount: Int
  
  init(repositoryId: Int, amount: Int) {
    self.repositoryId = repositoryId
    self.amount = amount
  }
  
  init(row: Row) throws {
    repositoryId = try row.get("repository_id")
    amount = try row.get("amount")
  }
  
  func makeRow() throws -> Row {
    var row = Row()
    try row.set("repository_id", repositoryId)
    try row.set("amount", amount)
    return row
  }
}

extension Stars: Preparation {
  static func prepare(_ database: Database) throws {
    try database.create(self) { builder in
      builder.id()
      builder.int("repository_id")
      builder.int("amount")
    }
  }
  static func revert(_ database: Database) throws {
    try database.delete(self)
  }
}

extension Stars: JSONConvertible {
  convenience init(json: JSON) throws {
    try self.init(
      repositoryId: json.get("repository_id"),
      amount: json.get("amount")
    )
  }
  
  func makeJSON() throws -> JSON {
    var json = JSON()
    try json.set("repository_id", repositoryId)
    try json.set("amount", amount)
    try json.set("created_at", createdAt)
    return json
  }
}

extension Stars: Timestampable {}

extension Stars: ResponseRepresentable { }
