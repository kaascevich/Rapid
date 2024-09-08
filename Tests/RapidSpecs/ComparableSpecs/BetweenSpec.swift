// BetweenSpec.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

import Quick
import Nimble
@testable import Rapid

final class BetweenSpec: QuickSpec {
  override class func spec() {
    describe("the isBetween(_:) method") {
      it("returns true if the range contains the value") {
        expect(7.isBetween(6...12)).to(beTrue())
        expect(0.32.isBetween(0.31...0.33)).to(beTrue())
      }
      
      it("returns false if the range does not contain the value") {
        expect(1.isBetween(5...7)).to(beFalse())
        expect("e".isBetween("a"..."d")).to(beFalse())
        expect(69.isBetween(42..<69)).to(beFalse())
      }
    }
  }
}
