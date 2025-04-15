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

@Suite struct BooleansTests {
  /// The `asInt` property is `1` if the value is `true`, `0` otherwise.
  @Test("asInt", arguments: [
    true: 1,
    false: 0,
  ])
  func asInt(value: Bool, expected: Int) {
    #expect(value.asInt == expected)
  }

  /// The `init(fromInt:)` initializer returns `false` if the value is `0`,
  /// `true` otherwise.
  @Test("init(fromInt:)", arguments: [
    0: false,
    1: true,
    42: true,
    -1: true,
  ])
  func initFromInt(value: Int, expected: Bool) {
    #expect(Bool(fromInt: value) == expected)
  }
}
