// This file is part of Rapid.
// Copyright © 2024-2025 Kaleb A. Ascevich
//
// Rapid is free software: you can redistribute it and/or modify it under the
// terms of the GNU Affero General Public License (GNU AGPL) as published by the
// Free Software Foundation, either version 3 of the License, or (at your
// option) any later version.
//
// Rapid is distributed in the hope that it will be useful, but WITHOUT ANY
// WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
// A PARTICULAR PURPOSE. See the GNU AGPL for more details.
//
// You should have received a copy of the GNU AGPL along with Rapid. If not, see
// <https://www.gnu.org/licenses/>.

import Foundation
import Testing

@testable import Rapid

@Suite struct ClosuresTests {
  /// The `run(closure:)` function executes a closure.
  @Test("run(closure:)") func run() {
    let sixPlusOne = Rapid.run {
      var six = 6
      six += 1
      return six
    }

    #expect(sixPlusOne == 7)
  }

  /// The `run(with:do:)` function executes a closure, passing it the value.
  @Test("run(with:do:)") func runWith() {
    Rapid.run(with: 42) {
      #expect($0 == 42)
    }
  }

  /// The `configure(_:using:)` function mutates a copy of a value.
  @Test("configure(_:using:)") func configure() {
    let formatter = Rapid.configure(NumberFormatter()) {
      $0.numberStyle = .decimal
      $0.minimumFractionDigits = 2
      $0.allowsFloats = true
    }

    #expect(formatter.numberStyle == .decimal)
    #expect(formatter.minimumFractionDigits == 2)
    #expect(formatter.allowsFloats)
  }

  /// The `<-(_:closure:)` operator mutates a copy of a value.
  @Test("<-(_:closure:)") func configureOperator() {
    let formatter = NumberFormatter() <- {
      $0.numberStyle = .decimal
      $0.minimumFractionDigits = 2
      $0.allowsFloats = true
    }

    #expect(formatter.numberStyle == .decimal)
    #expect(formatter.minimumFractionDigits == 2)
    #expect(formatter.allowsFloats)
  }

  /// The `mutate(_:using:)` function mutates a value directly.
  @Test("mutate(_:using:)") func mutate() {
    var formatter = NumberFormatter()
    Rapid.mutate(&formatter) {
      $0.numberStyle = .decimal
      $0.minimumFractionDigits = 2
      $0.allowsFloats = true
    }

    #expect(formatter.numberStyle == .decimal)
    #expect(formatter.minimumFractionDigits == 2)
    #expect(formatter.allowsFloats)
  }
}
