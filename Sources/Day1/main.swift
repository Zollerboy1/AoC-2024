import Foundation
import Helpers

let url = Bundle.module.url(forResource: "day1", withExtension: "txt")!
let fileContents = try! String(contentsOf: url, encoding: .utf8)

let lines = fileContents.split(separator: "\n")

let numbers = lines.compactMap { $0.wholeMatch(of: /(\d+)\s+(\d+)/).map { (Int($0.output.1)!, Int($0.output.2)!) } }

let first = numbers.map { $0.0 }
let second = numbers.map { $0.1 }

let firstSorted = first.sorted()
let secondSorted = second.sorted()

print("Part 1:", zip(firstSorted, secondSorted).map { abs($0.0 - $0.1) }.sum())

let secondMap = secondSorted.reduce(into: [:]) {
    $0[$1] = $0[$1, default: 0] + 1
}

print("Part 2:", first.map { $0 * secondMap[$0, default: 0] }.sum())
