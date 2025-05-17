// This file is part of Rapid.
// Copyright © 2024-2025 Kaleb A. Ascevich
//
// Rapid is free software: you can redistribute it and/or modify it under the
// terms of the GNU Affero General Public License (GNU AGPL) as published by the
// Free Software Foundation, either version 3 of the License, or (at your
// option) any later version.
//
// Rapid is distributed in the hope that it will be useful, but WITHOUT ANY
// WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
// A PARTICULAR PURPOSE. See the GNU AGPL for more details.
//
// You should have received a copy of the GNU AGPL along with Rapid. If not, see
// <https://www.gnu.org/licenses/>.

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
