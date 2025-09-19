// SPDX-FileCopyrightText: 2024 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

import TestHelpers
import Testing

@testable import Rapid

@Suite struct PartialRangeUpToConformancesTests {
  let range: PartialRangeUpTo = ..<5

  /// `PartialRangeUpTo` conforms to `Equatable`.
  @Test func `PartialRangeUpTo+Equatable`() {
    #expect(range == ..<5)
  }

  /// `PartialRangeUpTo` conforms to `Hashable`.
  @Test func `PartialRangeUpTo+Hashable`() {
    #expect(range.hashValue == 5.hashValue)
  }

  /// `PartialRangeUpTo` conforms to `CustomStringConvertible`.
  @Test func `PartialRangeUpTo+CustomStringConvertible`() {
    #expect(String(describing: range) == "..<5")
  }

  /// `PartialRangeUpTo` conforms to `CustomDebugStringConvertible`.
  @Test func `PartialRangeUpTo+CustomDebugStringConvertible`() {
    #expect(String(reflecting: range) == "PartialRangeUpTo(..<5)")
  }

  /// `PartialRangeFrom` conforms to `CustomReflectable`.
  @Test func `PartialRangeUpTo+CustomReflectable`() {
    let mirror = Mirror(reflecting: range)
    #expect(mirror.children.first?.label == "upperBound")
    #expect(mirror.children.first?.value as? Int == 5)
  }
}
