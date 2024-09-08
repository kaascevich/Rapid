// BetweenTests.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

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
