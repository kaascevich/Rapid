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

  @Suite struct LastWhereTests {
    let numbers = [3, 7, 4, -2, 9, -6, 10, 1]

    /// The `last(where:)` method returns the last element that satisfies the
    /// predicate.
    @Test("last(where:) -> success")
    func lastWhereSuccess() {
      #expect(numbers.last(where: \.isNegative) == -6)
    }

    /// The `last(where:)` method returns `nil` if no elements satisfy the
    /// predicate.
    @Test("last(where:) -> failure")
    func lastWhereFailure() {
      #expect(numbers.last { $0 == 0 } == nil)
    }

    /// The `last(where:)` method rethrows any thrown error.
    @Test("last(where:) -> throws", .tags(.rethrows))
    func lastWhereThrows() {
      #expect(throws: MockError.bad) {
        _ = try numbers.last { _ in throw MockError.bad }
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
