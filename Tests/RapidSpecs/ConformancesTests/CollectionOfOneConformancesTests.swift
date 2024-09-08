// CollectionOfOneConformancesTests.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

import Testing
@testable import Rapid

@Suite struct CollectionOfOneConformancesTests {
  /// `CollectionOfOne`'s conformance to `ExpressibleByArrayLiteral` only
  /// allows a literal with one element.
  @Test("CollectionOfOne+ExpressibleByArrayLiteral")
  func collectionOfOneArrayLiteral() {
    let oneElement: CollectionOfOne = [42]
    #expect(oneElement[0] == 42)
    
    // TODO: Figure out how to test assertions with the Testing framework
//    expect([] as CollectionOfOne).to(throwAssertion())
//    expect([42, 69] as CollectionOfOne).to(throwAssertion())
  }
}
