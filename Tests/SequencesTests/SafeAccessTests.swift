// Copyright © 2024-2025 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

import TestHelpers
import Testing

@testable import Rapid

@Suite struct SafeAccessTests {
  let streets = ["Adams", "Bryant", "Channing", "Douglas", "Evarts"]

  /// The `subscript(safe:)` subscript returns the value at that index if it
  /// exists.
  @Test("subscript(safe:) <- validIndex")
  func subscriptSafeValidIndex() {
    #expect(streets[ifExists: 1] == "Bryant")
  }

  /// The `subscript(safe:)` subscript returns nil if the value at that index
  /// does not exist.
  @Test("subscript(safe:) <- invalidIndex")
  func subscriptSafeInvalidIndex() {
    #expect(streets[ifExists: 7] == nil)
    #expect(streets[ifExists: streets.endIndex] == nil)
  }
}
