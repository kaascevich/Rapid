// AnyEquatableSpec.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

import Quick
import Nimble
@testable import Rapid

final class AnyEquatableSpec: QuickSpec {
  override class func spec() {
    describe("the AnyEquatable type-erased structure") {
      it("hides the actual type of an Equatable value") {
        let something = AnyEquatable(47)
        let theSameThing = AnyEquatable(47)
        
        let anotherThing = AnyEquatable(13)
        let aDifferentThingEntirely = AnyEquatable("I'm an Int, I swear")
        
        expect(something).to(equal(theSameThing))
        expect(something).toNot(equal(anotherThing))
        expect(something).toNot(equal(aDifferentThingEntirely))
      }
    }
  }
}
