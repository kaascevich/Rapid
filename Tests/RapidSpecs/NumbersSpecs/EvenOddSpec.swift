// EvenOddSpec.swift
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

final class EvenOddSpec: QuickSpec {
  override class func spec() {
    describe("the isEven property") {
      it("is true if the value is even") {
        expect(6.isEven).to(beTrue())
      }
      
      it("is false if the value is odd") {
        expect((-3).isEven).to(beFalse())
      }
      
      it("is true if the value is zero") {
        expect(0.isEven).to(beTrue())
      }
    }
    
    describe("the isOdd property") {
      it("is true if the value is odd") {
        expect(3.isOdd).to(beTrue())
      }
      
      it("is false if the value is even") {
        expect((-6).isOdd).to(beFalse())
      }
      
      it("is false if the value is zero") {
        expect(0.isOdd).to(beFalse())
      }
    }
  }
}
