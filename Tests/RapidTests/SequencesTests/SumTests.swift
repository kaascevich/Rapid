// SumTests.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

import Testing
@testable import Rapid

@Suite struct SumTests {
  /// The `sum()` method returns the sum of the elements.
  @Test("sum()") func sum() {
    #expect((1...10).sum() == 55)
  }
  
  /// The `product()` method returns the product of the elements.
  @Test("product()") func product() {
    #expect((1...5).product() == 120)
  }
}
