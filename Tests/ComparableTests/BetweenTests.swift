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

@Suite struct BetweenTests {
  /// The `isBetween(_:)` method returns `true` if the range contains the value.
  @Test("isBetween(_:) -> true")
  func isBetweenTrue() {
    #expect(7.isBetween(6...12))
    #expect("G".isBetween("A"..."Z"))
    #expect(0.32.isBetween(0.31...0.33))
  }

  /// The `isBetween(_:)` method returns `false` if the range does not contain
  /// the value.
  @Test("isBetween(_:) -> false")
  func isBetweenFalse() {
    #expect(!1.isBetween(5...7))
    #expect(!"f".isBetween("a"..."d"))
    #expect(!69.isBetween(42..<69))
  }
}
