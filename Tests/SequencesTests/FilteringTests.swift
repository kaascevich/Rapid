// SPDX-FileCopyrightText: 2024 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

import TestHelpers
import Testing

@testable import Rapid

@Suite struct FilteringTests {
  @Suite struct NoneSatisfyTests {
    let names = ["Sofia", "Camilla", "Martina", "Mateo", "Nicolás"]
    let emptyNames: [String] = []

    /// The `noneSatisfy(_:)` method returns `true` if none of the elements
    /// satisfy the condition.
    @Test func `noneSatisfy(_:) -> true`() {
      #expect(names.noneSatisfy { $0.count < 5 })
    }

    /// The `noneSatisfy(_:)` method returns `false` if at least one of the
    /// elements satisfies the condition.
    @Test func `noneSatisfy(_:) -> false`() {
      #expect(!names.noneSatisfy { $0.count > 3 })
    }

    /// The `noneSatisfy(_:)` method returns `true` if the collection is empty.
    @Test func `noneSatisfy(_:) <- empty`() {
      #expect(emptyNames.noneSatisfy { $0.count < 5 })
    }

    /// The `noneSatisfy(_:)` method rethrows any thrown error.
    @Test(.tags(.rethrows)) func `noneSatisfy(_:) -> throws`() {
      #expect(throws: MockError.bad) {
        _ = try names.noneSatisfy { _ in throw MockError.bad }
      }
    }
  }

  /// The `compacted()` method removes all `nil` elements.
  @Test func `compacted()`() {
    let numbers = [nil, 2, 3, nil, 5]
    #expect(numbers.compacted() == [2, 3, 5])
  }

  /// The `removeAll(occurrencesOf:)` method removes all elements equal to the
  /// given element.
  @Test func `removeAll(occurrencesOf:)`() {
    var numbers = [5, 6, 7, 8, 7, 6, 5]
    numbers.removeAll(occurrencesOf: 6)
    #expect(numbers == [5, 7, 8, 7, 5])
  }

  /// The `count(of:)` method returns the number of times the element appears.
  @Test func `count(of:)`() {
    let numbers = [5, 4, 9, 3, 6, 4, 1, 4, 3]
    #expect(numbers.count(of: 4) == 3)
  }
}
