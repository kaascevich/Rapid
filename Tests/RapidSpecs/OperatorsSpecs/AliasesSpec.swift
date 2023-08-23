// AliasesSpec.swift
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

final class AliasesSpec: QuickSpec {
    override class func spec() {
        describe("the not-equal-to operator, ≠") {
            it("returns true if the values are not equal") {
                expect(8 ≠ 4).to(beTrue())
                expect(true ≠ false).to(beTrue())
                expect("hi" ≠ "bye").to(beTrue())
            }
            
            it("returns false if the values are equal") {
                expect(8 ≠ 8).to(beFalse())
                expect(true ≠ true).to(beFalse())
                expect("hi" ≠ "hi").to(beFalse())
            }
        }
        
        describe("the comparison-or-equal operators") {
            describe("the less-than-or-equal-to operator, ≤") {
                it("returns true if the first value is less than the second") {
                    expect(42 ≤ 69).to(beTrue())
                    expect("a" ≤ "b").to(beTrue())
                }
                
                it("returns true if the first value is equal to the second") {
                    expect(42 ≤ 42).to(beTrue())
                    expect("a" ≤ "a").to(beTrue())
                }
                
                it("returns false if the first value is greater than the second") {
                    expect(69 ≤ 42).to(beFalse())
                    expect("b" ≤ "a").to(beFalse())
                }
            }
            
            describe("the greater-than-or-equal-to operator, ≥") {
                it("returns true if the first value is greater than the second") {
                    expect(69 ≥ 42).to(beTrue())
                    expect("b" ≥ "a").to(beTrue())
                }
                
                it("returns true if the first value is equal to the second") {
                    expect(42 ≥ 42).to(beTrue())
                    expect("a" ≥ "a").to(beTrue())
                }
                
                it("returns false if the first value is less than the second") {
                    expect(42 ≥ 69).to(beFalse())
                    expect("a" ≥ "b").to(beFalse())
                }
            }
        }
    }
}
