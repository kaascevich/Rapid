// AliasesTests.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

import Testing
@testable import Rapid

@Suite struct AliasesTests {
  /// The `≠(_:_:)` operator returns `true` if the values are not equal,
  /// `false` otherwise.
  @Test("≠(_:_:)") func notEqual() {
    #expect(8 ≠ 4)
    #expect("hi" ≠ "bye")
    
    #expect(!(8 ≠ 8))
    #expect(!("hi" ≠ "hi"))
  }
  
  /// The `≤(_:_:)` operator returns `true` if the first value is less than or
  /// equal to the second, `false` otherwise.
  @Test("≤(_:_:)") func lessThanOrEqualTo() {
    #expect(42 ≤ 69)
    #expect("a" ≤ "b")
    
    #expect(42 ≤ 42)
    #expect("a" ≤ "a")
    
    #expect(!(69 ≤ 42))
    #expect(!("b" ≤ "a"))
  }
  
  /// The `≥(_:_:)` operator returns `true` if the first value is greater than
  /// or equal to the second, `false` otherwise.
  @Test("≥(_:_:)") func greaterThanOrEqualTo() {
    #expect(69 ≥ 42)
    #expect("b" ≥ "a")
    
    #expect(42 ≥ 42)
    #expect("a" ≥ "a")
    
    #expect(!(42 ≥ 69))
    #expect(!("a" ≥ "b"))
  }
}
