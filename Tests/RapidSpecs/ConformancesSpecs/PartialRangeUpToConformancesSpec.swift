// PartialRangeUpToConformancesSpec.swift
// Copyright © 2023 Kaleb A. Ascevich
//
// This package is free software: you can redistribute it and/or modify it
// under the terms of the GNU General Public License as published by the
// Free Software Foundation, either version 3 of the License, or (at your
// option) any later version.
//
// This package is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
// FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
// for more details.
//
// You should have received a copy of the GNU General Public License along
// with this package. If not, see https://www.gnu.org/licenses/.

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
