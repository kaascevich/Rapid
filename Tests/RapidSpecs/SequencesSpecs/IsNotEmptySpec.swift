// IsNotEmptySpec.swift
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

// swiftlint:disable discouraged_optional_collection redundant_optional_initialization

final class IsNotEmptySpec: QuickSpec {
    override class func spec() {
        describe("the isNotEmpty property") {
            it("is true if the collection contains elements") {
                let array = [1, 2, 3, 4, 5]
                let dictionary = ["one": 1, "two": 2]
                let set: Set = [1, 2, 3, 4, 5]
                
                expect(array.isNotEmpty).to(beTrue())
                expect(dictionary.isNotEmpty).to(beTrue())
                expect(set.isNotEmpty).to(beTrue())
            }
            
            it("is false if the collection is empty") {
                let array = []
                let dictionary = [:]
                let set: Set<Int> = []
                
                expect(array.isNotEmpty).to(beFalse())
                expect(dictionary.isNotEmpty).to(beFalse())
                expect(set.isNotEmpty).to(beFalse())
            }
        }
        
        describe("the nil-or-empty properties") {
            describe("the isNilOrEmpty property") {
                it("is true if the collection is nil or empty, false otherwise") {
                    var array: [Int]? = nil
                    expect(array.isNilOrEmpty).to(beTrue())
                    
                    array = []
                    expect(array.isNilOrEmpty).to(beTrue())
                    
                    array = [1, 2, 3, 4, 5]
                    expect(array.isNilOrEmpty).to(beFalse())
                }
            }
            
            describe("the isNotNilOrEmpty property") {
                it("is false if the collection is nil or empty, true otherwise") {
                    var array: [Int]? = nil
                    expect(array.isNotNilOrEmpty).to(beFalse())
                    
                    array = []
                    expect(array.isNotNilOrEmpty).to(beFalse())
                    
                    array = [1, 2, 3, 4, 5]
                    expect(array.isNotNilOrEmpty).to(beTrue())
                }
            }
        }
    }
}

// swiftlint:enable discouraged_optional_collection redundant_optional_initialization
