// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "MyWebsite",
    platforms: [.macOS(.v12)],
    products: [
        .executable(
            name: "MyWebsite",
            targets: ["MyWebsite"]
        )
    ],
    dependencies: [
        .package(name: "Publish", url: "https://github.com/johnsundell/publish.git", from: "0.8.0"),
        .package(name: "SplashPublishPlugin", url: "https://github.com/johnsundell/splashpublishplugin", from: "0.1.0"),

    ],
    targets: [
        .executableTarget(
            name: "MyWebsite",
            dependencies: ["Publish", "SplashPublishPlugin"]
        )
    ]
)
