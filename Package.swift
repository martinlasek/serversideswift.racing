// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "serversideswift.racing",
    products: [
      .library(name: "App", targets: ["App"]),
      .executable(name: "Run", targets: ["Run"])
    ],
    dependencies: [
      .package(url: "https://github.com/vapor/vapor.git", .upToNextMajor(from: "2.1.0")),
      .package(url: "https://github.com/vapor/fluent-provider.git", .upToNextMajor(from: "1.3.0")),
      .package(url: "https://github.com/vapor/postgresql-provider.git", .upToNextMajor(from: "2.1.0")),
      .package(url: "https://github.com/BrettRToomey/Jobs.git", .upToNextMajor(from: "1.1.2")),
      .package(url: "https://github.com/scinfu/SwiftSoup.git", .upToNextMajor(from: "1.5.9"))
    ],
    targets: [
      .target(name: "App", dependencies: ["Vapor", "FluentProvider", "PostgreSQLProvider", "Jobs", "SwiftSoup"],
        exclude: [
          "Config",
          "Public",
          "Resources",
        ]
      ),
      .target(name: "Run", dependencies: ["App"]),
      .testTarget(name: "AppTests", dependencies: ["App", "Testing"])
    ]
)

