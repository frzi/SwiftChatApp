// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ChatServer",
	platforms: [
		.macOS(.v10_15),
	],
	products: [
		.executable(name: "ChatServer", targets: ["ChatServer"])
	],
    dependencies: [
		.package(url: "https://github.com/vapor/vapor.git", from: "4.0.0")
    ],
    targets: [
        .target(
            name: "ChatServer",
            dependencies: [
				.product(name: "Vapor", package: "vapor")
			]),
    ]
)
