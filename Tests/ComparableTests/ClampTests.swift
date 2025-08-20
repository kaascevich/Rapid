// Copyright © 2024-2025 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

import TestHelpers
import Testing

@testable import Rapid

@Suite enum ClampTests {
  @Suite struct ClampedToTests {
    /// The `clamped(to:)` method returns the value if it is in the given range.
    @Test("clamped(to:) <- in range")
    func clampedToInRange() {
      #expect(7.clamped(to: 6...12) == 7)
      #expect("G".clamped(to: "A"..."Z") == "G")
      #expect(0.32.clamped(to: 0.31...0.33) == 0.32)
    }

    /// The `clamped(to:)` method clamps the value if it is not in the given
    /// range.
    @Test("clamped(to:) <- not in range")
    func clampedToNotInRange() {
      #expect(1.clamped(to: 5...7) == 5)
      #expect("f".clamped(to: "a"..."d") == "d")
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

      var capitalG: Character = "G"
      capitalG.clamp(to: "A"..."Z")
      #expect(capitalG == "G")

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
