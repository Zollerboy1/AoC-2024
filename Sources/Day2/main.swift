import Foundation
import Helpers

let url = Bundle.module.url(forResource: "day2", withExtension: "txt")!
let fileContents = try! String(contentsOf: url, encoding: .utf8)

let reports = fileContents.split(separator: "\n").map { line in
    line.split(separator: " ").map(String.init).compactMap(Int.init)
}

func isSafe(_ report: [Int]) -> Bool {
    let pairs = zip(report, report.dropFirst())

    return pairs.allSatisfy({ $0 < $1 && $0 >= $1 - 3 }) || pairs.allSatisfy({ $0 > $1 && $0 <= $1 + 3 })
}

print("Part 1:", reports.count(where: isSafe))

print(
    "Part 2:",
    reports.count { report in
        for i in 0..<report.count {
            var report = report
            report.remove(at: i)

            if isSafe(report) {
                return true
            }
        }

        return false
    }
)
