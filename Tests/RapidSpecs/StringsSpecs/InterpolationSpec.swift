// InterpolationSpec.swift
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

#if canImport(Foundation)
import Foundation
#endif

import Quick
import Nimble
@testable import Rapid

final class InterpolationSpec: QuickSpec {
    override class func spec() {
        #if canImport(Foundation)
        if #available(iOS 15, tvOS 15, watchOS 9, *) {
            describe("the (_:format:) string interpolation") {
                it("formats a value") {
                    let priceString = "Your total is \(42.6921, format: .currency(code: "USD"))."
                    expect(priceString).to(equal("Your total is $42.69."))
                }
            }
        }
        #endif
        
        describe("the (_:if:) string interpolation") {
            it("only interpolates the value if the condition is true") {
                expect("\("test", if: true)").to(equal("test"))
                expect("\("test", if: false)").to(equal(""))
            }
        }
    }
}
