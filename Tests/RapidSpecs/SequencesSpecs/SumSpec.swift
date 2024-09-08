// SumSpec.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

import Quick
import Nimble
@testable import Rapid

final class SumSpec: QuickSpec {
  override class func spec() {
    describe("the sum() method") {
      it("returns the sum of the elements") {
        expect((1...10).sum()).to(equal(55))
      }
    }
    
    describe("the product() method") {
      it("returns the product of the elements") {
        expect((1...5).product()).to(equal(120))
      }
    }
  }
}
