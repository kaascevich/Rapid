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

import Testing

@testable import Rapid

@Suite struct NilCoalescingTests {
  var didGetDefault = false
  mutating func getDefault() -> Int {
    didGetDefault = true
    return 42
  }

  /// The `??=(optional:defaultValue:)` operator assigns `defaultValue` to
  /// `optional` if `optional` is `nil`.
  @Test("??=(optional:defaultValue:) -> isNil")
  mutating func nilCoalescingAssignmentIsNil() {
    var int: Int? = nil
    int ??= getDefault()

    #expect(int == 42)
    #expect(didGetDefault)
  }

  /// The `??=(optional:defaultValue:)` operator does nothing if `optional` is
  /// not `nil`. `defaultValue` is never evaluated.
  @Test("??=(optional:defaultValue:) -> isNotNil")
  mutating func nilCoalescingAssignmentIsNotNil() {
    var int: Int? = 69
    int ??= getDefault()

    #expect(int == 69)
    #expect(!didGetDefault)
  }
}
