// TransformedTests.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

import Testing
@testable import Rapid

@Suite struct TransformedTests {
  /// The `@Transformed` property wrapper transforms a value using the given
  /// closure.
  @Test("@Transformed") func transformed() {
    @Transformed(with: -) var value = 5
    #expect(value == -5)
    
    value = -346
    #expect(value == 346)
  }
}
