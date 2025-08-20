// Copyright © 2024-2025 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

import TestHelpers
import Testing

@testable import Rapid

@Suite struct SwapTests {
  /// The `<=>` operator swaps two values.
  @Test("<=>(_:_:)")
  func swap() {
    var fortyTwo = 42
    var sixtyNine = 69
    fortyTwo <=> sixtyNine

    #expect(fortyTwo == 69)
    #expect(sixtyNine == 42)
  }
}
