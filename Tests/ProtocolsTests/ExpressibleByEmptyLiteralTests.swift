// Copyright © 2024-2025 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

import TestHelpers
import Testing

@testable import Rapid

@Suite struct ExpressibleByEmptyLiteralTests {
  /// The `ExpressibleByEmptyArrayLiteral` protocol only allows initialization
  /// with an empty literal.
  @Test("ExpressibleByEmptyArrayLiteral")
  func expressibleByEmptyArrayLiteral() {
    struct EmptyArrayLiteralMock: ExpressibleByEmptyArrayLiteral {
      init(emptyArrayLiteral _: Void) { }
    }

    // there isn't much we can do beyond this, since we can't really test
    // compile-time guarantees
    let _: EmptyArrayLiteralMock = []
  }

  /// The `ExpressibleByEmptyDictionaryLiteral` protocol only allows
  /// initialization with an empty literal.
  @Test("ExpressibleByEmptyDictionaryLiteral")
  func expressibleByEmptyDictionaryLiteral() {
    struct EmptyDictionaryLiteralMock: ExpressibleByEmptyDictionaryLiteral {
      init(emptyDictionaryLiteral _: Void) { }
    }

    // there isn't much we can do beyond this, since we can't really test
    // compile-time guarantees
    let _: EmptyDictionaryLiteralMock = [:]
  }
}
