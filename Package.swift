// swift-tools-version: 6.2

// SPDX-FileCopyrightText: 2024 Kaleb A. Ascevich
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

let swiftFeatures: [SwiftSetting] = [
  "LifetimeDependence",
  "Lifetimes",
].map { .enableExperimentalFeature($0) }

let swiftSettings =
  swiftFeatures + [
    .swiftLanguageMode(.v6),
    .strictMemorySafety(),
  ]

let package = Package(
  name: "Rapid",
  products: [
    .library(name: "Rapid", targets: ["Rapid"])
  ],
  dependencies: [
    .package(
      url: "https://github.com/swiftlang/swift-docc-plugin",
      from: "1.4.3"
    ),
  ],
  targets: [
    .target(
      name: "Rapid",
      swiftSettings: swiftSettings
    ),
    .target(name: "TestHelpers"),
  ],
)

package.targets += targets.map { name in
  .testTarget(
    name: "\(name)Tests",
    dependencies: ["Rapid", "TestHelpers"],
    swiftSettings: swiftSettings
  )
}
