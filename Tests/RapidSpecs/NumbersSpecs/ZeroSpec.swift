// ZeroSpec.swift
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

final class ZeroSpec: QuickSpec {
    override class func spec() {
        describe("the isZero property") {
            it("is true if the value is zero") {
                expect(0.isZero).to(beTrue())
            }
            
            it("is false if the value is positive") {
                expect(5.isZero).to(beFalse())
            }
            
            it("is false if the value is negative") {
                expect((-5).isZero).to(beFalse())
            }
        }
        
        describe("the isNonzero property") {
            it("is false if the value is zero") {
                expect(0.isNonzero).to(beFalse())
            }
            
            it("is true if the value is positive") {
                expect(5.isNonzero).to(beTrue())
            }
            
            it("is true if the value is negative") {
                expect((-5).isNonzero).to(beTrue())
            }
        }
    }
}
