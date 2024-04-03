// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "Simple",
    dependencies: [
        .package(name: "sw-average", path: "../..")
    ],
    targets: [
        .executableTarget(
            name: "Simple",
            dependencies: [
                "sw-average"
            ]
        )
    ]
)
