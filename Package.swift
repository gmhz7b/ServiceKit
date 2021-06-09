// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ServiceKit",
    defaultLocalization: "en",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "ServiceKit",
            targets: ["ServiceKit"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/gmhz7b/CommonKit.git",
            from: "1.0.0"
        )
    ],
    targets: [
        .target(
            name: "ServiceKit",
            dependencies: ["CommonKit"],
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "ServiceKitTests",
            dependencies: ["ServiceKit"]
        )
    ]
)
