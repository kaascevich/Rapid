// EmptyCollectionConformancesSpec.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

import Quick
import Nimble
@testable import Rapid

final class EmptyCollectionConformancesSpec: QuickSpec {
  override class func spec() {
    describe("EmptyCollection's conformance to ExpressibleByEmptyArrayLiteral") {
      it("only allows an empty literal") {
        // If this compiles, we're good to go.
        let _: EmptyCollection<Int> = [] // adding an element should throw a compiler error
      }
    }
    
    describe("EmptyCollection's conformance to ExpressibleByEmptyDictionaryLiteral") {
      it("only allows an empty literal") {
        // If this compiles, we're good to go.
        let _: EmptyCollection<Int> = [:] // adding an element should throw a compiler error
      }
    }
  }
}
