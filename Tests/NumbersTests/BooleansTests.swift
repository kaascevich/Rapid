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

@Suite struct BooleansTests {
  /// The `asInt` property is `1` if the value is `true`, `0` otherwise.
  @Test("asInt")
  func asInt() {
    #expect(true.asInt == 1)
    #expect(false.asInt == 0)
  }

  /// The `init(fromInt:)` initializer returns `false` if the value is `0`,
  /// `true` otherwise.
  @Test("init(fromInt:)")
  func initFromInt() {
    #expect(Bool(fromInt: 0) == false)
    #expect(Bool(fromInt: 1) == true)
    #expect(Bool(fromInt: 42) == true)
    #expect(Bool(fromInt: -1) == true)
  }
}
