// StringifySpec.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

import Quick
import Nimble
@testable import Rapid

final class StringifySpec: QuickSpec {
  override class func spec() {
    describe("the § operator") {
      it("returns the value's description") {
        let int = 6
        let double = 3.14
        let string = "hello"
        let array = [1, 2, 3]
        let bool = true
        
        expect(§int).to(equal("6"))
        expect(§double).to(equal("3.14"))
        expect(§string).to(equal("hello"))
        expect(§array).to(equal("[1, 2, 3]"))
        expect(§bool).to(equal("true"))
      }
    }
  }
}
