// BooleansSpec.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

import Quick
import Nimble
@testable import Rapid

final class BooleansSpec: QuickSpec {
  override class func spec() {
    describe("the asInt property") {
      it("is 1 if the value is true, 0 otherwise") {
        expect(true.asInt).to(equal(1))
        expect(false.asInt).to(equal(0))
      }
    }
    
    describe("the init(fromInt:) initializer") {
      it("returns false if the value is 0, true otherwise") {
        expect(Bool(fromInt: 0)).to(beFalse())
        expect(Bool(fromInt: 1)).to(beTrue())
        expect(Bool(fromInt: 42)).to(beTrue())
        expect(Bool(fromInt: -1)).to(beTrue())
      }
    }
  }
}
