// FilteringSpec.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

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
    
    describe("the compacted() method") {
      it("removes all nil elements") {
        let numbers = [nil, 2, 3, nil, 5]
        expect(numbers.compacted()).to(equal([2, 3, 5]))
      }
    }
    
    describe("the removeAll(occurrencesOf:) method") {
      it("removes all elements equal to the given element") {
        var numbers = [5, 6, 7, 8, 7, 6, 5]
        numbers.removeAll(occurrencesOf: 6)
        expect(numbers).to(equal([5, 7, 8, 7, 5]))
      }
    }
    
    describe("the count(of:) methods") {
      describe("the version that takes a predicate") {
        it("returns the number of elements that satisfy the predicate") {
          let cast = ["Vivien", "Marlon", "Kim", "Karl"]
          let numberOfShortNames = cast.count { $0.count < 5 }
          expect(numberOfShortNames).to(equal(2))
        }
      }
      
      describe("the version that takes an element") {
        it("returns the number of times the element appears") {
          let cast = [5, 4, 9, 3, 6, 4, 1, 4, 3]
          let numberOfFours = cast.count(of: 4)
          expect(numberOfFours).to(equal(3))
        }
      }
    }
    
    describe("the sorted(by:) methods") {
      describe("the version that only takes a key path") {
        it("sorts the sequence based on the given property") {
          let students = ["Peter", "Kofi", "Abigail", "Akosua", "Eve"]
          let sortedStudents = students.sorted(by: \.count)
          expect(sortedStudents).to(equal(["Eve", "Kofi", "Peter", "Akosua", "Abigail"]))
        }
      }
      
      describe("the version that also takes a predicate") {
        it("returns the number of times the element appears") {
          let students = ["Peter", "Kofi", "Abigail", "Akosua", "Eve"]
          let sortedStudents = students.sorted(by: \.count, using: >)
          expect(sortedStudents).to(equal(["Abigail", "Akosua", "Peter", "Kofi", "Eve"]))
        }
      }
    }
  }
}
