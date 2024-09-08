// ClampSpec.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

import Quick
import Nimble
@testable import Rapid

final class ClampSpec: QuickSpec {
  override class func spec() {
    describe("the clamped(to:) method") {
      it("returns the value if it is in the given range") {
        expect(7.clamped(to: 6...12)).to(equal(7))
        expect(0.32.clamped(to: 0.31...0.33)).to(equal(0.32))
      }
      
      it("clamps the value otherwise") {
        expect(1.clamped(to: 5...7)).to(equal(5))
        expect("e".clamped(to: "a"..."d")).to(equal("d"))
      }
    }
    
    describe("the clamp(to:) method") {
      it("does not change the value if it is in the given range") {
        var seven = 7, point32 = 0.32
        
        seven.clamp(to: 6...12)
        point32.clamp(to: 0.31...0.33)
        
        expect(seven).to(equal(7))
        expect(point32).to(equal(0.32))
      }
      
      it("clamps the value otherwise") {
        var one = 1, e = "e"
        
        one.clamp(to: 5...7)
        e.clamp(to: "a"..."d")
        
        expect(one).to(equal(5))
        expect(e).to(equal("d"))
      }
    }
  }
}
