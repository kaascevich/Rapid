// FactorialsTests.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

import CwlPreconditionTesting
import Testing
@testable import Rapid

@Suite struct FactorialsTests {
  /// The `factorial()` method returns the value's factorial.
  @Test("factorial()") func factorial() {
    #expect(6.factorial() == 720)
  }
  
  /// The `factorial()` method returns `1` when the value is `0`.
  @Test("factorial() <- 0") func factorialZero() {
    #expect(0.factorial() == 1)
  }
  
  /// The `factorial()` method asserts when the value is negative.
  @Test("factorial() <- negative") func factorialNegative() {
    #expect(catchBadInstruction { _ = (-4).factorial() } != nil)
  }
}
