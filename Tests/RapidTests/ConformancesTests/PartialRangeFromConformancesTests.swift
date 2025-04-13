// This file is part of BrainflipKit.
// Copyright © 2024-2025 Kaleb A. Ascevich
//
// BrainflipKit is free software: you can redistribute it and/or modify it under
// the terms of the GNU Affero General Public License (GNU AGPL) as published by
// the Free Software Foundation, either version 3 of the License, or (at your
// option) any later version.
//
// BrainflipKit is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
// FOR A PARTICULAR PURPOSE. See the GNU AGPL for more details.
//
// You should have received a copy of the GNU AGPL along with BrainflipKit. If
// not, see <https://www.gnu.org/licenses/>.

import Testing

@testable import Rapid

@Suite struct PartialRangeFromConformancesTests {
  let range: PartialRangeFrom = 5...

  /// `PartialRangeFrom` conforms to `Equatable`.
  @Test("PartialRangeFrom+Equatable")
  func partialRangeFromEquatable() {
    #expect(range == range)
  }

  /// `PartialRangeFrom` conforms to `Hashable`.
  @Test("PartialRangeFrom+Hashable")
  func partialRangeFromHashable() {
    #expect(range.hashValue == range.lowerBound.hashValue)
  }

  /// `PartialRangeFrom` conforms to `CustomStringConvertible`.
  @Test("PartialRangeFrom+CustomStringConvertible")
  func partialRangeFromCustomStringConvertible() {
    #expect(range.description == "\(range.lowerBound)...")
  }

  /// `PartialRangeFrom` conforms to `CustomDebugStringConvertible`.
  @Test("PartialRangeFrom+CustomDebugStringConvertible")
  func partialRangeFromCustomDebugStringConvertible() {
    #expect(range.debugDescription == "PartialRangeFrom(\(range.lowerBound)...)")
  }
}
