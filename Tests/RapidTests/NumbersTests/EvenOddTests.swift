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

import Testing

@testable import Rapid

@Suite enum EvenOddTests {
  @Suite struct IsEvenTests {
    /// The `isEven` property is `true` if the value is even or zero.
    @Test("isEven -> true") func isEvenTrue() {
      #expect(6.isEven)
      #expect((-6).isEven)
      #expect(0.isEven)
    }

    /// The `isEven` property is `false` if the value is odd.
    @Test("isEven -> false") func isEvenFalse() {
      #expect(!3.isEven)
      #expect(!(-3).isEven)
    }
  }

  @Suite struct IsOddTests {
    /// The `isOdd` property is `true` if the value is odd.
    @Test("isOdd -> true") func isOddTrue() {
      #expect(3.isOdd)
      #expect((-3).isOdd)
    }

    /// The `isEven` property is `false` if the value is even or zero.
    @Test("isOdd -> false") func isOddFalse() {
      #expect(!6.isOdd)
      #expect(!(-6).isOdd)
      #expect(!0.isOdd)
    }
  }
}
