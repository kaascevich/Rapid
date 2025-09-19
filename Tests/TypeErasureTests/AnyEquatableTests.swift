// SPDX-FileCopyrightText: 2024 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

import TestHelpers
import Testing

@testable import Rapid

@Suite struct AnyEquatableTests {
  /// The `AnyEquatable` type-erased structure hides the actual type of an
  /// `Equatable` value.
  @Test func `AnyEquatable`() {
    let something = Rapid.AnyEquatable(47)
    let theSameThing = Rapid.AnyEquatable(47)

    let anotherThing = Rapid.AnyEquatable(13)
    let aDifferentThingEntirely = Rapid.AnyEquatable("I'm an Int, I swear")

    #expect(something == theSameThing)
    #expect(something != anotherThing)
    #expect(something != aDifferentThingEntirely)
  }
}
