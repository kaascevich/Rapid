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

@Suite struct ExpressibleByEmptyLiteralTests {
  /// The `ExpressibleByEmptyArrayLiteral` protocol only allows initialization
  /// with an empty literal.
  @Test("ExpressibleByEmptyArrayLiteral")
  func expressibleByEmptyArrayLiteral() {
    struct EmptyArrayLiteralMock: ExpressibleByEmptyArrayLiteral {
      init(emptyArrayLiteral: Nothing) { }
    }

    // There isn't much we can do beyond this, since we can't really
    // test compile-time guarantees.
    let _: EmptyArrayLiteralMock = []
  }

  /// The `ExpressibleByEmptyDictionaryLiteral` protocol only allows
  /// initialization with an empty literal.
  @Test("ExpressibleByEmptyDictionaryLiteral")
  func expressibleByEmptyDictionaryLiteral() {
    struct EmptyDictionaryLiteralMock: ExpressibleByEmptyDictionaryLiteral {
      init(emptyDictionaryLiteral: Nothing) { }
    }

    // There isn't much we can do beyond this, since we can't really
    // test compile-time guarantees.
    let _: EmptyDictionaryLiteralMock = [:]
  }
}
