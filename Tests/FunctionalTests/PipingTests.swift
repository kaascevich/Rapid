// Copyright © 2024-2025 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

import TestHelpers
import Testing

@testable import Rapid

@Suite struct PipingTests {
  func addThree(to number: Int) -> Int {
    number + 3
  }
  func double(_ number: Int) -> Int {
    number * 2
  }
  func uhOh(_: Int) throws -> Int {
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
  @Test("|>(argument:function:) -> throws", .tags(.rethrows))
  func rightwardsPipeThrows() {
    #expect(throws: MockError.bad) {
      _ = try 5 |> uhOh
    }
  }
}
