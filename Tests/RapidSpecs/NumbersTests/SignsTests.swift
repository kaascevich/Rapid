// SignsTests.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

import Testing
@testable import Rapid

@Suite struct SignsTests {
  @Suite struct IsPositiveTests {
    /// The `isPositive` property is `true` if the value is positive.
    @Test("isPositive -> true") func isPositiveTrue() {
      #expect(42.isPositive)
    }
    
    /// The `isPositive` property is `false` if the value is negative or zero.
    @Test("isPositive -> false") func isPositiveFalse() {
      #expect(!(-69).isPositive)
      #expect(!0.isPositive)
    }
  }
  
  @Suite struct IsNegativeTests {
    /// The `isNegative` property is `true` if the value is negative.
    @Test("isNegative -> true") func isNegativeTrue() {
      #expect((-42).isNegative)
    }
    
    /// The `isNegative` property is `false` if the value is positive or zero.
    @Test("isNegative -> false") func isNegativeFalse() {
      #expect(!69.isNegative)
      #expect(!0.isNegative)
    }
  }
  
  @Suite struct AbsoluteValueTests {
    /// The `absoluteValue` property is the value itself when the value is
    /// positive.
    @Test("absoluteValue <- positive") func absoluteValuePositive() {
      #expect(42.absoluteValue == 42)
    }
    
    /// The `absoluteValue` property is the value's additive inverse when the
    /// value is negative.
    @Test("absoluteValue <- negative") func absoluteValueNegative() {
      #expect((-69).absoluteValue == 69)
    }
    
    /// The `absoluteValue` property is zero when the value is zero.
    @Test("absoluteValue <- zero") func absoluteValueZero() {
      #expect(0.absoluteValue == 0)
    }
  }
}
