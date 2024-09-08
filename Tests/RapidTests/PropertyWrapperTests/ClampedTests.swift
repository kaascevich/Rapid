// ClampedTests.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

import Testing
@testable import Rapid

@Suite struct ClampedTests {
  /// The `@Clamped` property wrapper clamps the value to the given range.
  @Test("@Clamped") func clamped() {
    @Clamped(to: 3...15) var value = 7
    
    value = 22
    #expect(value == 15)
    
    value = -4
    #expect(value == 3)
    
    value = 9
    #expect(value == 9)
  }
}
