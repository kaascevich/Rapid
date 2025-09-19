// SPDX-FileCopyrightText: 2024 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

import TestHelpers
import Testing

@testable import Rapid

@Suite struct NilCoalescingTests {
  var didGetDefault = false
  mutating func getDefault() -> Int {
    didGetDefault = true
    return 42
  }

  /// The `??=(optional:defaultValue:)` operator assigns `defaultValue` to
  /// `optional` if `optional` is `nil`.
  @Test mutating func `??=(optional:defaultValue:) -> isNil`() {
    var int: Int? = nil
    int ??= getDefault()

    #expect(int == 42)
    #expect(didGetDefault)
  }

  /// The `??=(optional:defaultValue:)` operator does nothing if `optional` is
  /// not `nil`. `defaultValue` is never evaluated.
  @Test mutating func `??=(optional:defaultValue:) -> isNotNil`() {
    var int: Int? = 69
    int ??= getDefault()

    #expect(int == 69)
    #expect(!didGetDefault)
  }
}
