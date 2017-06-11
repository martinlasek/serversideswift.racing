import Vapor
import FluentProvider
import HTTP

final class Repository: Model {
  let storage = Storage()
  var name: String
  var url: String
  var website: String
  
  init(name: String, url: String, website: String) {
    self.name = name
    self.url = url
    self.website = website
  }

  init(row: Row) throws {
    name = try row.get("name")
    url = try row.get("url")
    website = try row.get("website")
  }

  func makeRow() throws -> Row {
    var row = Row()
    
    try row.set("name", name)
    try row.set("url", url)
    try row.set("website", website)
    
    return row
  }
}

extension Repository: Preparation {
  
  static func prepare(_ database: Database) throws {
    try database.create(self) { builder in
      builder.id()
      builder.string("name")
      builder.string("url")
      builder.string("website")
    }
  }

  static func revert(_ database: Database) throws {
    try database.delete(self)
  }
}

extension Repository: JSONConvertible {
  convenience init(json: JSON) throws {
    try self.init(
      name: json.get("name"),
      url: json.get("url"),
      website: json.get("website")
    )
  }
    
  func makeJSON() throws -> JSON {
    var json = JSON()
    
    try json.set("id", id)
    try json.set("name", name)
    try json.set("url", url)
    try json.set("website", website)
    
    return json
  }
}

extension Repository: ResponseRepresentable { }
