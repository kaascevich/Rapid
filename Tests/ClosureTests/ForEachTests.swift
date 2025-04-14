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

import enum RapidTests.MockError
import Testing

@testable import Rapid

@Suite struct ForEachTests {
  /// The `repeat(_:)` method runs a closure multiple times.
  @Test("repeat(_:)") func `repeat`() {
    var string = ""
    5.repeat { number in
      string.append(String(number))
    }
    #expect(string == "01234")
  }

  /// The `repeat(_:)` method rethrows any thrown error.
  @Test("repeat(_:) -> throws") func repeatThrows() {
    #expect(throws: MockError.bad) {
      var string = ""
      try 5.repeat { number in
        string.append(String(number))

        if number == 3 {
          throw MockError.bad
        }
      }
    }
  }
}
