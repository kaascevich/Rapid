// ValidatedSpec.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

import Quick
import Nimble
@testable import Rapid

final class ValidatedSpec: QuickSpec {
  override class func spec() {
    describe("the @Validated property wrapper") {
      it("only allows mutations if they pass validation") {
        func isInRange(value: Int) -> Bool {
          (5...10).contains(value)
        }
        
        @Validated(if: isInRange) var value = 7
        
        value = 29
        expect(value).to(equal(7))
        
        value = 9
        expect(value).to(equal(9))
      }
    }
  }
}
