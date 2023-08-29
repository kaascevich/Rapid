// AnyEquatableSpec.swift
// Copyright © 2023 Kaleb A. Ascevich
//
// This package is free software: you can redistribute it and/or modify it
// under the terms of the GNU General Public License as published by the
// Free Software Foundation, either version 3 of the License, or (at your
// option) any later version.
//
// This package is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
// FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
// for more details.
//
// You should have received a copy of the GNU General Public License along
// with this package. If not, see https://www.gnu.org/licenses/.

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
