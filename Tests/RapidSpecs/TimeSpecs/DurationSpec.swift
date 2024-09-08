// DurationSpec.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

import Quick
import Nimble
@testable import Rapid

@available(iOS 16, tvOS 16, watchOS 9, *)
final class DurationSpec: QuickSpec {
  override class func spec() {
    describe("the minutes(_:) methods") {
      it("returns the parameter times 60, in seconds") {
        expect(Duration.minutes(47)).to(equal(.seconds(2820)))
        expect(Duration.minutes(26.35)).to(equal(.seconds(1581)))
      }
    }
    
    describe("the hours(_:) methods") {
      it("returns the parameter times 60, in minutes") {
        expect(Duration.hours(23)).to(equal(.minutes(1380)))
        expect(Duration.hours(16.45)).to(equal(.minutes(987)))
      }
    }
    
    describe("the days(_:) methods") {
      it("returns the parameter times 24, in hours") {
        expect(Duration.days(38)).to(equal(.hours(912)))
        expect(Duration.days(13.1)).to(equal(.hours(314.4)))
      }
    }
    
    describe("the weeks(_:) methods") {
      it("returns the parameter times 7, in days") {
        expect(Duration.weeks(21)).to(equal(.days(147)))
        expect(Duration.weeks(94.75)).to(equal(.days(663.25)))
      }
    }
  }
}
