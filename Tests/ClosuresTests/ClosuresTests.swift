// Copyright © 2024-2025 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

import Foundation
import TestHelpers
import Testing

@testable import Rapid

@Suite enum ClosuresTests {
  @Suite struct RunClosureTests {
    /// The `run(closure:)` function executes a closure.
    @Test("run(closure:)")
    func runClosure() {
      let sixPlusOne: Int = run {
        var six = 6
        six += 1
        return six
      }

      #expect(sixPlusOne == 7)
    }

    /// The `run(closure:)` function rethrows any thrown error.
    @Test("run(closure:) -> throws", .tags(.rethrows))
    func runClosureThrows() {
      #expect(throws: MockError.bad) {
        _ = try run {
          throw MockError.bad
        }
      }
    }
  }

  @Suite struct RunWithTests {
    /// The `run(with:do:)` function executes a closure, passing it the value.
    @Test("run(with:do:)")
    func runWith() {
      run(with: 42) {
        #expect($0 == 42)
      }
    }

    /// The `run(with:do:)` function rethrows any thrown error.
    @Test("run(with:do:) -> throws", .tags(.rethrows))
    func runWithThrows() {
      #expect(throws: MockError.bad) {
        try run(with: 42) { _ in
          throw MockError.bad
        }
      }
    }
  }

  @Suite struct ConfigureUsingTests {
    /// The `configure(_:using:)` function mutates a copy of a value.
    @Test("configure(_:using:)")
    func configureUsing() {
      let formatter: NumberFormatter = configure(NumberFormatter()) {
        $0.numberStyle = .decimal
        $0.minimumFractionDigits = 2
        $0.allowsFloats = true
      }

      #expect(formatter.numberStyle == .decimal)
      #expect(formatter.minimumFractionDigits == 2)
      #expect(formatter.allowsFloats)
    }

    /// The `configure(_:using:)` function rethrows any thrown error.
    @Test("configure(_:using:) -> throws", .tags(.rethrows))
    func configureUsingThrows() {
      #expect(throws: MockError.bad) {
        _ = try configure(NumberFormatter()) { _ in
          throw MockError.bad
        }
      }
    }

    /// The `<-(_:closure:)` operator mutates a copy of a value.
    @Test("<-(_:closure:)")
    func configureUsingOperator() {
      let formatter: NumberFormatter = NumberFormatter() <- {
        $0.numberStyle = .decimal
        $0.minimumFractionDigits = 2
        $0.allowsFloats = true
      }

      #expect(formatter.numberStyle == .decimal)
      #expect(formatter.minimumFractionDigits == 2)
      #expect(formatter.allowsFloats)
    }

    /// The `<-(_:closure:)` operator rethrows any thrown error.
    @Test("<-(_:closure:) -> throws", .tags(.rethrows))
    func configureUsingOperatorThrows() {
      #expect(throws: MockError.bad) {
        _ = try NumberFormatter() <- { _ in
          throw MockError.bad
        }
      }
    }
  }

  @Suite struct MutateUsingTests {
    /// The `mutate(_:using:)` function mutates a value directly.
    @Test("mutate(_:using:)")
    func mutateUsing() {
      var formatter = NumberFormatter()
      mutate(&formatter) {
        $0.numberStyle = .decimal
        $0.minimumFractionDigits = 2
        $0.allowsFloats = true
      }

      #expect(formatter.numberStyle == .decimal)
      #expect(formatter.minimumFractionDigits == 2)
      #expect(formatter.allowsFloats)
    }

    /// The `mutate(_:using:)` function rethrows any thrown error.
    @Test("mutate(_:using:) -> throws", .tags(.rethrows))
    func mutateUsingThrows() {
      #expect(throws: MockError.bad) {
        var formatter = NumberFormatter()
        try mutate(&formatter) { _ in
          throw MockError.bad
        }
      }
    }
  }
}
