// NilTests.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

import Testing
@testable import Rapid

@Suite struct NilTests {
  @Suite struct IsNilTests {
    /// The `isNil` property is `true` if the optional is `nil`.
    @Test("isNil -> true") func isNilTrue() {
      let int: Int? = nil
      #expect(int.isNil)
    }
    
    /// The `isNil` property is `false` if the optional has a value.
    @Test("isNil -> false") func isNilFalse() {
      let int: Int? = 42
      #expect(!int.isNil)
    }
  }
  
  @Suite struct IsNotNilTests {
    /// The `isNotNil` property is `false` if the optional is `nil`.
    @Test("isNotNil -> false") func isNotNilFalse() {
      let int: Int? = nil
      #expect(!int.isNotNil)
    }
    
    /// The `isNil` property is `true` if the optional has a value.
    @Test("isNotNil -> true") func isNotNilTrue() {
      let int: Int? = 42
      #expect(int.isNotNil)
    }
  }
}
