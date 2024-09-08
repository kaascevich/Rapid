// ForEachTests.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

import Testing
@testable import Rapid

@Suite struct ForEachTests {
  /// The `repeat(_:)` method runs a closure multiple times.
  @Test("repeat(_:)") func `repeat`() {
    var string = ""
    5.repeat { number in
      string.append(String(number))
    }
    #expect(string == "01234")
  }
}
