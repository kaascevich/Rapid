// RepetitionTests.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

import Testing
@testable import Rapid

@Suite struct RepetitionTests {
  /// The `*(repeatedValue:count)` operator, when used with strings, creates a
  /// `String` repeated the specified number of times.
  @Test("*(repeatedValue:count)") func repetition() {
    #expect("hello" * 3 == "hellohellohello")
  }
}
