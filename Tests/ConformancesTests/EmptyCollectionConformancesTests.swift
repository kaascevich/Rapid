// Copyright © 2024-2025 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

import TestHelpers
import Testing

@testable import Rapid

@Suite struct EmptyCollectionConformancesTests {
  /// `EmptyCollection`'s conformance to `ExpressibleByEmptyArrayLiteral` only
  /// allows an empty literal.
  @Test("EmptyCollection+ExpressibleByEmptyArrayLiteral")
  func emptyCollectionEmptyArrayLiteral() {
    // If this compiles, we're good to go.
    let _: EmptyCollection<Int> = []  // adding an element should throw a compiler error
  }

  /// `EmptyCollection`'s conformance to `ExpressibleByEmptyDictionaryLiteral`
  /// only allows an empty literal.
  @Test("EmptyCollection+ExpressibleByEmptyDictionaryLiteral")
  func emptyCollectionEmptyDictionaryLiteral() {
    // If this compiles, we're good to go.
    let _: EmptyCollection<Int> = [:]  // adding an element should throw a compiler error
  }
}
