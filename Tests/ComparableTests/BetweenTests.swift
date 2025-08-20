// Copyright © 2024-2025 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

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
