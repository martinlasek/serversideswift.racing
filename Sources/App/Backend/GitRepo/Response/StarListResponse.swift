class StarListResponse {
  let gitRepoId: Int
  let list: [Stars]
  
  init(gitRepoId: Int, list: [Stars]) {
    self.gitRepoId = gitRepoId
    self.list = list
  }
}

extension StarListResponse: JSONRepresentable {
  func makeJSON() throws -> JSON {
    var json = JSON()
    try json.set("gitRepoId", gitRepoId)
    try json.set("list", list.makeJSON())
    return json
  }
}
