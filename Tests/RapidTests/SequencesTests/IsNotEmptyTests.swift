// IsNotEmptyTests.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

import Testing
@testable import Rapid

@Suite struct IsNotEmptyTests {
  /// The `isNotEmpty` property is `true` if the collection contains elements,
  /// `false` otherwise.
  @Test("isNotEmpty") func isNotEmpty() {
    #expect([1, 2, 3, 4, 5].isNotEmpty)
    #expect(![].isNotEmpty)
    
    #expect(["one": 1, "two": 2].isNotEmpty)
    #expect(![:].isNotEmpty)
    
    #expect("a string".isNotEmpty)
    #expect(!"".isNotEmpty)
  }
  
  /// The `isNilOrEmpty` property is `true` if the collection is `nil` or
  /// empty, `false` otherwise.
  @Test("isNilOrEmpty") func isNilOrEmpty() {
    var array: [Int]?
    array = nil;             #expect(array.isNilOrEmpty)
    array = [];              #expect(array.isNilOrEmpty)
    array = [1, 2, 3, 4, 5]; #expect(!array.isNilOrEmpty)
    
    var dictionary: [String: Int]?
    dictionary = nil;        #expect(dictionary.isNilOrEmpty)
    dictionary = [:];        #expect(dictionary.isNilOrEmpty)
    dictionary = ["one": 1]; #expect(!dictionary.isNilOrEmpty)
    
    var string: String?
    string = nil;        #expect(string.isNilOrEmpty)
    string = "";         #expect(string.isNilOrEmpty)
    string = "a string"; #expect(!string.isNilOrEmpty)
  }
  
  /// The `isNotNilOrEmpty` property is `false` if the collection is `nil` or
  /// empty, `true` otherwise.
  @Test("isNotNilOrEmpty") func isNotNilOrEmpty() {
    var array: [Int]?
    array = [1, 2, 3, 4, 5]; #expect(array.isNotNilOrEmpty)
    array = nil;             #expect(!array.isNotNilOrEmpty)
    array = [];              #expect(!array.isNotNilOrEmpty)
    
    var dictionary: [String: Int]?
    dictionary = ["one": 1]; #expect(dictionary.isNotNilOrEmpty)
    dictionary = nil;        #expect(!dictionary.isNotNilOrEmpty)
    dictionary = [:];        #expect(!dictionary.isNotNilOrEmpty)
    
    var string: String?
    string = "a string"; #expect(string.isNotNilOrEmpty)
    string = nil;        #expect(!string.isNotNilOrEmpty)
    string = "";         #expect(!string.isNotNilOrEmpty)
  }
}
