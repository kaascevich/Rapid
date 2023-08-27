// BetweenSpec.swift
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

final class BetweenSpec: QuickSpec {
    override class func spec() {
        describe("the isBetween(_:) method") {
            it("returns true if the range contains the value") {
                expect(7.isBetween(6...12)).to(beTrue())
                expect(0.32.isBetween(0.31...0.33)).to(beTrue())
            }
            
            it("returns false if the range does not contain the value") {
                expect(1.isBetween(5...7)).to(beFalse())
                expect("e".isBetween("a"..."d")).to(beFalse())
                expect(69.isBetween(42..<69)).to(beFalse())
            }
        }
    }
}
