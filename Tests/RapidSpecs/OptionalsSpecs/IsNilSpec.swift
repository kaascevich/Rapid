// IsNilSpec.swift
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

final class IsNilSpec: QuickSpec {
    override class func spec() {
        describe("the isNil property") {
            it("is true if the optional is nil") {
                let int: Int? = nil
                expect(int.isNil).to(beTrue())
            }
            
            it("is false if the optional has a value") {
                let int: Int? = 42
                expect(int.isNil).to(beFalse())
            }
        }
        
        describe("the isNotNil property") {
            it("is false if the optional is nil") {
                let int: Int? = nil
                expect(int.isNotNil).to(beFalse())
            }
            
            it("is true if the optional has a value") {
                let int: Int? = 42
                expect(int.isNotNil).to(beTrue())
            }
        }
    }
}
