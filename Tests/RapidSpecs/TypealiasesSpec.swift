// TypealiasesSpec.swift
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
