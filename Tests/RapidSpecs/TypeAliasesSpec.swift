// TypeAliasesSpec.swift
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

final class TypeAliasesSpec: QuickSpec {
    override class func spec() {
        describe("the UnicodeScalarType type alias") {
            it("changes the default type of Unicode scalar literals to Unicode.Scalar") {
                expect("\u{263a}").to(beAnInstanceOf(Unicode.Scalar.self))
            }
        }
        
        describe("the ExtendedGraphemeClusterType type alias") {
            it("changes the default type of extended grapheme cluster literals to Character") {
                expect("\u{263a}\u{fe0f}").to(beAnInstanceOf(Character.self))
            }
            
            it("does not change the type of string literals") {
                expect("").to(beAnInstanceOf(String.self))
                expect("hello").to(beAnInstanceOf(String.self))
            }
        }
    }
}
