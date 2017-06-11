import PackageDescription

let package = Package(
    name: "serversideswift.racing",
    targets: [
        Target(name: "App"),
        Target(name: "Run", dependencies: ["App"]),
    ],
    dependencies: [
        .Package(url: "https://github.com/vapor/vapor.git", majorVersion: 2),
        .Package(url: "https://github.com/vapor/fluent-provider.git", majorVersion: 1),
	.Package(url: "https://github.com/vapor/leaf-provider.git", majorVersion: 1),
	.Package(url: "https://github.com/vapor/postgresql-provider.git", majorVersion: 2),
	.Package(url: "https://github.com/BrettRToomey/Jobs.git", Version(1,0,0, prereleaseIdentifiers: ["beta"])),
	.Package(url: "https://github.com/scinfu/SwiftSoup.git", majorVersion: 1)
    ],
    exclude: [
        "Config",
        "Database",
        "Localization",
        "Public",
        "Resources",
    ]
)

