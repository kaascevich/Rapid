// BooleansTests.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

import Testing
@testable import Rapid

@Suite struct BooleansTests {
  /// The `asInt` property is `1` if the value is `true`, `0` otherwise.
  @Test("asInt") func asInt() {
    #expect(true.asInt == 1)
    #expect(false.asInt == 0)
  }
  
  /// The `init(fromInt:)` initializer returns `false` if the value is `0`,
  /// `true` otherwise.
  @Test("init(fromInt:)") func initFromInt() {
    #expect(Bool(fromInt: 0) == false)
    #expect(Bool(fromInt: 1) == true)
    #expect(Bool(fromInt: 42) == true)
    #expect(Bool(fromInt: -1) == true)
  }
}
