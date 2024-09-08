// DurationSpec.swift
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
