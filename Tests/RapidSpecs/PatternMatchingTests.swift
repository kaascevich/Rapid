// PatternMatchingTests.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

import Testing
@testable import Rapid

@Suite struct PatternMatchingTests {
  /// The `Error.~=(_:_:)` operator removes the need for type casts when
  /// matching errors.
  @Test("Error.~=(_:_:)") func errorPatternMatching() {
    enum URLError: Error { case connectionLost, cannotLoad }
    enum HTTPError: Error { case unauthorized, notFound }
    
    func handle(_ error: Error) -> String {
      switch error {
      case URLError.connectionLost, URLError.cannotLoad: "url error"
      case HTTPError.unauthorized: "unauthorized"
      case is HTTPError: "http error"
      default: "unknown"
      }
    }
    
    let error = HTTPError.unauthorized
    #expect(handle(error) == "unauthorized")
  }
  
  /// The `KeyPath<Bool>.~=(_:_:)` operator allows switching on values based on
  /// their Boolean properties.
  @Test("KeyPath<Bool>.~=(_:_:)") func keyPathBoolPatternMatching() {
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
  @Test("Regex.~=(_:_:)") func regexPatternMatching() {
    let digitsOnly = switch "2022" {
    case /[0-9]+/: "Match!"
    default: "No match."
    }
    #expect(digitsOnly == "Match!")
    
    let digitsAndMore = switch "The year is 2022." {
    case /[0-9]+/: "Match!"
    default: "No match."
    }
    #expect(digitsAndMore == "No match.")
  }
}
