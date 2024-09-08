// SafeAccessTests.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

import Testing
@testable import Rapid

@Suite struct SafeAccessTests {
  let streets = ["Adams", "Bryant", "Channing", "Douglas", "Evarts"]
  
  /// The `subscript(safe:)` subscript returns the value at that index if it
  /// exists.
  @Test("subscript(safe:) <- validIndex") func subscriptSafeValidIndex() {
    #expect(streets[ifExists: 1] == "Bryant")
  }
  
  /// The `subscript(safe:)` subscript returns nil if the value at that index
  /// does not exist.
  @Test("subscript(safe:) <- invalidIndex") func subscriptSafeInvalidIndex() {
    #expect(streets[ifExists: 7] == nil)
    #expect(streets[ifExists: streets.endIndex] == nil)
  }
}
