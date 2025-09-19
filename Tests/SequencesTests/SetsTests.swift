// SPDX-FileCopyrightText: 2024 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

import TestHelpers
import Testing

@testable import Rapid

@Suite enum SetsTests {
  @Suite struct SetAddTests {
    var attendees: Set = ["Alicia", "Bethany", "Diana"]
    let visitors: Set = ["Marcia", "Nathaniel"]

    /// The `Set.+(_:_:)` operator combines two sets. It keeps existing members
    /// in the event of conflicts.
    @Test func `Set.+(_:_:)`() {
      let attendeesAndVisitors = attendees + visitors
      #expect(attendeesAndVisitors == ["Diana", "Nathaniel", "Bethany", "Alicia", "Marcia"])
    }

    /// The `Set.+=(_:_:)` operator combines two sets and assigns the result. It
    /// keeps existing members in the event of conflicts.
    @Test mutating func `Set.+=(_:_:)`() {
      attendees += visitors
      #expect(attendees == ["Diana", "Nathaniel", "Bethany", "Alicia", "Marcia"])
    }
  }

  @Suite struct SetSubtractTests {
    var employees: Set = ["Alicia", "Bethany", "Chris", "Diana", "Eric"]
    let neighbors: Set = ["Bethany", "Eric", "Forlani", "Greta"]

    /// The `Set.-(_:_:)` operator subtracts the second set from the first set.
    @Test func `Set.-(_:_:)`() {
      let nonNeighbors = employees - neighbors
      #expect(nonNeighbors == ["Diana", "Chris", "Alicia"])
    }

    /// The `Set.-=(_:_:)` operator subtracts the second set from the first set
    /// and assigns the result.
    @Test mutating func `Set.-=(_:_:)`() {
      employees -= neighbors
      #expect(employees == ["Diana", "Chris", "Alicia"])
    }
  }
}
