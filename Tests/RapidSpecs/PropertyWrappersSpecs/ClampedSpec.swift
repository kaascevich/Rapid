// ClampedSpec.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

import Quick
import Nimble
@testable import Rapid

final class ClampedSpec: QuickSpec {
  override class func spec() {
    describe("the @Clamped property wrapper") {
      it("clamps the value to the given range") {
        @Clamped(to: 3...15) var value = 7
        
        value = 22
        expect(value).to(equal(15))
        
        value = -4
        expect(value).to(equal(3))
        
        value = 9
        expect(value).to(equal(9))
      }
    }
  }
}
