// Copyright © 2024-2025 Kaleb A. Ascevich
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
    @Test("noneSatisfy(_:) -> true")
    func noneSatisfyTrue() {
      #expect(names.noneSatisfy { $0.count < 5 })
    }

    /// The `noneSatisfy(_:)` method returns `false` if at least one of the
    /// elements satisfies the condition.
    @Test("noneSatisfy(_:) -> false")
    func noneSatisfyFalse() {
      #expect(!names.noneSatisfy { $0.count > 3 })
    }

    /// The `noneSatisfy(_:)` method returns `true` if the collection is empty.
    @Test("noneSatisfy(_:) <- empty")
    func noneSatisfyEmpty() {
      #expect(emptyNames.noneSatisfy { $0.count < 5 })
    }

    /// The `noneSatisfy(_:)` method rethrows any thrown error.
    @Test("noneSatisfy(_:) -> throws", .tags(.rethrows))
    func noneSatisfyThrows() {
      #expect(throws: MockError.bad) {
        _ = try names.noneSatisfy { _ in throw MockError.bad }
      }
    }
  }

  /// The `compacted()` method removes all `nil` elements.
  @Test("compacted()")
  func compacted() {
    let numbers = [nil, 2, 3, nil, 5]
    #expect(numbers.compacted() == [2, 3, 5])
  }

  /// The `removeAll(occurrencesOf:)` method removes all elements equal to the
  /// given element.
  @Test("removeAll(occurrencesOf:)")
  func removeAlloccurrencesOf() {
    var numbers = [5, 6, 7, 8, 7, 6, 5]
    numbers.removeAll(occurrencesOf: 6)
    #expect(numbers == [5, 7, 8, 7, 5])
  }

  /// The `count(of:)` method returns the number of times the element appears.
  @Test("count(of:)")
  func countOf() {
    let numbers = [5, 4, 9, 3, 6, 4, 1, 4, 3]
    #expect(numbers.count(of: 4) == 3)
  }

  @Suite struct SortedByTests {
    let students = ["Peter", "Kofi", "Abigail", "Akosua", "Eve"]

    /// The `sorted(by:)` method sorts the sequence based on the given property.
    @Test("sorted(by:)")
    func sortedBy() {
      let sortedStudents = students.sorted(by: \.count)
      #expect(sortedStudents == ["Eve", "Kofi", "Peter", "Akosua", "Abigail"])
    }

    /// The `sorted(by:using:)` method sorts the sequence based on the given
    /// property, using the given comparator function to order the elements.
    @Test("sorted(by:using:)")
    func sortedByUsing() {
      let sortedStudents = students.sorted(by: \.count, using: >)
      #expect(sortedStudents == ["Abigail", "Akosua", "Peter", "Kofi", "Eve"])
    }

    /// The `sorted(by:using:)` method rethrows any thrown error.
    @Test("sorted(by:using:) -> throws", .tags(.rethrows))
    func sortedByUsingThrows() {
      #expect(throws: MockError.bad) {
        _ = try students.sorted(by: \.count) { _, _ in throw MockError.bad }
      }
    }
  }
}
