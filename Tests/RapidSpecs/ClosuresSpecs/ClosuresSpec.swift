// ClosuresSpec.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

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
    
    describe("the mutate(_:using:) function") {
      it("mutates a value directly") {
        var formatter = NumberFormatter()
        mutate(&formatter) {
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
