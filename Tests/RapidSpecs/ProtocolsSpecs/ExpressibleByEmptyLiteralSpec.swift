// ExpressibleByEmptyLiteralSpec.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

import Quick
import Nimble
@testable import Rapid

final class ExpressibleByEmptyLiteralSpec: QuickSpec {
  override class func spec() {
    describe("the ExpressibleByEmptyArrayLiteral protocol") {
      struct EmptyArrayLiteralMock: ExpressibleByEmptyArrayLiteral {
        init(emptyArrayLiteral: Nothing) { }
      }
      
      it("only allows initialization with an empty literal") {
        // There isn't much we can do beyond this, since we can't really
        // test compile-time guarantees.
        let _: EmptyArrayLiteralMock = []
      }
    }
    
    describe("the ExpressibleByEmptyDictionaryLiteral protocol") {
      struct EmptyDictionaryLiteralMock: ExpressibleByEmptyDictionaryLiteral {
        init(emptyDictionaryLiteral: Nothing) { }
      }
      
      it("only allows initialization with an empty literal") {
        // There isn't much we can do beyond this, since we can't really
        // test compile-time guarantees.
        let _: EmptyDictionaryLiteralMock = [:]
      }
    }
  }
}
