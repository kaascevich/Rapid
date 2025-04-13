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

@Suite enum SetsTests {
  @Suite struct SetAddTests {
    /// The `Set.+(_:_:)` operator combines two sets. It keeps existing members
    /// in the event of conflicts.
    @Test("Set.+(_:_:)") func setAdd() {
      let attendees: Set = ["Alicia", "Bethany", "Diana"]
      let visitors: Set = ["Marcia", "Nathaniel"]
      let attendeesAndVisitors = attendees + visitors
      #expect(attendeesAndVisitors == ["Diana", "Nathaniel", "Bethany", "Alicia", "Marcia"])

      let initialIndices = Set(0..<5)
      let expandedIndices = initialIndices + [2, 3, 6, 7] as Set
      #expect(expandedIndices == [2, 4, 6, 7, 0, 1, 3])
    }

    /// The `Set.+=(_:_:)` operator combines two sets and assigns the result. It
    /// keeps existing members in the event of conflicts.
    @Test("Set.+=(_:_:)") func setAddAssign() {
      var attendees: Set = ["Alicia", "Bethany", "Diana"]
      let visitors: Set = ["Marcia", "Nathaniel"]
      attendees += visitors
      #expect(attendees == ["Diana", "Nathaniel", "Bethany", "Alicia", "Marcia"])

      var initialIndices = Set(0..<5)
      initialIndices += [2, 3, 6, 7]
      #expect(initialIndices == [2, 4, 6, 7, 0, 1, 3])
    }
  }

  @Suite struct SetSubtractTests {
    /// The `Set.-(_:_:)` operator subtracts the second set from the first set.
    @Test("Set.-(_:_:)") func setSubtract() {
      let employees: Set = ["Alicia", "Bethany", "Chris", "Diana", "Eric"]
      let neighbors: Set = ["Bethany", "Eric", "Forlani", "Greta"]
      let nonNeighbors = employees - neighbors
      #expect(nonNeighbors == ["Diana", "Chris", "Alicia"])
    }

    /// The `Set.-=(_:_:)` operator subtracts the second set from the first set
    /// and assigns the result.
    @Test("Set.-=(_:_:)") func setSubtractAssign() {
      var employees: Set = ["Alicia", "Bethany", "Chris", "Diana", "Eric"]
      let neighbors: Set = ["Bethany", "Eric", "Forlani", "Greta"]
      employees -= neighbors
      #expect(employees == ["Diana", "Chris", "Alicia"])
    }
  }
}
