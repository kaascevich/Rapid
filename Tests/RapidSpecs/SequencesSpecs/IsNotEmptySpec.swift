// IsNotEmptySpec.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

import Quick
import Nimble
@testable import Rapid

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
