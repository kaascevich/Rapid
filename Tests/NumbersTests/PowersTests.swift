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

#if canImport(Foundation)

import TestHelpers
import Testing

@testable import Rapid

@Suite struct PowersTests {
  /// The `**(_:_:)` operator raises the first value to the second.
  @Test("**(_:_:)")
  func power() {
    #expect(6 ** 3 == 216)
  }

  /// The `**=(_:_:)` operator raises the first value to the second and assigns
  /// the result.
  @Test("**=(_:_:)")
  func powerAssignment() {
    var x = 3.0
    x **= 5
    #expect(x == 243)
  }
}

#endif
