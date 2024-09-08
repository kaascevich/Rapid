// PowersTests.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

#if canImport(Foundation)

import Testing
@testable import Rapid

@Suite struct PowersTests {
  /// The `**(base:exponent:)` operator raises the first value to the second.
  @Test("**(base:exponent:)") func power() {
    #expect(6 ** 3 == 216)
  }
  
  /// The `**=(base:exponent:)` operator raises the first value to the second
  /// and assigns the result.
  @Test("**=(base:exponent:)") func powerAssignment() {
    var x = 3.0
    x **= 5
    #expect(x == 243)
  }
}

#endif
