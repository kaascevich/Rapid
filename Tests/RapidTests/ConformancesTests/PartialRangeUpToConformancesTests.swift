// PartialRangeUpToConformancesTests.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

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
