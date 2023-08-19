// IncrementDecrementSpec.swift
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

final class IncrementDecrementSpec: QuickSpec {
    override class func spec() {
        describe("the ++ operator") {
            it("adds 1 to its argument") {
                var x = 21
                x++
                expect(x).to(equal(22))
            }
        }
        
        describe("the -- operator") {
            it("subtracts 1 from its argument") {
                var x = 21
                x--
                expect(x).to(equal(20))
            }
        }
    }
}
