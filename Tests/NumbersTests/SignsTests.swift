// Copyright © 2024-2025 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

import TestHelpers
import Testing

@testable import Rapid

@Suite struct SignsTests {
  /// The `isPositive` property is `true` if the value is positive, and `false`
  /// otherwise.
  @Test("isPositive", arguments: [
    42: true,
    -69: false,
    0: false,
  ])
  func isPositive(number: Int, expected: Bool) {
    #expect(number.isPositive == expected)
  }

  /// The `isNegative` property is `true` if the value is negative, and `false`
  /// otherwise.
  @Test("isNegative", arguments: [
    42: false,
    -69: true,
    0: false,
  ])
  func isNegative(number: Int, expected: Bool) {
    #expect(number.isNegative == expected)
  }

  /// The `absoluteValue` property is the value itself when the value is
  /// positive or zero, and its additive inverse when it is negative.
  @Test("absoluteValue", arguments: [
    42: 42,
    -69: 69,
    0: 0,
  ])
  func absoluteValue(number: Int, expected: Int) {
    #expect(number.absoluteValue == expected)
  }
}
