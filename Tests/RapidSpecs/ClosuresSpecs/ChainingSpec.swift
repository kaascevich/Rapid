// ChainingSpec.swift
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

import Foundation
import Quick
import Nimble
@testable import Rapid

final class ChainingSpec: QuickSpec {
    override class func spec() {
        describe("the then(_:) method") {
            it("mutates a copy of a value") {
                let components = PersonNameComponents().then {
                    $0.givenName = "John"
                    $0.familyName = "Appleseed"
                }
                
                expect(components.givenName).to(equal("John"))
                expect(components.familyName).to(equal("Appleseed"))
            }
        }
        
        describe("the AnyObject then(_:) method") {
            it("mutates a value in place") {
                let formatter = NumberFormatter().then {
                    $0.numberStyle = .decimal
                    $0.minimumFractionDigits = 2
                    $0.allowsFloats = true
                }
                
                expect(formatter.numberStyle).to(equal(.decimal))
                expect(formatter.minimumFractionDigits).to(equal(2))
                expect(formatter.allowsFloats).to(beTrue())
            }
        }
        
        describe("the do(_:) method") {
            it("executes a closure, passing it self") {
                42.do {
                    expect($0).to(equal(42))
                }
            }
        }
    }
}
