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

@Suite struct PartialRangeUpToConformancesTests {
  let range: PartialRangeUpTo = ..<5

  /// `PartialRangeUpTo` conforms to `Equatable`.
  @Test("PartialRangeUpTo+Equatable")
  func partialRangeUpToEquatable() {
    #expect(range == range)
  }

  /// `PartialRangeUpTo` conforms to `Hashable`.
  @Test("PartialRangeUpTo+Hashable")
  func partialRangeUpToHashable() {
    #expect(range.hashValue == range.upperBound.hashValue)
  }

  /// `PartialRangeUpTo` conforms to `CustomStringConvertible`.
  @Test("PartialRangeUpTo+CustomStringConvertible")
  func partialRangeUpToCustomStringConvertible() {
    #expect(range.description == "..<\(range.upperBound)")
  }

  /// `PartialRangeUpTo` conforms to `CustomDebugStringConvertible`.
  @Test("PartialRangeUpTo+CustomDebugStringConvertible")
  func partialRangeUpToCustomDebugStringConvertible() {
    #expect(range.debugDescription == "PartialRangeUpTo(..<\(range.upperBound))")
  }
}
