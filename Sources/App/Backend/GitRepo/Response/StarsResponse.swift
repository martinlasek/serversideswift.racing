class StarsResponse {
  let gitRepo: GitRepo
  let list: [Stars]
  
  init(gitRepo: GitRepo, list: [Stars]) {
    self.gitRepo = gitRepo
    self.list = list
  }
}

extension StarsResponse: JSONRepresentable {
  func makeJSON() throws -> JSON {
    var json = JSON()
    try json.set("gitRepo", gitRepo.makeJSON())
    try json.set("list", list.makeJSON())
    return json
  }
}
