// EmptyCollectionConformancesTests.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

import Testing
@testable import Rapid

@Suite struct EmptyCollectionConformancesTests {
  /// `EmptyCollection`'s conformance to `ExpressibleByEmptyArrayLiteral` only
  /// allows an empty literal.
  @Test("EmptyCollection+ExpressibleByEmptyArrayLiteral")
  func emptyCollectionEmptyArrayLiteral() {
    // If this compiles, we're good to go.
    let _: EmptyCollection<Int> = [] // adding an element should throw a compiler error
  }
  
  /// `EmptyCollection`'s conformance to `ExpressibleByEmptyDictionaryLiteral`
  /// only allows an empty literal.
  @Test("EmptyCollection+ExpressibleByEmptyDictionaryLiteral")
  func emptyCollectionEmptyDictionaryLiteral() {
    // If this compiles, we're good to go.
    let _: EmptyCollection<Int> = [:] // adding an element should throw a compiler error
  }
}
