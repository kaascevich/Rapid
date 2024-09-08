// BooleansSpec.swift
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

final class BooleansSpec: QuickSpec {
  override class func spec() {
    describe("the asInt property") {
      it("is 1 if the value is true, 0 otherwise") {
        expect(true.asInt).to(equal(1))
        expect(false.asInt).to(equal(0))
      }
    }
    
    describe("the init(fromInt:) initializer") {
      it("returns false if the value is 0, true otherwise") {
        expect(Bool(fromInt: 0)).to(beFalse())
        expect(Bool(fromInt: 1)).to(beTrue())
        expect(Bool(fromInt: 42)).to(beTrue())
        expect(Bool(fromInt: -1)).to(beTrue())
      }
    }
  }
}
