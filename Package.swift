// swift-tools-version: 6.1

// Copyright © 2024-2025 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

import PackageDescription

let targets = [
  "Closures",
  "Comparable",
  "Conformances",
  "Functional",
  "Numbers",
  "Operators",
  "Optionals",
  "PatternMatching",
  "PropertyWrappers",
  "Protocols",
  "ResultBuilders",
  "Sequences",
  "Strings",
  "Time",
  "TypeErasure",
]

func rapidTestTarget(_ name: String) -> Target {
  .testTarget(
    name: "\(name)Tests",
    dependencies: ["Rapid", "TestHelpers"],
  )
}

let package = Package(
  name: "Rapid",
  platforms: [
    .macOS(.v10_15),
    .iOS(.v13),
    .watchOS(.v6),
    .tvOS(.v13),
    .macCatalyst(.v13),
    .visionOS(.v1),
  ],
  products: [
    .library(name: "Rapid", targets: ["Rapid"]),
  ],
  dependencies: [
    .package(
      url: "https://github.com/mattgallagher/CwlPreconditionTesting.git",
      from: "2.2.2",
    ),
    .package(
      url: "https://github.com/swiftlang/swift-docc-plugin",
      from: "1.4.3",
    ),
  ],
  targets: targets.map(rapidTestTarget) + [
    .target(
      name: "Rapid",
      swiftSettings: [.enableExperimentalFeature("LifetimeDependence")],
    ),
    .target(name: "TestHelpers", dependencies: ["CwlPreconditionTesting"]),
  ],
)
