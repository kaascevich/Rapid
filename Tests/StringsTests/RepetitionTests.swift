// Copyright © 2024-2025 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

import TestHelpers
import Testing

@testable import Rapid

@Suite struct RepetitionTests {
  /// The `*(_:_:)` operator, when used with strings, creates a `String`
  /// repeated the specified number of times.
  @Test("*(_:_:)")
  func repetition() {
    #expect("hello" * 3 == "hellohellohello")
  }
}
