// EvenOddTests.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

import Testing
@testable import Rapid

@Suite struct EvenOddTests {
  @Suite struct IsEvenTests {
    /// The `isEven` property is `true` if the value is even or zero.
    @Test("isEven -> true") func isEvenTrue() {
      #expect(6.isEven)
      #expect((-6).isEven)
      #expect(0.isEven)
    }
    /// The `isEven` property is `false` if the value is odd.
    @Test("isEven -> false") func isEvenFalse() {
      #expect(!3.isEven)
      #expect(!(-3).isEven)
    }
  }
  
  @Suite struct IsOddTests {
    /// The `isOdd` property is `true` if the value is odd.
    @Test("isOdd -> true") func isOddTrue() {
      #expect(3.isOdd)
      #expect((-3).isOdd)
    }
    /// The `isEven` property is `false` if the value is even or zero.
    @Test("isOdd -> false") func isOddFalse() {
      #expect(!6.isOdd)
      #expect(!(-6).isOdd)
      #expect(!0.isOdd)
    }
  }
}
