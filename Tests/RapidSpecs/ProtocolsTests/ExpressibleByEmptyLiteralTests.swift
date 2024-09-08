// ExpressibleByEmptyLiteralTests.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

import Testing
@testable import Rapid

@Suite struct ExpressibleByEmptyLiteralTests {
  /// The `ExpressibleByEmptyArrayLiteral` protocol only allows initialization
  /// with an empty literal.
  @Test("ExpressibleByEmptyArrayLiteral")
  func expressibleByEmptyArrayLiteral() {
    struct EmptyArrayLiteralMock: ExpressibleByEmptyArrayLiteral {
      init(emptyArrayLiteral: Nothing) { }
    }
    
    // There isn't much we can do beyond this, since we can't really
    // test compile-time guarantees.
    let _: EmptyArrayLiteralMock = []
  }
  
  /// The `ExpressibleByEmptyDictionaryLiteral` protocol only allows
  /// initialization with an empty literal.
  @Test("ExpressibleByEmptyDictionaryLiteral")
  func expressibleByEmptyDictionaryLiteral() {
    struct EmptyDictionaryLiteralMock: ExpressibleByEmptyDictionaryLiteral {
      init(emptyDictionaryLiteral: Nothing) { }
    }
    
    // There isn't much we can do beyond this, since we can't really
    // test compile-time guarantees.
    let _: EmptyDictionaryLiteralMock = [:]
  }
}
