// swift-tools-version: 6.0

// Package.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

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
    .library(name: "Rapid", targets: ["Rapid"])
  ],
  dependencies: [
    .package(
      url: "https://github.com/apple/swift-testing.git",
      branch: "main"
    )
  ],
  targets: [
    .target(name: "Rapid"),
    .testTarget(
      name: "RapidSpecs",
      dependencies: [
        "Rapid",
        .product(name: "Testing", package: "swift-testing")
      ]
    )
  ]
)

