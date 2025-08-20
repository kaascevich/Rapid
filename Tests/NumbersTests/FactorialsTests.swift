// Copyright © 2024-2025 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

import TestHelpers
import Testing

@testable import Rapid

@Suite struct FactorialsTests {
  /// The `factorial()` method returns the value's factorial.
  @Test("factorial()")
  func factorial() {
    #expect(6.factorial() == 720)
  }

  /// The `factorial()` method returns `1` when the value is `0`.
  @Test("factorial() <- 0")
  func factorialZero() {
    #expect(0.factorial() == 1)
  }

  /// The `factorial()` method asserts when the value is negative.
  @Test("factorial() <- negative", .tags(.traps))
  func factorialNegative() async {
    await #expect(crashes {
      _ = (-4).factorial()
    })
  }
}
