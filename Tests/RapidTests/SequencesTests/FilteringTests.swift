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

@Suite struct FilteringTests {
  @Suite struct NoneSatisfyTests {
    /// The `noneSatisfy(_:)` method returns `true` if none of the elements
    /// satisfy the condition.
    @Test("noneSatisfy(_:) -> true") func noneSatisfyTrue() {
      let names = ["Sofia", "Camilla", "Martina", "Mateo", "Nicolás"]
      #expect(names.noneSatisfy { $0.count < 5 })
    }

    /// The `noneSatisfy(_:)` method returns `false` if at least one of the
    /// elements satisfies the condition.
    @Test("noneSatisfy(_:) -> false") func noneSatisfyFalse() {
      let names = ["Sofia", "Camilla", "Martina", "Mateo", "Nick"]
      #expect(!names.noneSatisfy { $0.count < 5 })
    }

    /// The `noneSatisfy(_:)` method returns `true` if the collection is empty.
    @Test("noneSatisfy(_:) <- empty") func noneSatisfyEmpty() {
      let names: [String] = []
      #expect(names.noneSatisfy { $0.count < 5 })
    }
  }

  /// The `last(where:)` method returns the last element that satisfies the
  /// predicate, or `nil` if there is no such element.
  @Test("last(where:)") func lastWhere() {
    let numbers = [3, 7, 4, -2, 9, -6, 10, 1]
    #expect(numbers.last(where: \.isNegative) == -6)
    #expect(numbers.last { $0 == 0 } == nil)
  }

  /// The `compacted()` method removes all `nil` elements.
  @Test("compacted()") func compacted() {
    let numbers = [nil, 2, 3, nil, 5]
    #expect(numbers.compacted() == [2, 3, 5])
  }

  /// The `removeAll(occurrencesOf:)` method removes all elements equal to the
  /// given element.
  @Test("removeAll(occurrencesOf:)") func removeAlloccurrencesOf() {
    var numbers = [5, 6, 7, 8, 7, 6, 5]
    numbers.removeAll(occurrencesOf: 6)
    #expect(numbers == [5, 7, 8, 7, 5])
  }

  /// The `count(of:)` method returns the number of times the element appears.
  @Test("count(of:)") func countOf() {
    let numbers = [5, 4, 9, 3, 6, 4, 1, 4, 3]
    let numberOfFours = numbers.count(of: 4)
    #expect(numberOfFours == 3)
  }

  @Suite struct SortedByTests {
    /// The `sorted(by:)` method sorts the sequence based on the given
    /// property.
    @Test("sorted(by:)") func sortedBy() {
      let students = ["Peter", "Kofi", "Abigail", "Akosua", "Eve"]
      let sortedStudents = students.sorted(by: \.count)
      #expect(sortedStudents == ["Eve", "Kofi", "Peter", "Akosua", "Abigail"])
    }

    /// The `sorted(by:using:)` method sorts the sequence based on the given
    /// property, using the given comparator function to order the elements.
    @Test("sorted(by:using:)") func sortedByUsing() {
      let students = ["Peter", "Kofi", "Abigail", "Akosua", "Eve"]
      let sortedStudents = students.sorted(by: \.count, using: >)
      #expect(sortedStudents == ["Abigail", "Akosua", "Peter", "Kofi", "Eve"])
    }
  }
}
