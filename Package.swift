// swift-tools-version:5.1

/**
*  Ink
*  Copyright (c) John Sundell 2019
*  MIT license, see LICENSE file for details
*/

import PackageDescription

let package = Package(
    name: "Ink",
    products: [
        .library(name: "Ink", targets: ["Ink"]),
        .executable(name: "ink-cli", targets: ["InkCLI"]),
        .executable(name: "CMTestGenerator", targets: ["CMTestGenerator"])
    ],
    dependencies: [
        .package(url: "https://github.com/scinfu/SwiftSoup.git", from: "2.0.0")
    ],
    targets: [
        .target(name: "Ink"),
        .target(name: "InkCLI", dependencies: ["Ink"]),
        .target(name: "CMTestGenerator", dependencies: []),
        .testTarget(name: "InkTests", dependencies: ["Ink"]),
        .testTarget(name: "CommonMarkTests", dependencies: ["Ink", "SwiftSoup"])
    ]
)
