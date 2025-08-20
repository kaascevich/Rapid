// Copyright © 2024-2025 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

import TestHelpers
import Testing

@testable import Rapid

@Suite struct PartialRangeThroughConformancesTests {
  let range: PartialRangeThrough = ...5

  /// `PartialRangeThrough` conforms to `Equatable`.
  @Test("PartialRangeThrough+Equatable")
  func partialRangeThroughEquatable() {
    #expect(range == ...5)
  }

  /// `PartialRangeThrough` conforms to `Hashable`.
  @Test("PartialRangeThrough+Hashable")
  func partialRangeThroughHashable() {
    #expect(range.hashValue == 5.hashValue)
  }

  /// `PartialRangeThrough` conforms to `CustomStringConvertible`.
  @Test("PartialRangeThrough+CustomStringConvertible")
  func partialRangeThroughCustomStringConvertible() {
    #expect(String(describing: range) == "...5")
  }

  /// `PartialRangeThrough` conforms to `CustomDebugStringConvertible`.
  @Test("PartialRangeThrough+CustomDebugStringConvertible")
  func partialRangeThroughCustomDebugStringConvertible() {
    #expect(String(reflecting: range) == "PartialRangeThrough(...5)")
  }

  /// `PartialRangeThrough` conforms to `CustomReflectable`.
  @Test("PartialRangeThrough+CustomReflectable")
  func partialRangeThroughCustomReflectable() {
    let mirror = Mirror(reflecting: range)
    #expect(mirror.children.first?.label == "upperBound")
    #expect(mirror.children.first?.value as? Int == 5)
  }
}
