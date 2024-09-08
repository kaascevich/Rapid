// IsNilSpec.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

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
