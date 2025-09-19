// SPDX-FileCopyrightText: 2024 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

import TestHelpers
import Testing

@testable import Rapid

@Suite struct BooleansTests {
  /// The `asInt` property is `1` if the value is `true`, `0` otherwise.
  @Test(arguments: [
    true: 1,
    false: 0,
  ])
  func `asInt`(value: Bool, expected: Int) {
    #expect(value.asInt == expected)
  }

  /// The `init(fromInt:)` initializer returns `false` if the value is `0`,
  /// `true` otherwise.
  @Test(arguments: [
    0: false,
    1: true,
    42: true,
    -1: true,
  ])
  func `init(fromInt:)`(value: Int, expected: Bool) {
    #expect(Bool(fromInt: value) == expected)
  }
}
