// FactorialsSpec.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

import Quick
import Nimble
@testable import Rapid

final class FactorialsSpec: QuickSpec {
  override class func spec() {
    describe("the factorial() method") {
      it("returns the value's factorial") {
        expect(6.factorial()).to(equal(720))
      }
      
      it("returns 1 when the value is 0") {
        expect(0.factorial()).to(equal(1))
      }
      
      it("asserts when the value is negative") {
        expect((-4).factorial()).to(throwAssertion())
      }
    }
  }
}
