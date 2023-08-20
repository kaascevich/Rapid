// RootsSpec.swift
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

final class RootsSpec: QuickSpec {
    override class func spec() {
        describe("square roots") {
            it("returns the square root of a decimal") {
                expect(√2.2).to(equal(1.483_239_697_419_132_6))
            }
            
            it("returns the square root of an integer") {
                expect(√64).to(equal(8))
            }
            
            it("fails with negative radicands") {
                let squareRootOfNegativeFour = √(-4)
                expect(squareRootOfNegativeFour.isNaN).to(beTrue())
            }
            
            it("does what the doc comment says it does") {
                func hypotenuse(_ a: Double, _ b: Double) -> Double {
                    √(a*a + b*b)
                }
                
                let (dx, dy) = (3.0, 4.0)
                let distance = hypotenuse(dx, dy)
                expect(distance).to(equal(5))
            }
        }
    }
}
