// SPDX-FileCopyrightText: 2024 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

import TestHelpers
import Testing

@testable import Rapid

@Suite struct ExpressibleByEmptyLiteralTests {
  /// The `ExpressibleByEmptyArrayLiteral` protocol only allows initialization
  /// with an empty literal.
  @Test func `ExpressibleByEmptyArrayLiteral`() {
    struct EmptyArrayLiteralMock: ExpressibleByEmptyArrayLiteral {
      init(emptyArrayLiteral _: Void) {}
    }

    let _: EmptyArrayLiteralMock = []
    #expect(EmptyArrayLiteralMock.ArrayLiteralElement.self == Never.self)
  }

  /// The `ExpressibleByEmptyDictionaryLiteral` protocol only allows
  /// initialization with an empty literal.
  @Test func `ExpressibleByEmptyDictionaryLiteral`() {
    struct EmptyDictionaryLiteralMock: ExpressibleByEmptyDictionaryLiteral {
      init(emptyDictionaryLiteral _: Void) {}
    }

    // there isn't much we can do beyond this, since we can't really test
    // compile-time guarantees
    let _: EmptyDictionaryLiteralMock = [:]
    #expect(EmptyDictionaryLiteralMock.Key.self == Never.self)
    #expect(EmptyDictionaryLiteralMock.Value.self == Never.self)
  }
}
