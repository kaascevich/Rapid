// SPDX-FileCopyrightText: 2024 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

import TestHelpers
import Testing

@testable import Rapid

@Suite struct FactorialsTests {
  /// The `factorial()` method returns the value's factorial.
  @Test func `factorial()`() {
    #expect(6.factorial() == 720)
  }

  /// The `factorial()` method returns `1` when the value is `0`.
  @Test func `factorial() <- 0`() {
    #expect(0.factorial() == 1)
  }

  /// The `factorial()` method asserts when the value is negative.
  @Test(.tags(.traps)) func `factorial() <- negative`() async {
    await #expect(processExitsWith: .failure) {
      _ = (-4).factorial()
    }
  }
}
