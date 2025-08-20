// Copyright © 2024-2025 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

import TestHelpers
import Testing

@testable import Rapid

@Suite struct ForEachTests {
  /// The `repeat(_:)` method runs a closure multiple times.
  @Test("repeat(_:)")
  func `repeat`() {
    var string = ""
    5.repeat { (number: Int) in
      string.append(String(number))
    }
    #expect(string == "01234")
  }

  /// The `repeat(_:)` method rethrows any thrown error.
  @Test("repeat(_:) -> throws", .tags(.rethrows))
  func repeatThrows() {
    #expect(throws: MockError.bad) {
      try 5.repeat { _ in
        throw MockError.bad
      }
    }
  }
}
