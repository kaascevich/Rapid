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

@Suite enum ZeroTests {
  @Suite struct IsZeroTests {
    /// The `isZero` property is `true` is the value is zero.
    @Test("isZero -> true")
    func isZeroTrue() {
      #expect(0.isZero)
    }

    /// The `isZero` property is `false` is the value is positive or negative.
    @Test("isZero -> false")
    func isZeroFalse() {
      #expect(!5.isZero)
      #expect(!(-5).isZero)
    }
  }

  @Suite struct IsNonzeroTests {
    /// The `isNonzero` property is `false` is the value is zero.
    @Test("isNonzero -> true")
    func isNonzeroFalse() {
      #expect(!0.isNonzero)
    }

    /// The `isNonzero` property is `true` is the value is positive or negative.
    @Test("isNonzero -> false")
    func isNonzeroTrue() {
      #expect(5.isNonzero)
      #expect((-5).isNonzero)
    }
  }
}
