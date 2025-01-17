// swift-tools-version:5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let swift6UpcomingFeatures: [SwiftSetting] = [
    .enableUpcomingFeature("BareSlashRegexLiterals"),
    .enableUpcomingFeature("ConciseMagicFile"),
    .enableUpcomingFeature("DeprecateApplicationMain"),
    .enableUpcomingFeature("DisableOutwardActorInference"),
    .enableUpcomingFeature("DynamicActorIsolation"),
    .enableUpcomingFeature("ForwardTrailingClosures"),
    .enableUpcomingFeature("GlobalActorIsolatedTypesUsability"),
    .enableUpcomingFeature("GlobalConcurrency"),
    .enableUpcomingFeature("ImplicitOpenExistentials"),
    .enableUpcomingFeature("ImportObjcForwardDeclarations"),
    .enableUpcomingFeature("InferSendableFromCaptures"),
    .enableUpcomingFeature("IsolatedDefaultValues"),
    .enableUpcomingFeature("NonfrozenEnumExhaustivity"),
    .enableUpcomingFeature("RegionBasedIsolation"),
    .enableUpcomingFeature("StrictConcurrency"),
]
let swift7UpcomingFeatures: [SwiftSetting] = [
    .enableUpcomingFeature("ExistentialAny"),
    .enableUpcomingFeature("InternalImportsByDefault"),
]

let package = Package(
    name: "CreateAPI",
    platforms: [.macOS(.v10_15)],
    products: [
        .executable(name: "create-api", targets: ["create-api"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.1.3"),
        .package(url: "https://github.com/liamnichols/swift-configuration-parser", from: "0.0.4"),
        .package(url: "https://github.com/CreateAPI/OpenAPIKit", branch: "create-api"),
        .package(url: "https://github.com/CreateAPI/Yams", revision: "d2ebc53afeb2001474dacf81c4480fef114045a1"),
        .package(url: "https://github.com/Cosmo/GrammaticalNumber", from: "0.0.3"),
        .package(url: "https://github.com/eonist/FileWatcher", from: "0.2.0")
    ],
    targets: [
        .executableTarget(
            name: "create-api",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "ConfigurationParser", package: "swift-configuration-parser"),
                .product(name: "OpenAPIKit30", package: "OpenAPIKit"),
                .product(name: "Yams", package: "Yams"),
                .product(name: "GrammaticalNumber", package: "GrammaticalNumber"),
                .product(name: "FileWatcher", package: "FileWatcher", condition: .when(platforms: [.macOS])),
                .target(name: "CreateOptions")
            ],
            path: "Sources/CreateAPI",
            swiftSettings: swift6UpcomingFeatures + swift7UpcomingFeatures
        ),
        .target(
            name: "CreateOptions",
            dependencies: [
                .product(name: "Yams", package: "Yams"),
                .product(name: "ConfigurationParser", package: "swift-configuration-parser")
            ],
            swiftSettings: swift6UpcomingFeatures + swift7UpcomingFeatures
        ),
        .testTarget(
            name: "create-api-tests",
            dependencies: ["create-api"],
            path: "Tests/CreateAPITests",
            swiftSettings: swift6UpcomingFeatures + swift7UpcomingFeatures
        ),
        .testTarget(
            name: "CreateOptionsTests",
            dependencies: ["CreateOptions"],
            swiftSettings: swift6UpcomingFeatures + swift7UpcomingFeatures
        )
    ]
)
