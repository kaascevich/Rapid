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
