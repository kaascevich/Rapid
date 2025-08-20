// Copyright © 2024-2025 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

import TestHelpers
import Testing

@testable import Rapid

@Suite struct PatternMatchingTests {
  /// The `KeyPath<Bool>.~=(_:_:)` operator allows switching on values based on
  /// their Boolean properties.
  @Test("KeyPath<Bool>.~=(_:_:)")
  func keyPathBoolPatternMatching() {
    let sign = switch -64 {
    case \.isPositive: "positive"
    case \.isNegative: "negative"
    default: "other"
    }
    #expect(sign == "negative")
  }

  /// The `Regex.~=(_:_:)` operator only matches if the regex matches the
  /// entire string.
  @available(iOS 16, macOS 13, tvOS 16, watchOS 9, *)
  @Test("Regex.~=(_:_:)")
  func regexPatternMatching() {
    func testForMatch(of string: String) -> String {
      switch string {
      case /[0-9]+/: "Number!"
      // this is deliberately incorrect, we don't need a proper email regex here
      case /\w+@\w+\.\w+/: "Email!"
      default: "No match."
      }
    }

    #expect(testForMatch(of: "2022") == "Number!")
    #expect(testForMatch(of: "me@you.us") == "Email!")
    #expect(testForMatch(of: "The year is 2022.") == "No match.")
  }
}
