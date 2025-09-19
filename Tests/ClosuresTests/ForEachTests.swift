// SPDX-FileCopyrightText: 2024 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

import TestHelpers
import Testing

@testable import Rapid

@Suite struct ForEachTests {
  /// The `repeat(_:)` method runs a closure multiple times.
  @Test func `repeat(_:)`() {
    var string = ""
    5.repeat { (number: Int) in
      string.append(String(number))
    }
    #expect(string == "01234")
  }

  /// The `repeat(_:)` method rethrows any thrown error.
  @Test(.tags(.rethrows)) func `repeat(_:) -> throws`() {
    #expect(throws: MockError.bad) {
      try 5.repeat { _ in
        throw MockError.bad
      }
    }
  }
}
