// This file is part of BrainflipKit.
// Copyright © 2024-2025 Kaleb A. Ascevich
//
// BrainflipKit is free software: you can redistribute it and/or modify it under
// the terms of the GNU Affero General Public License (GNU AGPL) as published by
// the Free Software Foundation, either version 3 of the License, or (at your
// option) any later version.
//
// BrainflipKit is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
// FOR A PARTICULAR PURPOSE. See the GNU AGPL for more details.
//
// You should have received a copy of the GNU AGPL along with BrainflipKit. If
// not, see <https://www.gnu.org/licenses/>.

import Testing

@testable import Rapid

@Suite struct DurationTests {
  /// The `minutes(_:)` methods return the parameter times 60, in seconds.
  @available(macOS 13, iOS 16, tvOS 16, watchOS 9, *)
  @Test("minutes(_:)") func minutes() {
    #expect(Duration.minutes(47) == .seconds(2820))
    #expect(Duration.minutes(26.35) == .seconds(1581))
  }

  /// The `hours(_:)` methods return the parameter times 60, in minutes.
  @available(macOS 13, iOS 16, tvOS 16, watchOS 9, *)
  @Test("hours(_:)") func hours() {
    #expect(Duration.hours(23) == .minutes(1380))
    #expect(Duration.hours(16.45) == .minutes(987))
  }

  /// The `days(_:)` methods return the parameter times 24, in hours.
  @available(macOS 13, iOS 16, tvOS 16, watchOS 9, *)
  @Test("days(_:)") func days() {
    #expect(Duration.days(38) == .hours(912))
    #expect(Duration.days(13.1) == .hours(314.4))
  }

  /// The `weeks(_:)` methods return the parameter times 7, in days.
  @available(macOS 13, iOS 16, tvOS 16, watchOS 9, *)
  @Test("weeks(_:)") func weeks() {
    #expect(Duration.weeks(21) == .days(147))
    #expect(Duration.weeks(94.75) == .days(663.25))
  }
}
