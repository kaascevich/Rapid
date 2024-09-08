// PartialRangeThroughConformancesTests.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

import Testing
@testable import Rapid

@Suite struct PartialRangeThroughConformancesTests {
  let range: PartialRangeThrough = ...5
  
  /// `PartialRangeThrough` conforms to `Equatable`.
  @Test("PartialRangeThrough+Equatable")
  func partialRangeThroughEquatable() {
    #expect(range == range)
  }
  
  /// `PartialRangeThrough` conforms to `Hashable`.
  @Test("PartialRangeThrough+Hashable")
  func partialRangeThroughHashable() {
    #expect(range.hashValue == range.upperBound.hashValue)
  }
  
  /// `PartialRangeThrough` conforms to `CustomStringConvertible`.
  @Test("PartialRangeThrough+CustomStringConvertible")
  func partialRangeThroughCustomStringConvertible() {
    #expect(range.description == "...\(range.upperBound)")
  }
  
  /// `PartialRangeThrough` conforms to `CustomDebugStringConvertible`.
  @Test("PartialRangeThrough+CustomDebugStringConvertible")
  func partialRangeThroughCustomDebugStringConvertible() {
    #expect(range.debugDescription == "PartialRangeThrough(...\(range.upperBound))")
  }
}
