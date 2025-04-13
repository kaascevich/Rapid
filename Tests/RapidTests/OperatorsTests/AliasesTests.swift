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

@Suite struct AliasesTests {
  /// The `≠(_:_:)` operator returns `true` if the values are not equal, `false`
  /// otherwise.
  @Test("≠(_:_:)") func notEqual() {
    #expect(8 ≠ 4)
    #expect("hi" ≠ "bye")

    #expect(!(8 ≠ 8))
    #expect(!("hi" ≠ "hi"))
  }

  /// The `≤(_:_:)` operator returns `true` if the first value is less than or
  /// equal to the second, `false` otherwise.
  @Test("≤(_:_:)") func lessThanOrEqualTo() {
    #expect(42 ≤ 69)
    #expect("a" ≤ "b")

    #expect(42 ≤ 42)
    #expect("a" ≤ "a")

    #expect(!(69 ≤ 42))
    #expect(!("b" ≤ "a"))
  }

  /// The `≥(_:_:)` operator returns `true` if the first value is greater than
  /// or equal to the second, `false` otherwise.
  @Test("≥(_:_:)") func greaterThanOrEqualTo() {
    #expect(69 ≥ 42)
    #expect("b" ≥ "a")

    #expect(42 ≥ 42)
    #expect("a" ≥ "a")

    #expect(!(42 ≥ 69))
    #expect(!("a" ≥ "b"))
  }
}
