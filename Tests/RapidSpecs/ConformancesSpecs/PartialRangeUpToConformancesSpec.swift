// PartialRangeUpToConformancesSpec.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

import Quick
import Nimble
@testable import Rapid

final class PartialRangeUpToConformancesSpec: QuickSpec {
  override class func spec() {
    let range = ..<5
    
    it("conforms to Equatable") {
      expect(range).to(equal(range))
    }
    
    it("conforms to Hashable") {
      expect(range.hashValue).to(equal(range.upperBound.hashValue))
    }
    
    it("conforms to CustomStringConvertible") {
      expect(range.description).to(equal("..<\(range.upperBound)"))
    }
    
    it("conforms to CustomDebugStringConvertible") {
      expect(range.debugDescription).to(equal("PartialRangeUpTo(..<\(range.upperBound))"))
    }
  }
}
