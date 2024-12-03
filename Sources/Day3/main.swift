import Foundation
import Helpers

let url = Bundle.module.url(forResource: "day3", withExtension: "txt")!
let fileContents = try! String(contentsOf: url, encoding: .utf8)

var enabled = true
var part1 = 0
var part2 = 0
for match in fileContents.matches(of: /do\(\)|don't\(\)|mul\((\d+),(\d+)\)/) {
    if match.output.0 == "do()" {
        enabled = true
    } else if match.output.0 == "don't()" {
        enabled = false
    } else if let a = match.output.1, let b = match.output.2 {
        let product = Int(a)! * Int(b)!
        part1 += product
        part2 += enabled ? product : 0
    }
}

print("Part 1:", part1)
print("Part 2:", part2)
