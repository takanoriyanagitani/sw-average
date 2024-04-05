// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "benchmarks",
    dependencies: [
        .package(path: "../"),
        .package(url: "https://github.com/ordo-one/package-benchmark", .upToNextMajor(from: "1.22.4"))
    ],
    targets: [
        .executableTarget(
            name: "BenchmarkAverage",
            dependencies: [
                .product(name: "Benchmark", package: "package-benchmark"),
                "sw-average",
            ],
            path: "Benchmarks/BenchmarkAverage",
            plugins: [
                .plugin(name: "BenchmarkPlugin", package: "package-benchmark")
            ]
        ),
    ]
)
