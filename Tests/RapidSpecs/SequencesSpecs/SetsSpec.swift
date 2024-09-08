// SetsSpec.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

import Quick
import Nimble
@testable import Rapid

final class SetsSpec: QuickSpec {
  override class func spec() {
    describe("the +(_:_:) operator") {
      it("combines two sets") {
        let attendees: Set = ["Alicia", "Bethany", "Diana"]
        let visitors: Set = ["Marcia", "Nathaniel"]
        let attendeesAndVisitors = attendees + visitors
        expect(attendeesAndVisitors).to(equal(["Diana", "Nathaniel", "Bethany", "Alicia", "Marcia"]))
      }
      
      it("keeps existing members in the event of conflicts") {
        let initialIndices = Set(0..<5)
        let expandedIndices = initialIndices + [2, 3, 6, 7] as Set
        expect(expandedIndices).to(equal([2, 4, 6, 7, 0, 1, 3]))
      }
    }
    
    describe("the +=(_:_:) operator") {
      it("combines two sets") {
        var attendees: Set = ["Alicia", "Bethany", "Diana"]
        let visitors: Set = ["Marcia", "Nathaniel"]
        attendees += visitors
        expect(attendees).to(equal(["Diana", "Nathaniel", "Bethany", "Alicia", "Marcia"]))
      }
      
      it("keeps existing members in the event of conflicts") {
        var initialIndices = Set(0..<5)
        initialIndices += [2, 3, 6, 7]
        expect(initialIndices).to(equal([2, 4, 6, 7, 0, 1, 3]))
      }
    }
    
    describe("the -(_:_:) operator") {
      it("subtracts the second set from the first set") {
        let employees: Set = ["Alicia", "Bethany", "Chris", "Diana", "Eric"]
        let neighbors: Set = ["Bethany", "Eric", "Forlani", "Greta"]
        let nonNeighbors = employees - neighbors
        expect(nonNeighbors).to(equal(["Diana", "Chris", "Alicia"]))
      }
    }
    
    describe("the -=(_:_:) operator") {
      it("subtracts the second set from the first set") {
        var employees: Set = ["Alicia", "Bethany", "Chris", "Diana", "Eric"]
        let neighbors: Set = ["Bethany", "Eric", "Forlani", "Greta"]
        employees -= neighbors
        expect(employees).to(equal(["Diana", "Chris", "Alicia"]))
      }
    }
  }
}
