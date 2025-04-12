// This file is part of BrainflipKit.
// Copyright © 2024-2025 Kaleb A. Ascevich
//
// BrainflipKit is free software: you can redistribute it and/or modify it under
// the terms of the GNU Affero General Public License (GNU AGPL) as published by
// the Free Software Foundation, either version 3 of the License, or (at your
// option) any later version.
//
// BrainflipKit is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
// FOR A PARTICULAR PURPOSE. See the GNU AGPL for more details.
//
// You should have received a copy of the GNU AGPL along with BrainflipKit. If
// not, see <https://www.gnu.org/licenses/>.

import Testing
@testable import Rapid

@Suite struct BetweenTests {
  /// The `isBetween(_:)` method returns `true` if the range contains the
  /// value.
  @Test("isBetween(_:) -> true") func isBetweenTrue() {
    #expect(7.isBetween(6...12))
    #expect(0.32.isBetween(0.31...0.33))
  }

  /// The `isBetween(_:)` method returns `false` if the range does not contain
  /// the value.
  @Test("isBetween(_:) -> false") func isBetweenFalse() {
    #expect(!1.isBetween(5...7))
    #expect(!"e".isBetween("a"..."d"))
    #expect(!69.isBetween(42..<69))
  }
}
