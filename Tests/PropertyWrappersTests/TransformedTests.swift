// Copyright © 2024-2025 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

import TestHelpers
import Testing

@testable import Rapid

@Suite struct TransformedTests {
  /// The `@Transformed` property wrapper transforms a value using the given
  /// closure.
  @Test("@Transformed")
  func transformed() {
    @Transformed(with: -) var value = 5
    #expect(value == -5)

    value = -346
    #expect(value == 346)
  }
}
