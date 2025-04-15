// This file is part of Rapid.
// Copyright © 2024-2025 Kaleb A. Ascevich
//
// Rapid is free software: you can redistribute it and/or modify it under the
// terms of the GNU Affero General Public License (GNU AGPL) as published by the
// Free Software Foundation, either version 3 of the License, or (at your
// option) any later version.
//
// Rapid is distributed in the hope that it will be useful, but WITHOUT ANY
// WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
// A PARTICULAR PURPOSE. See the GNU AGPL for more details.
//
// You should have received a copy of the GNU AGPL along with Rapid. If not, see
// <https://www.gnu.org/licenses/>.

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
