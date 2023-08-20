// FilteringSpec.swift
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

final class FilteringSpec: QuickSpec {
    override class func spec() {
        describe("the noneSatisfy(_:) method") {
            it("returns true if none of the elements satisfy the condition") {
                let names = ["Sofia", "Camilla", "Martina", "Mateo", "Nicolás"]
                let allHaveFewerThanFive = names.noneSatisfy { $0.count < 5 }
                expect(allHaveFewerThanFive).to(beTrue())
            }
            
            it("returns false if at least one of the elements satisfies the condition") {
                let names = ["Sofia", "Camilla", "Martina", "Mateo", "Nick"]
                let noneHaveFewerThanFive = names.noneSatisfy { $0.count < 5 }
                expect(noneHaveFewerThanFive).to(beFalse())
            }
            
            it("returns true if the collection is empty") {
                let names: [String] = []
                let noneHaveFewerThanFive = names.noneSatisfy { $0.count < 5 }
                expect(noneHaveFewerThanFive).to(beTrue())
            }
        }
        
        describe("the last(where:) method") {
            let numbers = [3, 7, 4, -2, 9, -6, 10, 1]
            
            it("returns the last element that satisfies the predicate") {
                expect(numbers.last(where: \.isNegative)).to(equal(-6))
            }
            
            it("returns nil if no elements satisfy the predicate") {
                expect(numbers.last { $0 == 0 }).to(beNil())
            }
        }
    }
}
