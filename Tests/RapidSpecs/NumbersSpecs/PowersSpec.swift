// PowersSpec.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

#if canImport(Foundation)

import Quick
import Nimble
@testable import Rapid

final class PowersSpec: QuickSpec {
  override class func spec() {
    describe("the ** operator") {
      it("raises the first value to the second") {
        expect(6 ** 3).to(equal(216))
      }
    }
    
    describe("the **= operator") {
      it("raises the first value to the second and assigns the result") {
        var x = 3.0
        x **= 5
        expect(x).to(equal(243))
      }
    }
  }
}

#endif
