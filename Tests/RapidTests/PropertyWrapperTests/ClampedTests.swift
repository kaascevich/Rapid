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

@Suite struct ClampedTests {
  /// The `@Clamped` property wrapper clamps the value to the given range.
  @Test("@Clamped") func clamped() {
    @Clamped(to: 3...15) var value = 7

    value = 22
    #expect(value == 15)

    value = -4
    #expect(value == 3)

    value = 9
    #expect(value == 9)
  }
}
