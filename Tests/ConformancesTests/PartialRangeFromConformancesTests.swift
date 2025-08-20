// Copyright © 2024-2025 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

import TestHelpers
import Testing

@testable import Rapid

@Suite struct PartialRangeFromConformancesTests {
  let range: PartialRangeFrom = 5...

  /// `PartialRangeFrom` conforms to `Equatable`.
  @Test("PartialRangeFrom+Equatable")
  func partialRangeFromEquatable() {
    #expect(range == 5...)
  }

  /// `PartialRangeFrom` conforms to `Hashable`.
  @Test("PartialRangeFrom+Hashable")
  func partialRangeFromHashable() {
    #expect(range.hashValue == 5.hashValue)
  }

  /// `PartialRangeFrom` conforms to `CustomStringConvertible`.
  @Test("PartialRangeFrom+CustomStringConvertible")
  func partialRangeFromCustomStringConvertible() {
    #expect(String(describing: range) == "5...")
  }

  /// `PartialRangeFrom` conforms to `CustomDebugStringConvertible`.
  @Test("PartialRangeFrom+CustomDebugStringConvertible")
  func partialRangeFromCustomDebugStringConvertible() {
    #expect(String(reflecting: range) == "PartialRangeFrom(5...)")
  }

  /// `PartialRangeFrom` conforms to `CustomReflectable`.
  @Test("PartialRangeFrom+CustomReflectable")
  func partialRangeFromCustomReflectable() {
    let mirror = Mirror(reflecting: range)
    #expect(mirror.children.first?.label == "lowerBound")
    #expect(mirror.children.first?.value as? Int == 5)
  }
}
