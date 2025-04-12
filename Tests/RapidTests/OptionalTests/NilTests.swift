// This file is part of BrainflipKit.
// Copyright © 2024-2025 Kaleb A. Ascevich
//
// BrainflipKit is free software: you can redistribute it and/or modify it under
// the terms of the GNU Affero General Public License (GNU AGPL) as published by
// the Free Software Foundation, either version 3 of the License, or (at your
// option) any later version.
//
// BrainflipKit is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
// FOR A PARTICULAR PURPOSE. See the GNU AGPL for more details.
//
// You should have received a copy of the GNU AGPL along with BrainflipKit. If
// not, see <https://www.gnu.org/licenses/>.

import Testing
@testable import Rapid

@Suite struct NilTests {
  @Suite struct IsNilTests {
    /// The `isNil` property is `true` if the optional is `nil`.
    @Test("isNil -> true") func isNilTrue() {
      let int: Int? = nil
      #expect(int.isNil)
    }

    /// The `isNil` property is `false` if the optional has a value.
    @Test("isNil -> false") func isNilFalse() {
      let int: Int? = 42
      #expect(!int.isNil)
    }
  }

  @Suite struct IsNotNilTests {
    /// The `isNotNil` property is `false` if the optional is `nil`.
    @Test("isNotNil -> false") func isNotNilFalse() {
      let int: Int? = nil
      #expect(!int.isNotNil)
    }

    /// The `isNil` property is `true` if the optional has a value.
    @Test("isNotNil -> true") func isNotNilTrue() {
      let int: Int? = 42
      #expect(int.isNotNil)
    }
  }
}
