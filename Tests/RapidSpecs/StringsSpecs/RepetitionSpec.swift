// RepetitionSpec.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

import Quick
import Nimble
@testable import Rapid

final class RepetitionSpec: QuickSpec {
  override class func spec() {
    describe("the * operator when used with strings") {
      it("creates a String repeated the specified number of times") {
        expect("hello" * 3).to(equal("hellohellohello"))
      }
      
      it("fails if the count is negative") {
        expect("error" * -13).to(throwAssertion())
      }
    }
  }
}
