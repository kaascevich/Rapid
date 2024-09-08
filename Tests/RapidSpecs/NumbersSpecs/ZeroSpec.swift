// ZeroSpec.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

import Quick
import Nimble
@testable import Rapid

final class ZeroSpec: QuickSpec {
  override class func spec() {
    describe("the isZero property") {
      it("is true if the value is zero") {
        expect(0.isZero).to(beTrue())
      }
      
      it("is false if the value is positive") {
        expect(5.isZero).to(beFalse())
      }
      
      it("is false if the value is negative") {
        expect((-5).isZero).to(beFalse())
      }
    }
    
    describe("the isNonzero property") {
      it("is false if the value is zero") {
        expect(0.isNonzero).to(beFalse())
      }
      
      it("is true if the value is positive") {
        expect(5.isNonzero).to(beTrue())
      }
      
      it("is true if the value is negative") {
        expect((-5).isNonzero).to(beTrue())
      }
    }
  }
}
