// ConstantsSpec.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

import Quick
import Nimble
@testable import Rapid

final class ConstantsSpec: QuickSpec {
  override class func spec() {
    describe("the π constant") {
      it("is equal to Double.pi") {
        expect(π).to(equal(Double.pi))
      }
    }
  }
}
