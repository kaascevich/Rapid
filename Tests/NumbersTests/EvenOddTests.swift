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

@Suite struct EvenOddTests {
  /// The `isEven` property is `true` if the value is even or zero, and
  /// `false` otherwise.
  @Test("isEven", arguments: [
    6: true,
    -6: true,
    0: true,
    3: false,
    -3: false,
  ])
  func isEven(number: Int, expected: Bool) {
    #expect(number.isEven == expected)
  }

  /// The `isOdd` property is `true` if the value is odd, and `false` otherwise.
  @Test("isOdd", arguments: [
    3: true,
    -3: true,
    6: false,
    -6: false,
    0: false,
  ])
  func isOdd(number: Int, expected: Bool) {
    #expect(number.isOdd == expected)
  }
}
