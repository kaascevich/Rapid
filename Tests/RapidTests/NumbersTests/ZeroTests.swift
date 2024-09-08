// ZeroTests.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

import Testing
@testable import Rapid

@Suite struct ZeroTests {
  @Suite struct IsZeroTests {
    /// The `isZero` property is `true` is the value is zero.
    @Test("isZero -> true") func isZeroTrue() {
      #expect(0.isZero)
    }
    
    /// The `isZero` property is `false` is the value is positive or negative.
    @Test("isZero -> false") func isZeroFalse() {
      #expect(!5.isZero)
      #expect(!(-5).isZero)
    }
  }
  @Suite struct IsNonzeroTests {
    /// The `isNonzero` property is `false` is the value is zero.
    @Test("isNonzero -> true") func isNonzeroFalse() {
      #expect(!0.isNonzero)
    }
    
    /// The `isNonzero` property is `true` is the value is positive or negative.
    @Test("isNonzero -> false") func isNonzeroTrue() {
      #expect(5.isNonzero)
      #expect((-5).isNonzero)
    }
  }
  
}
