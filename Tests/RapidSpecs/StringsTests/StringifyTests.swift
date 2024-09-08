// StringifyTests.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

import Testing
@testable import Rapid

@Suite struct StringifyTests {
  /// The `§` operator returns the value's description.
  @Test("§(_:)") func stringify() {
    let int = 6
    #expect(§int == "6")
    
    let double = 3.14
    #expect(§double == "3.14")
    
    let string = "hello"
    #expect(§string == "hello")
    
    let array = [1, 2, 3]
    #expect(§array == "[1, 2, 3]")
    
    let bool = true
    #expect(§bool == "true")
  }
}
