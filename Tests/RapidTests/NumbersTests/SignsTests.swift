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

@Suite struct SignsTests {
  @Suite struct IsPositiveTests {
    /// The `isPositive` property is `true` if the value is positive.
    @Test("isPositive -> true") func isPositiveTrue() {
      #expect(42.isPositive)
    }

    /// The `isPositive` property is `false` if the value is negative or zero.
    @Test("isPositive -> false") func isPositiveFalse() {
      #expect(!(-69).isPositive)
      #expect(!0.isPositive)
    }
  }

  @Suite struct IsNegativeTests {
    /// The `isNegative` property is `true` if the value is negative.
    @Test("isNegative -> true") func isNegativeTrue() {
      #expect((-42).isNegative)
    }

    /// The `isNegative` property is `false` if the value is positive or zero.
    @Test("isNegative -> false") func isNegativeFalse() {
      #expect(!69.isNegative)
      #expect(!0.isNegative)
    }
  }

  @Suite struct AbsoluteValueTests {
    /// The `absoluteValue` property is the value itself when the value is
    /// positive.
    @Test("absoluteValue <- positive") func absoluteValuePositive() {
      #expect(42.absoluteValue == 42)
    }

    /// The `absoluteValue` property is the value's additive inverse when the
    /// value is negative.
    @Test("absoluteValue <- negative") func absoluteValueNegative() {
      #expect((-69).absoluteValue == 69)
    }

    /// The `absoluteValue` property is zero when the value is zero.
    @Test("absoluteValue <- zero") func absoluteValueZero() {
      #expect(0.absoluteValue == 0)
    }
  }
}
