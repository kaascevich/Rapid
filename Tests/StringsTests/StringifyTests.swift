// Copyright © 2024-2025 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

import TestHelpers
import Testing

@testable import Rapid

@Suite struct StringifyTests {
  /// The `§` operator returns the value's description.
  @Test("§(_:)")
  func stringify() {
    #expect(§6 == "6")
    #expect(§3.14 == "3.14")
    #expect(§"hello" == "hello")
    #expect(§[1, 2, 3] == "[1, 2, 3]")
    #expect(§true == "true")
  }
}
