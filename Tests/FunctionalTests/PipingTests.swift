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

@Suite struct PipingTests {
  func addThree(_ number: Int) -> Int {
    number + 3
  }
  func double(_ number: Int) -> Int {
    number * 2
  }
  func uhOh(_ number: Int) throws -> Int {
    throw MockError.bad
  }

  /// The `|>(argument:function:)` operator calls `function` with `argument`
  /// and returns the result.
  @Test("|>(argument:function:)")
  func rightwardsPipe() {
    #expect(5 |> double == 10)
  }

  /// The `|>(argument:function:)` operator is left-associative.
  @Test("|>(argument:function:) <- associativity")
  func rightwardsPipeAssociativity() {
    #expect(5 |> double |> addThree == 13)
    #expect(5 |> addThree |> double == 16)
  }

  /// The `|>(argument:function:)` rethrows any thrown error.
  @Test("|>(argument:function:) -> throws")
  func rightwardsPipeThrows() {
    #expect(throws: MockError.bad) {
      _ = try 5 |> uhOh
    }
  }
}
