import Foundation
import Helpers

let url = Bundle.module.url(forResource: "day7", withExtension: "txt")!
let fileContents = try! String(contentsOf: url, encoding: .utf8)

let lines = fileContents.split(separator: "\n")
