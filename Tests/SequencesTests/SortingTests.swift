// SPDX-FileCopyrightText: 2024 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

import TestHelpers
import Testing

@testable import Rapid

@Suite struct SortingTests {
  let students = ["Peter", "Kofi", "Abigail", "Akosua", "Eve"]
  
  /// The `sorted(by:)` method sorts the sequence based on the given mapping.
  @Test func `sorted(by:)`() {
    let sortedStudents = students.sorted(by: \.count)
    #expect(sortedStudents == ["Eve", "Kofi", "Peter", "Akosua", "Abigail"])
  }
  
  /// The `sorted(by:using:)` method sorts the sequence based on the given
  /// mapping, using the given comparator function to order the elements.
  @Test func `sorted(by:using:)`() {
    let sortedStudents = students.sorted(by: \.count, using: >)
    #expect(sortedStudents == ["Abigail", "Akosua", "Peter", "Kofi", "Eve"])
  }
  
  /// The `sorted(by:using:)` method rethrows any thrown error.
  @Test(.tags(.rethrows)) func `sorted(by:using:) -> throws`() {
    #expect(throws: MockError.bad) {
      _ = try students.sorted(by: \.count) { _, _ in throw MockError.bad }
    }
  }
}
