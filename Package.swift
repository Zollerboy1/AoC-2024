// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AoC-2024",
    platforms: [
        .macOS(.v13)
    ],
    products: (1...25).map {
        .executable(
            name: "Day\($0)",
            targets: ["Day\($0)"]
        )
    },
    dependencies: [
        .package(url: "https://github.com/apple/swift-algorithms.git", from: "1.2.0"),
        .package(url: "https://github.com/apple/swift-async-algorithms.git", from: "1.0.0"),
        .package(url: "https://github.com/apple/swift-collections.git", from: "1.1.4"),
        .package(url: "https://github.com/apple/swift-numerics.git", from: "1.0.2"),
        .package(url: "https://github.com/davecom/SwiftGraph.git", from: "3.1.0"),
        .package(url: "https://github.com/attaswift/BigInt.git", from: "5.5.1"),
    ],
    targets: [
        .target(name: "Helpers")
    ]
        + (1...25).map {
            .executableTarget(
                name: "Day\($0)",
                dependencies: [
                    .product(name: "Algorithms", package: "swift-algorithms"),
                    .product(name: "AsyncAlgorithms", package: "swift-async-algorithms"),
                    .product(name: "Collections", package: "swift-collections"),
                    .product(name: "Numerics", package: "swift-numerics"),
                    "SwiftGraph",
                    "BigInt",
                    "Helpers",
                ],
                resources: [.copy("Resources/day\($0).txt")]
            )
        }
)
