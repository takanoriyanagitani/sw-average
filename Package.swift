// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "sw-average",
    products: [
        .library(
            name: "sw-average",
            targets: ["sw-average"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.3.0")
    ],
    targets: [
        .target(
            name: "sw-average"),
        .testTarget(
            name: "sw-averageTests",
            dependencies: ["sw-average"]),
    ]
)
