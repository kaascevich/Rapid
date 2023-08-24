// UnwrapOrThrowSpec.swift
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

final class UnwrapOrThrowSpec: QuickSpec {
    override class func spec() {
        describe("the ?! operator") {
            enum SomeError: Error { case ohNo }
            func getError() -> SomeError {
                getErrorWasCalled = true
                return .ohNo
            }
            
            var getErrorWasCalled = false
            beforeEach {
                getErrorWasCalled = false
            }
            
            it("returns the unwrapped value if it exists") {
                expect(
                    try Int("100") ?! getError()
                ).to(equal(100))
                
                expect(getErrorWasCalled).to(beFalse())
            }
            
            it("throws the error if the value is nil") {
                expect(
                    try Int("invalid-input") ?! getError()
                ).to(throwError())
                
                expect(getErrorWasCalled).to(beTrue())
            }
        }
    }
}
