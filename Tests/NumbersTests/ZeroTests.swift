// SPDX-FileCopyrightText: 2024 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

import TestHelpers
import Testing

@testable import Rapid

@Suite struct ZeroTests {
  /// The `isZero` property is `true` is the value is zero, and `false`
  /// otherwise.
  @Test(arguments: [
    0: true,
    5: false,
    -5: false,
  ])
  func `isZero`(number: Int, expected: Bool) {
    #expect(number.isZero == expected)
  }

  /// The `isNonzero` property is `true` is the value is positive or negative,
  /// and `false` otherwise.
  @Test(arguments: [
    0: false,
    5: true,
    -5: true,
  ])
  func `isNonzero`(number: Int, expected: Bool) {
    #expect(number.isNonzero == expected)
  }
}
