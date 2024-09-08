// PartialRangeFromConformancesTests.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

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
