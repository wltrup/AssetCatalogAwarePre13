// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AssetCatalogAwarePre13",
    platforms: [
        .iOS(.v11),
        .watchOS(.v4),
        .tvOS(.v11)
    ],
    products: [
        .library(
            name: "AssetCatalogAwarePre13",
            targets: ["AssetCatalogAwarePre13"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "AssetCatalogAwarePre13",
            dependencies: []),
    ]
)
