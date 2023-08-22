// SimpleResultBuilderSpec.swift
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

final class SimpleResultBuilderSpec: QuickSpec {
    override class func spec() {
        describe("the StringBuilder result builder") {
            it("creates a String from a result builder") {
                let theAnswer = String {
                    "6 times 9 is "
                    if 6 * 9 != 42 {
                        "not "
                    }
                    "42."
                }
                
                expect(theAnswer).to(equal("6 times 9 is not 42."))
            }
            
            it("implements all the result builder methods") {
                let notTrue = false // bypassing the "will never be executed" warning
                let aBunchOfRandomThings = String {
                    "hello "
                    if true {
                        "yes "
                    }
                    
                    if notTrue {
                        "if "
                    } else {
                        "else "
                    }
                    
                    for i in 1...5 {
                        §i
                    }
                    
                    if #available(macOS 14, *) {
                        " Sonoma"
                    }
                }
                
                if #available(macOS 14, *) {
                    expect(aBunchOfRandomThings).to(equal("hello yes else 12345 Sonoma"))
                } else {
                    expect(aBunchOfRandomThings).to(equal("hello yes else 12345"))
                }
            }
        }
        
        describe("the ArrayBuilder result builder") {
            it("creates an Array from a result builder") {
                // Contrived? Yes. But it works.
                let primes: [Int] = Array {
                    2; 3; 5; 7; 11
                    13; 17; 19; 23
                }
                
                expect(primes).to(equal([2, 3, 5, 7, 11, 13, 17, 19, 23]))
            }
        }
    }
}
