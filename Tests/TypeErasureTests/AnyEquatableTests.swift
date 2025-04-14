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
