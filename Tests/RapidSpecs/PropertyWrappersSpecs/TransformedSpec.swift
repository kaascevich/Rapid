// TransformedSpec.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

import Quick
import Nimble
@testable import Rapid

final class TransformedSpec: QuickSpec {
  override class func spec() {
    describe("the @Transformed property wrapper") {
      it("transforms a value using the given closure") {
        @Transformed(with: -) var value = 5
        expect(value).to(equal(-5))
        
        value = -346
        expect(value).to(equal(346))
      }
    }
  }
}
