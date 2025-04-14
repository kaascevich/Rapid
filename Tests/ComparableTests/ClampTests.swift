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

@Suite enum ClampTests {
  @Suite struct ClampedToTests {
    /// The `clamped(to:)` method returns the value if it is in the given range.
    @Test("clamped(to:) <- in range")
    func clampedToInRange() {
      #expect(7.clamped(to: 6...12) == 7)
      #expect(0.32.clamped(to: 0.31...0.33) == 0.32)
    }

    /// The `clamped(to:)` method clamps the value if it is not in the given
    /// range.
    @Test("clamped(to:) <- not in range")
    func clampedToNotInRange() {
      #expect(1.clamped(to: 5...7) == 5)
      #expect("e".clamped(to: "a"..."d") == "d")
    }
  }

  @Suite struct ClampToTests {
    /// The `clamp(to:)` method does not change the value if it is in the given
    /// range.
    @Test("clamp(to:) <- in range")
    func clampToInRange() {
      var seven = 7
      seven.clamp(to: 6...12)
      #expect(seven == 7)

      var point32 = 0.32
      point32.clamp(to: 0.31...0.33)
      #expect(point32 == 0.32)
    }

    /// The `clamp(to:)` method clamps the value if it is not in the given
    /// range.
    @Test("clamp(to:) <- not in range")
    func clampToNotInRange() {
      var one = 1
      one.clamp(to: 5...7)
      #expect(one == 5)

      var e = "e"
      e.clamp(to: "a"..."d")
      #expect(e == "d")
    }
  }
}
