// SPDX-FileCopyrightText: 2024 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

#if canImport(Foundation)

import TestHelpers
import Testing

@testable import Rapid

@Suite struct PowersTests {
  /// The `**(_:_:)` operator raises the first value to the second.
  @Test func `**(_:_:)`() {
    #expect(6 ** 3 == 216)
  }

  /// The `**=(_:_:)` operator raises the first value to the second and assigns
  /// the result.
  @Test func `**=(_:_:)`() {
    var x = 3.0
    x **= 5
    #expect(x == 243)
  }
}

#endif
