// InterpolationSpec.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

#if canImport(Foundation)
import Foundation
#endif

import Quick
import Nimble
@testable import Rapid

final class InterpolationSpec: QuickSpec {
  override class func spec() {
    #if canImport(Foundation)
    if #available(iOS 15, tvOS 15, watchOS 9, *) {
      describe("the (_:format:) string interpolation") {
        it("formats a value") {
          let priceString = "Your total is \(42.6921, format: .currency(code: "USD"))."
          expect(priceString).to(equal("Your total is $42.69."))
        }
      }
    }
    #endif
    
    describe("the (_:if:) string interpolation") {
      it("only interpolates the value if the condition is true") {
        expect("\("test", if: true)").to(equal("test"))
        expect("\("test", if: false)").to(equal(""))
      }
    }
  }
}
