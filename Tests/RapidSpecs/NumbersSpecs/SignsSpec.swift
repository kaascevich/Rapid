// SignsSpec.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

import Quick
import Nimble
@testable import Rapid

final class SignsSpec: QuickSpec {
  override class func spec() {
    describe("the isPositive property") {
      it("is true if the value is positive") {
        expect(42.isPositive).to(beTrue())
      }
      
      it("is false if the value is negative") {
        expect((-69).isPositive).to(beFalse())
      }
      
      it("is false if the value is zero") {
        expect(0.isPositive).to(beFalse())
      }
    }
    
    describe("the isNegative property") {
      it("is false if the value is positive") {
        expect(42.isNegative).to(beFalse())
      }
      
      it("is true if the value is negative") {
        expect((-69).isNegative).to(beTrue())
      }
      
      it("is false if the value is zero") {
        expect(0.isNegative).to(beFalse())
      }
    }
    
    describe("the absoluteValue property") {
      it("is the value itself when the value is positive") {
        expect(42.absoluteValue).to(equal(42))
      }
      
      it("is the value's additive inverse when the value is negative") {
        expect((-69).absoluteValue).to(equal(69))
      }
      
      it("is zero if the value is zero") {
        expect(0.absoluteValue).to(equal(0))
      }
    }
  }
}
