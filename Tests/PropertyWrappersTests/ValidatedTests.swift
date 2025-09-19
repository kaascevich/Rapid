// SPDX-FileCopyrightText: 2024 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

import TestHelpers
import Testing

@testable import Rapid

@Suite struct ValidatedTests {
  /// The `@Validated` property wrapper only allows mutations if they pass
  /// validation.
  @Test func `@Validated`() {
    @Validated(if: (5...10).contains) var value = 7

    value = 29
    #expect(value == 7)

    value = 9
    #expect(value == 9)
  }

  /// The `@Validated` property wrapper traps if the initial value is not valid.
  @Test(.tags(.traps)) func `@Validated <- invalid`() async {
    await #expect(processExitsWith: .failure) {
      @Validated(if: (5...10).contains) var value = 3
    }
  }
}
