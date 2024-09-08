// AnyEquatableTests.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

import Testing
@testable import Rapid

@Suite struct AnyEquatableTests {
  /// The `AnyEquatable` type-erased structure hides the actual type of an
  /// `Equatable` value.
  @Test("AnyEquatable") func anyEquatable() {
    let something = AnyEquatable(47)
    let theSameThing = AnyEquatable(47)
    
    let anotherThing = AnyEquatable(13)
    let aDifferentThingEntirely = AnyEquatable("I'm an Int, I swear")
    
    #expect(something == theSameThing)
    #expect(something != anotherThing)
    #expect(something != aDifferentThingEntirely)
  }
}
