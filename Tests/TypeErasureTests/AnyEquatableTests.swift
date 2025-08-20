// Copyright © 2024-2025 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

import TestHelpers
import Testing

@testable import Rapid

@Suite struct AnyEquatableTests {
  /// The `AnyEquatable` type-erased structure hides the actual type of an
  /// `Equatable` value.
  @Test("AnyEquatable")
  func anyEquatable() {
    let something = AnyEquatable(47)
    let theSameThing = AnyEquatable(47)

    let anotherThing = AnyEquatable(13)
    let aDifferentThingEntirely = AnyEquatable("I'm an Int, I swear")

    #expect(something == theSameThing)
    #expect(something != anotherThing)
    #expect(something != aDifferentThingEntirely)
  }
}
