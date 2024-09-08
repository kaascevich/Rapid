// EvenOddSpec.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

import Quick
import Nimble
@testable import Rapid

final class EvenOddSpec: QuickSpec {
  override class func spec() {
    describe("the isEven property") {
      it("is true if the value is even") {
        expect(6.isEven).to(beTrue())
      }
      
      it("is false if the value is odd") {
        expect((-3).isEven).to(beFalse())
      }
      
      it("is true if the value is zero") {
        expect(0.isEven).to(beTrue())
      }
    }
    
    describe("the isOdd property") {
      it("is true if the value is odd") {
        expect(3.isOdd).to(beTrue())
      }
      
      it("is false if the value is even") {
        expect((-6).isOdd).to(beFalse())
      }
      
      it("is false if the value is zero") {
        expect(0.isOdd).to(beFalse())
      }
    }
  }
}
