import Foundation
import Helpers

let url = Bundle.module.url(forResource: "day4", withExtension: "txt")!
let fileContents = try! String(contentsOf: url, encoding: .utf8)

let lines = Array(fileContents).split(separator: "\n").map(Array.init)

var count1 = 0
for (y, line) in lines.enumerated() {
    for x in 0..<line.count {
        if x + 3 < line.count {
            let string = String([lines[y][x], lines[y][x + 1], lines[y][x + 2], lines[y][x + 3]])
            if string == "XMAS" || string == "SAMX" {
                count1 += 1
            }

            if y + 3 < lines.count {
                let string = String([lines[y][x], lines[y + 1][x + 1], lines[y + 2][x + 2], lines[y + 3][x + 3]])
                if string == "XMAS" || string == "SAMX" {
                    count1 += 1
                }
            }
        }

        if y + 3 < lines.count {
            let string = String([lines[y][x], lines[y + 1][x], lines[y + 2][x], lines[y + 3][x]])
            if string == "XMAS" || string == "SAMX" {
                count1 += 1
            }

            if x - 3 >= 0 {
                let string = String([lines[y][x], lines[y + 1][x - 1], lines[y + 2][x - 2], lines[y + 3][x - 3]])
                if string == "XMAS" || string == "SAMX" {
                    count1 += 1
                }
            }
        }
    }
}

print("Part 1:", count1)

var count2 = 0
for (y, line) in lines.dropLast(2).enumerated() {
    for x in 0..<(line.count - 2) {
        let string = String([lines[y][x], lines[y][x + 2], lines[y + 1][x + 1], lines[y + 2][x], lines[y + 2][x + 2]])
        if string == "MMASS" || string == "SMASM" || string == "MSAMS" || string == "SSAMM" {
            count2 += 1
        }
    }
}

print("Part 2:", count2)
