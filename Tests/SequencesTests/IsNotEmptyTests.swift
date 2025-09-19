// SPDX-FileCopyrightText: 2024 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

import TestHelpers
import Testing

@testable import Rapid

@Suite struct IsNotEmptyTests {
  /// The `isNotEmpty` property is `true` if the collection contains elements,
  /// `false` otherwise.
  @Test func `isNotEmpty`() {
    #expect([1, 2, 3, 4, 5].isNotEmpty)
    #expect(![].isNotEmpty)

    #expect(["one": 1, "two": 2].isNotEmpty)
    #expect(![:].isNotEmpty)

    #expect("a string".isNotEmpty)
    #expect(!"".isNotEmpty)
  }

  /// The `isNilOrEmpty` property is `true` if the collection is `nil` or empty,
  /// `false` otherwise.
  @Test func `isNilOrEmpty`() {
    // swiftlint:disable discouraged_optional_collection

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

    // swiftlint:enable discouraged_optional_collection
  }

  /// The `isNotNilOrEmpty` property is `false` if the collection is `nil` or
  /// empty, `true` otherwise.
  @Test func `isNotNilOrEmpty`() {
    // swiftlint:disable discouraged_optional_collection

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

    // swiftlint:enable discouraged_optional_collection
  }
}
