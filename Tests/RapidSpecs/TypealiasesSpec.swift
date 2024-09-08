// TypealiasesSpec.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

import Quick
import Nimble
@testable import Rapid

final class TypealiasesSpec: QuickSpec {
  override class func spec() {
    // We can't use to(equal()) because metatypes can't conform to
    // Equatable. We have to use the global == operator instead.
    
    describe("AnyType") {
      it("is a typealias for Any.Type") {
        expect(AnyType.self == Any.Type.self).to(beTrue())
      }
    }
    
    describe("Nothing") {
      it("is a typealias for Void") {
        expect(Nothing.self == Void.self).to(beTrue())
      }
    }
  }
}
