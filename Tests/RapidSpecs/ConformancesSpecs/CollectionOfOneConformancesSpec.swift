// CollectionOfOneConformancesSpec.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

import Quick
import Nimble
@testable import Rapid

final class CollectionOfOneConformancesSpec: QuickSpec {
  override class func spec() {
    describe("CollectionOfOne's conformance to ExpressibleByArrayLiteral") {
      it("only allows a literal with one element") {
        let oneElement: CollectionOfOne = [42]
        expect(oneElement[0]).to(equal(42))
        
        expect([] as CollectionOfOne).to(throwAssertion())
        expect([42, 69] as CollectionOfOne).to(throwAssertion())
      }
    }
  }
}
