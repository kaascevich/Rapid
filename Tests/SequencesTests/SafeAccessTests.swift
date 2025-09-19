// SPDX-FileCopyrightText: 2024 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

import TestHelpers
import Testing

@testable import Rapid

@Suite struct SafeAccessTests {
  var streets = ["Adams", "Bryant", "Channing", "Douglas", "Evarts"]

  /// The `subscript(ifExists:)` subscript returns the value at that index if it
  /// exists.
  @Test func `subscript(ifExists:) <- validIndex`() {
    #expect(streets[ifExists: 1] == "Bryant")
  }

  /// The `subscript(ifExists:)` subscript returns `nil` if the value at that
  /// index does not exist.
  @Test func `subscript(ifExists:) <- invalidIndex`() {
    #expect(streets[ifExists: 7] == nil)
    #expect(streets[ifExists: streets.endIndex] == nil)
  }
}
