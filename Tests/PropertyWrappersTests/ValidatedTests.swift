// Copyright © 2024-2025 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

import TestHelpers
import Testing

@testable import Rapid

@Suite struct ValidatedTests {
  /// The `@Validated` property wrapper only allows mutations if they pass
  /// validation.
  @Test("@Validated")
  func validated() {
    @Validated(if: (5...10).contains) var value = 7

    value = 29
    #expect(value == 7)

    value = 9
    #expect(value == 9)
  }

  /// The `@Validated` property wrapper traps if the initial value is not valid.
  @Test("@Validated <- invalid", .tags(.traps))
  func validatedInvalid() async {
    await #expect(crashes {
      @Validated(if: (5...10).contains) var value = 3
    })
  }
}
