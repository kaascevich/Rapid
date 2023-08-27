// ClosuresSpec.swift
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

final class ClosuresSpec: QuickSpec {
    override class func spec() {
        describe("the run(_:) function") {
            it("executes a closure") {
                let sixPlusOne = Rapid.run {
                    var six = 6
                    six += 1
                    return six
                }
                
                expect(sixPlusOne).to(beAnInstanceOf(Int.self))
                expect(sixPlusOne).to(equal(7))
            }
        }
        
        describe("the run(with:_:) function") {
            it("executes a closure, passing it the value") {
                Rapid.run(with: 42) {
                    expect($0).to(equal(42))
                }
            }
        }
        
        describe("the configure(_:_:) function") {
            it("mutates a copy of a value") {
                let formatter = configure(NumberFormatter()) {
                    $0.numberStyle = .decimal
                    $0.minimumFractionDigits = 2
                    $0.allowsFloats = true
                }
                
                expect(formatter.numberStyle).to(equal(.decimal))
                expect(formatter.minimumFractionDigits).to(equal(2))
                expect(formatter.allowsFloats).to(beTrue())
            }
        }
        
        describe("the <- operator") {
            it("mutates a copy of a value") {
                let formatter = NumberFormatter() <- {
                    $0.numberStyle = .decimal
                    $0.minimumFractionDigits = 2
                    $0.allowsFloats = true
                }
                
                expect(formatter.numberStyle).to(equal(.decimal))
                expect(formatter.minimumFractionDigits).to(equal(2))
                expect(formatter.allowsFloats).to(beTrue())
            }
        }
    }
}
