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
            context("when the collection is an array") {
                it("is true if the array contains elements") {
                    expect([1, 2, 3, 4, 5].isNotEmpty).to(beTrue())
                }
                
                it("is false if the array is empty") {
                    expect([].isNotEmpty).to(beFalse())
                }
            }
            
            context("when the collection is a dictionary") {
                it("is true if the dictionary contains elements") {
                    expect(["one": 1, "two": 2].isNotEmpty).to(beTrue())
                }
                
                it("is false if the dictionary is empty") {
                    expect([:].isNotEmpty).to(beFalse())
                }
            }
            
            context("when the collection is a string") {
                it("is true if the string contains characters") {
                    expect("a string".isNotEmpty).to(beTrue())
                }
                
                it("is false if the string is empty") {
                    expect("".isNotEmpty).to(beFalse())
                }
            }
        }
        
        describe("the isNilOrEmpty property") {
            context("when the collection is an array") {
                it("is true if the array is nil or empty, false otherwise") {
                    var array: [Int]? = nil
                    expect(array.isNilOrEmpty).to(beTrue())
                    expect(array.isNotNilOrEmpty).to(beFalse())
                    
                    array = []
                    expect(array.isNilOrEmpty).to(beTrue())
                    expect(array.isNotNilOrEmpty).to(beFalse())
                    
                    array = [1, 2, 3, 4, 5]
                    expect(array.isNilOrEmpty).to(beFalse())
                    expect(array.isNotNilOrEmpty).to(beTrue())
                }
            }
            
            context("when the collection is a dictionary") {
                it("is true if the dictionary is nil or empty, false otherwise") {
                    var dictionary: [String: Int]? = nil
                    expect(dictionary.isNilOrEmpty).to(beTrue())
                    expect(dictionary.isNotNilOrEmpty).to(beFalse())
                    
                    dictionary = [:]
                    expect(dictionary.isNilOrEmpty).to(beTrue())
                    expect(dictionary.isNotNilOrEmpty).to(beFalse())
                    
                    dictionary = ["one": 1, "two": 2]
                    expect(dictionary.isNilOrEmpty).to(beFalse())
                    expect(dictionary.isNotNilOrEmpty).to(beTrue())
                }
            }
            
            context("when the collection is a string") {
                it("is true if the string is nil or empty, false otherwise") {
                    var string: String? = nil
                    expect(string.isNilOrEmpty).to(beTrue())
                    expect(string.isNotNilOrEmpty).to(beFalse())
                    
                    string = ""
                    expect(string.isNilOrEmpty).to(beTrue())
                    expect(string.isNotNilOrEmpty).to(beFalse())
                    
                    string = "a string"
                    expect(string.isNilOrEmpty).to(beFalse())
                    expect(string.isNotNilOrEmpty).to(beTrue())
                }
            }
        }
    }
}

// swiftlint:enable discouraged_optional_collection redundant_optional_initialization
