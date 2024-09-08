// SafeAccessSpec.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

import Quick
import Nimble
@testable import Rapid

final class SafeAccessSpec: QuickSpec {
  override class func spec() {
    describe("the (safe:) subscript") {
      let streets = ["Adams", "Bryant", "Channing", "Douglas", "Evarts"]
      
      it("returns the value at that index if it exists") {
        let validStreet = streets[ifExists: 1]
        expect(validStreet).to(equal("Bryant"))
      }
      
      it("returns nil if the value at that index does not exist") {
        let invalidStreet = streets[ifExists: 7]
        expect(invalidStreet).to(beNil())
      }
      
      it("returns nil if passed the end index") {
        let invalidStreet = streets[ifExists: streets.endIndex]
        expect(invalidStreet).to(beNil())
      }
    }
  }
}
