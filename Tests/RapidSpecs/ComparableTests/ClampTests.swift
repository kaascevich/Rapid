// ClampTests.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

import Testing
@testable import Rapid

@Suite struct ClampTests {
  @Suite struct ClampedToTests {
    /// The `clamped(to:)` method returns the value if it is in the given
    /// range.
    @Test("clamped(to:) <- in range") func clampedToInRange() {
      #expect(7.clamped(to: 6...12) == 7)
      #expect(0.32.clamped(to: 0.31...0.33) == 0.32)
    }
    
    /// The `clamped(to:)` method clamps the value if it is not in the given
    /// range.
    @Test("clamped(to:) <- not in range") func clampedToNotInRange() {
      #expect(1.clamped(to: 5...7) == 5)
      #expect("e".clamped(to: "a"..."d") == "d")
    }
  }
  
  @Suite struct ClampToTests {
    /// The `clamp(to:)` method does not change the value if it is in the given
    /// range.
    @Test("clamp(to:) <- in range") func clampToInRange() {
      var seven = 7
      seven.clamp(to: 6...12)
      #expect(seven == 7)
      
      var point32 = 0.32
      point32.clamp(to: 0.31...0.33)
      #expect(point32 == 0.32)
    }
    
    /// The `clamp(to:)` method clamps the value if it is not in the given
    /// range.
    @Test("clamp(to:) <- not in range") func clampToNotInRange() {
      var one = 1
      one.clamp(to: 5...7)
      #expect(one == 5)
      
      var e = "e"
      e.clamp(to: "a"..."d")
      #expect(e == "d")
    }
  }
}
