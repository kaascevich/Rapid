// ValidatedTests.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

import Testing
@testable import Rapid

@Suite struct ValidatedTests {
  /// The `@Validated` property wrapper only allows mutations if they pass
  /// validation.
  @Test("@Validated") func validated() {
    func isInRange(value: Int) -> Bool {
      (5...10).contains(value)
    }
    
    @Validated(if: isInRange) var value = 7
    
    value = 29
    #expect(value == 7)
    
    value = 9
    #expect(value == 9)
  }
}
