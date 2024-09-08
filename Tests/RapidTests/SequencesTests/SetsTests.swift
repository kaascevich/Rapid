// SetsTests.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

import Testing
@testable import Rapid

@Suite struct SetsTests {
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
    
    /// The `Set.-=(_:_:)` operator subtracts the second set from the first set ans
    /// assigns the result.
    @Test("Set.-=(_:_:)") func setSubtractAssign() {
      var employees: Set = ["Alicia", "Bethany", "Chris", "Diana", "Eric"]
      let neighbors: Set = ["Bethany", "Eric", "Forlani", "Greta"]
      employees -= neighbors
      #expect(employees == ["Diana", "Chris", "Alicia"])
    }
  }
}
