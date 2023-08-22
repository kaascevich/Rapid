// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

// Package.swift
// Copyright © 2023 Kaleb A. Ascevich
//
// This package is free software: you can redistribute it and/or modify it
// under the terms of the GNU General Public License as published by the
// Free Software Foundation, either version 3 of the License, or (at your
// option) any later version.
//
// This package is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
// FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
// for more details.
//
// You should have received a copy of the GNU General Public License along
// with this package. If not, see https://www.gnu.org/licenses/.

import PackageDescription

let package = Package(
    name: "Rapid",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .watchOS(.v6),
        .tvOS(.v13),
        .macCatalyst(.v13),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: "Rapid",
            targets: [
                "Rapid"
            ]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/lukepistrol/SwiftLintPlugin.git",
            .upToNextMajor(from: Version(0, 52, 4))
        ),
        .package(
            url: "https://github.com/Quick/Quick.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/Quick/Nimble.git",
            from: Version(12, 0, 0)
        ),
        .package(
            url: "https://github.com/apple/swift-docc-plugin",
            from: Version(1, 0, 0)
        )
    ],
    targets: [
        .target(
            name: "Rapid",
            plugins: [
                .plugin(
                    name: "SwiftLint",
                    package: "SwiftLintPlugin"
                )
            ]
        ),
        .testTarget(
            name: "RapidSpecs",
            dependencies: [
                .target(
                    name: "Rapid"
                ),
                .product(
                    name: "Quick",
                    package: "Quick"
                ),
                .product(
                    name: "Nimble",
                    package: "Nimble"
                )
            ],
            plugins: [
                .plugin(
                    name: "SwiftLint",
                    package: "SwiftLintPlugin"
                )
            ]
        )
    ]
)
