// This file is part of Rapid.
// Copyright © 2024-2025 Kaleb A. Ascevich
//
// Rapid is free software: you can redistribute it and/or modify it under the
// terms of the GNU Affero General Public License (GNU AGPL) as published by the
// Free Software Foundation, either version 3 of the License, or (at your
// option) any later version.
//
// Rapid is distributed in the hope that it will be useful, but WITHOUT ANY
// WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
// A PARTICULAR PURPOSE. See the GNU AGPL for more details.
//
// You should have received a copy of the GNU AGPL along with Rapid. If not, see
// <https://www.gnu.org/licenses/>.

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
