// Copyright © 2024-2025 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

import TestHelpers
import Testing

@testable import Rapid

@Suite struct NilTests {
  /// The `isNil` property is `true` if the optional is `nil`, and `false`
  /// otherwise.
  @Test("isNil", arguments: [
    nil: true,
    42: false,
  ])
  func isNil(number: Int?, expected: Bool) {
    #expect(number.isNil == expected)
  }

  /// The `isNotNil` property is `false` if the optional is `nil`, and `true`
  /// otherwise.
  @Test("isNotNil", arguments: [
    nil: false,
    42: true,
  ])
  func isNotNil(number: Int?, expected: Bool) {
    #expect(number.isNotNil == expected)
  }
}
