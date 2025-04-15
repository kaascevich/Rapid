// swift-tools-version: 6.1

// This file is part of Rapid.
// Copyright © 2024-2025 Kaleb A. Ascevich
//
// Rapid is free software: you can redistribute it and/or modify it under the
// terms of the GNU Affero General Public License (GNU AGPL) as published by the
// Free Software Foundation, either version 3 of the License, or (at your
// option) any later version.
//
// Rapid is distributed in the hope that it will be useful, but WITHOUT ANY
// WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
// A PARTICULAR PURPOSE. See the GNU AGPL for more details.
//
// You should have received a copy of the GNU AGPL along with Rapid. If not, see
// <https://www.gnu.org/licenses/>.

import PackageDescription

let targets = [
  "Closures",
  "Comparable",
  "Conformances",
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
    .target(name: "Rapid"),
    .target(name: "TestHelpers", dependencies: ["CwlPreconditionTesting"]),
  ],
)
