// UnwrapOrThrowSpec.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

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
    
    describe("the !! operator") {
      it("returns the unwrapped value if it exists") {
        expect(
          Int("100") !! fatalError("The input is invalid!")
        ).to(equal(100))
      }
      
      it("calls the never-returning function if the value is nil") {
        expect(
          Int("invalid-input") !! fatalError("The input is invalid!")
        ).to(throwAssertion())
      }
    }
  }
}
