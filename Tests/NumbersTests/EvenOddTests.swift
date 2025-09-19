// SPDX-FileCopyrightText: 2024 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

import TestHelpers
import Testing

@testable import Rapid

@Suite struct EvenOddTests {
  /// The `isEven` property is `true` if the value is even or zero, and
  /// `false` otherwise.
  @Test(arguments: [
    6: true,
    -6: true,
    0: true,
    3: false,
    -3: false,
  ])
  func `isEven`(number: Int, expected: Bool) {
    #expect(number.isEven == expected)
  }

  /// The `isOdd` property is `true` if the value is odd, and `false` otherwise.
  @Test(arguments: [
    3: true,
    -3: true,
    6: false,
    -6: false,
    0: false,
  ])
  func `isOdd`(number: Int, expected: Bool) {
    #expect(number.isOdd == expected)
  }
}
