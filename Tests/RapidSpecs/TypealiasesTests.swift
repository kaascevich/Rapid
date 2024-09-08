// TypealiasesTests.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

import Testing
@testable import Rapid

@Suite struct TypealiasesTests {
  /// `AnyType` is a typealias for `Any.Type`.
  @Test("AnyType") func anyType() {
    #expect(AnyType.self == Any.Type.self)
  }
  
  /// `Nothing` is a typealias for `Void`.
  @Test("Nothing") func nothing() {
    #expect(Nothing.self == Void.self)
  }
}
