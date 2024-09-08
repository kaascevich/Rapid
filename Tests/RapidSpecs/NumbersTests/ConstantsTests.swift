// ConstantsTests.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

import Testing
@testable import Rapid

@Suite struct ConstantsTests {
  /// The `π` constant is equal to `Double.pi`.
  @Test("π") func pi() {
    #expect(π == Double.pi)
  }
}
