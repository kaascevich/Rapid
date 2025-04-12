// This file is part of BrainflipKit.
// Copyright © 2024-2025 Kaleb A. Ascevich
//
// BrainflipKit is free software: you can redistribute it and/or modify it under
// the terms of the GNU Affero General Public License (GNU AGPL) as published by
// the Free Software Foundation, either version 3 of the License, or (at your
// option) any later version.
//
// BrainflipKit is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
// FOR A PARTICULAR PURPOSE. See the GNU AGPL for more details.
//
// You should have received a copy of the GNU AGPL along with BrainflipKit. If
// not, see <https://www.gnu.org/licenses/>.

import Testing
@testable import Rapid

@Suite struct EmptyCollectionConformancesTests {
  /// `EmptyCollection`'s conformance to `ExpressibleByEmptyArrayLiteral` only
  /// allows an empty literal.
  @Test("EmptyCollection+ExpressibleByEmptyArrayLiteral")
  func emptyCollectionEmptyArrayLiteral() {
    // If this compiles, we're good to go.
    let _: EmptyCollection<Int> = [] // adding an element should throw a compiler error
  }

  /// `EmptyCollection`'s conformance to `ExpressibleByEmptyDictionaryLiteral`
  /// only allows an empty literal.
  @Test("EmptyCollection+ExpressibleByEmptyDictionaryLiteral")
  func emptyCollectionEmptyDictionaryLiteral() {
    // If this compiles, we're good to go.
    let _: EmptyCollection<Int> = [:] // adding an element should throw a compiler error
  }
}
