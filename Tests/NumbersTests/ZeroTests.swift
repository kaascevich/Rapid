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

@Suite struct ZeroTests {
  /// The `isZero` property is `true` is the value is zero, and `false`
  /// otherwise.
  @Test("isZero", arguments: [
    0: true,
    5: false,
    -5: false,
  ])
  func isZero(number: Int, expected: Bool) {
    #expect(number.isZero == expected)
  }

  /// The `isNonzero` property is `true` is the value is positive or negative,
  /// and `false` otherwise.
  @Test("isNonzero", arguments: [
    0: false,
    5: true,
    -5: true,
  ])
  func isNonzero(number: Int, expected: Bool) {
    #expect(number.isNonzero == expected)
  }
}
