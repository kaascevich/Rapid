// SPDX-FileCopyrightText: 2024 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

import TestHelpers
import Testing

@testable import Rapid

@Suite struct ClampedTests {
  /// The `@Clamped` property wrapper clamps the value to the given range.
  @Test func `@Clamped`() {
    @Clamped(to: 3...15) var value = 7

    value = 22
    #expect(value == 15)

    value = -4
    #expect(value == 3)

    value = 9
    #expect(value == 9)
  }
}
