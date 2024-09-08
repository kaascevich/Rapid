// SwapTests.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

import Testing
@testable import Rapid

@Suite struct SwapTests {
  /// The `<=>` operator swaps two values.
  @Test("<=>(_:_:)") func swap() {
    var fortyTwo = 42
    var sixtyNine = 69
    fortyTwo <=> sixtyNine
    
    #expect(fortyTwo == 69)
    #expect(sixtyNine == 42)
  }
}
