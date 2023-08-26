// StringifySpec.swift
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
