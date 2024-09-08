// AliasesSpec.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

import Quick
import Nimble
@testable import Rapid

final class AliasesSpec: QuickSpec {
  override class func spec() {
    describe("the not-equal-to operator, ≠") {
      it("returns true if the values are not equal") {
        expect(8 ≠ 4).to(beTrue())
        expect(true ≠ false).to(beTrue())
        expect("hi" ≠ "bye").to(beTrue())
      }
      
      it("returns false if the values are equal") {
        expect(8 ≠ 8).to(beFalse())
        expect(true ≠ true).to(beFalse())
        expect("hi" ≠ "hi").to(beFalse())
      }
    }
    
    describe("the comparison-or-equal operators") {
      describe("the less-than-or-equal-to operator, ≤") {
        it("returns true if the first value is less than the second") {
          expect(42 ≤ 69).to(beTrue())
          expect("a" ≤ "b").to(beTrue())
        }
        
        it("returns true if the first value is equal to the second") {
          expect(42 ≤ 42).to(beTrue())
          expect("a" ≤ "a").to(beTrue())
        }
        
        it("returns false if the first value is greater than the second") {
          expect(69 ≤ 42).to(beFalse())
          expect("b" ≤ "a").to(beFalse())
        }
      }
      
      describe("the greater-than-or-equal-to operator, ≥") {
        it("returns true if the first value is greater than the second") {
          expect(69 ≥ 42).to(beTrue())
          expect("b" ≥ "a").to(beTrue())
        }
        
        it("returns true if the first value is equal to the second") {
          expect(42 ≥ 42).to(beTrue())
          expect("a" ≥ "a").to(beTrue())
        }
        
        it("returns false if the first value is less than the second") {
          expect(42 ≥ 69).to(beFalse())
          expect("a" ≥ "b").to(beFalse())
        }
      }
    }
  }
}
