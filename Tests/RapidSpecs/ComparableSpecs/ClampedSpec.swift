// ClampedSpec.swift
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

final class ClampedSpec: QuickSpec {
    override class func spec() {
        describe("the clamped(to:) method") {
            it("returns the value if it is in the given range") {
                expect(7.clamped(to: 6...12)).to(equal(7))
                expect(0.32.clamped(to: 0.31...0.33)).to(equal(0.32))
            }
            
            it("clamps the value otherwise") {
                expect(1.clamped(to: 5...7)).to(equal(5))
                expect("e".clamped(to: "a"..."d")).to(equal("d"))
            }
        }
        
        describe("the clamp(to:) method") {
            it("does not change the value if it is in the given range") {
                var seven = 7, point32 = 0.32
                
                seven.clamp(to: 6...12)
                point32.clamp(to: 0.31...0.33)
                
                expect(seven).to(equal(7))
                expect(point32).to(equal(0.32))
            }
            
            it("clamps the value otherwise") {
                var one = 1, e = "e"
                
                one.clamp(to: 5...7)
                e.clamp(to: "a"..."d")
                
                expect(one).to(equal(5))
                expect(e).to(equal("d"))
            }
        }
    }
}
