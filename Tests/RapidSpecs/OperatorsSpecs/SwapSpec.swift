// SwapSpec.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

import Quick
import Nimble
@testable import Rapid

final class SwapSpec: QuickSpec {
  override class func spec() {
    describe("the <=> operator") {
      it("swaps two values") {
        var fortyTwo = 42
        var sixtyNine = 69
        fortyTwo <=> sixtyNine
        
        expect(fortyTwo).to(equal(69))
        expect(sixtyNine).to(equal(42))
      }
    }
  }
}
