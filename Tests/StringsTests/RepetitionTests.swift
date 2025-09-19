// SPDX-FileCopyrightText: 2024 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

import TestHelpers
import Testing

@testable import Rapid

@Suite struct RepetitionTests {
  /// The `*(_:_:)` operator, when used with strings, creates a `String`
  /// repeated the specified number of times.
  @Test func `*(_:_:)`() {
    #expect("hello" * 3 == "hellohellohello")
  }
}
