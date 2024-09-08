// ClosuresTests.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

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
