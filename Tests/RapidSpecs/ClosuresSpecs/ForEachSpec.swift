// ForEachSpec.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

import Quick
import Nimble
@testable import Rapid

final class ForEachSpec: QuickSpec {
  override class func spec() {
    describe("the repeat(_:) method") {
      it("runs a closure multiple times") {
        var string = ""
        5.repeat { number in
          string.append(String(number))
        }
        expect(string).to(equal("01234"))
      }
    }
  }
}
