// SetsSpec.swift
// Copyright © 2023 Kaleb A. Ascevich
//
// This package is free software: you can redistribute it and/or modify it
// under the terms of the GNU General Public License as published by the
// Free Software Foundation, either version 3 of the License, or (at your
// option) any later version.
//
// This package is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
// FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
// for more details.
//
// You should have received a copy of the GNU General Public License along
// with this package. If not, see https://www.gnu.org/licenses/.

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
