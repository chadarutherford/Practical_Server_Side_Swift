// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "myProject",
    platforms: [
       .macOS(.v12)
    ],
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "4.54.0"),
        .package(url: "https://github.com/vapor/fluent", from: "4.4.0"),
        .package(url: "https://github.com/vapor/fluent-sqlite-driver", from: "4.1.0"),
        .package(url: "https://github.com/binarybirds/liquid", from: "1.3.0"),
        .package(url: "https://github.com/binarybirds/liquid-local-driver", from: "1.3.0"),
        .package(url: "https://github.com/binarybirds/swift-html", from: "1.2.0")
    ],
    targets: [
        .target(
            name: "App",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "Fluent", package: "fluent"),
                .product(name: "FluentSQLiteDriver", package: "fluent-sqlite-driver"),
                .product(name: "Liquid", package: "liquid"),
                .product(name: "LiquidLocalDriver", package: "liquid-local-driver"),
                .product(name: "SwiftHtml", package: "swift-html"),
                .product(name: "SwiftSvg", package: "swift-html"),
            ],
            swiftSettings: [
                // Enable better optimizations when building in Release configuration. Despite the use of
                // the `.unsafeFlags` construct required by SwiftPM, this flag is recommended for Release
                // builds. See <https://github.com/swift-server/guides/blob/main/docs/building.md#building-for-production> for details.
                .unsafeFlags(["-cross-module-optimization"], .when(configuration: .release))
            ]
        ),
        .executableTarget(name: "Run", dependencies: [.target(name: "App")]),
        .testTarget(name: "AppTests", dependencies: [
            .target(name: "App"),
            .product(name: "XCTVapor", package: "vapor"),
        ])
    ]
)
