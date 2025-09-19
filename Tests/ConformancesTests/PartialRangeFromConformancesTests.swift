// SPDX-FileCopyrightText: 2024 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

import TestHelpers
import Testing

@testable import Rapid

@Suite struct PartialRangeFromConformancesTests {
  let range: PartialRangeFrom = 5...

  /// `PartialRangeFrom` conforms to `Equatable`.
  @Test func `PartialRangeFrom+Equatable`() {
    #expect(range == 5...)
  }

  /// `PartialRangeFrom` conforms to `Hashable`.
  @Test func `PartialRangeFrom+Hashable`() {
    #expect(range.hashValue == 5.hashValue)
  }

  /// `PartialRangeFrom` conforms to `CustomStringConvertible`.
  @Test func `PartialRangeFrom+CustomStringConvertible`() {
    #expect(String(describing: range) == "5...")
  }

  /// `PartialRangeFrom` conforms to `CustomDebugStringConvertible`.
  @Test func `PartialRangeFrom+CustomDebugStringConvertible`() {
    #expect(String(reflecting: range) == "PartialRangeFrom(5...)")
  }

  /// `PartialRangeFrom` conforms to `CustomReflectable`.
  @Test func `PartialRangeFrom+CustomReflectable`() {
    let mirror = Mirror(reflecting: range)
    #expect(mirror.children.first?.label == "lowerBound")
    #expect(mirror.children.first?.value as? Int == 5)
  }
}
