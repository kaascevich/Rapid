// Copyright © 2024-2025 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

import TestHelpers
import Testing

@testable import Rapid

@Suite struct PartialRangeUpToConformancesTests {
  let range: PartialRangeUpTo = ..<5

  /// `PartialRangeUpTo` conforms to `Equatable`.
  @Test("PartialRangeUpTo+Equatable")
  func partialRangeUpToEquatable() {
    #expect(range == ..<5)
  }

  /// `PartialRangeUpTo` conforms to `Hashable`.
  @Test("PartialRangeUpTo+Hashable")
  func partialRangeUpToHashable() {
    #expect(range.hashValue == 5.hashValue)
  }

  /// `PartialRangeUpTo` conforms to `CustomStringConvertible`.
  @Test("PartialRangeUpTo+CustomStringConvertible")
  func partialRangeUpToCustomStringConvertible() {
    #expect(String(describing: range) == "..<5")
  }

  /// `PartialRangeUpTo` conforms to `CustomDebugStringConvertible`.
  @Test("PartialRangeUpTo+CustomDebugStringConvertible")
  func partialRangeUpToCustomDebugStringConvertible() {
    #expect(String(reflecting: range) == "PartialRangeUpTo(..<5)")
  }

  /// `PartialRangeFrom` conforms to `CustomReflectable`.
  @Test("PartialRangeUpTo+CustomReflectable")
  func partialRangeUpToCustomReflectable() {
    let mirror = Mirror(reflecting: range)
    #expect(mirror.children.first?.label == "upperBound")
    #expect(mirror.children.first?.value as? Int == 5)
  }
}
