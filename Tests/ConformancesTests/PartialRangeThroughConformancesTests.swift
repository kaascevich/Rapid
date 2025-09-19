// SPDX-FileCopyrightText: 2024 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

import TestHelpers
import Testing

@testable import Rapid

@Suite struct PartialRangeThroughConformancesTests {
  let range: PartialRangeThrough = ...5

  /// `PartialRangeThrough` conforms to `Equatable`.
  @Test func `PartialRangeThrough+Equatable`() {
    #expect(range == ...5)
  }

  /// `PartialRangeThrough` conforms to `Hashable`.
  @Test func `PartialRangeThrough+Hashable`() {
    #expect(range.hashValue == 5.hashValue)
  }

  /// `PartialRangeThrough` conforms to `CustomStringConvertible`.
  @Test func `PartialRangeThrough+CustomStringConvertible`() {
    #expect(String(describing: range) == "...5")
  }

  /// `PartialRangeThrough` conforms to `CustomDebugStringConvertible`.
  @Test func `PartialRangeThrough+CustomDebugStringConvertible`() {
    #expect(String(reflecting: range) == "PartialRangeThrough(...5)")
  }

  /// `PartialRangeThrough` conforms to `CustomReflectable`.
  @Test func `PartialRangeThrough+CustomReflectable`() {
    let mirror = Mirror(reflecting: range)
    #expect(mirror.children.first?.label == "upperBound")
    #expect(mirror.children.first?.value as? Int == 5)
  }
}
