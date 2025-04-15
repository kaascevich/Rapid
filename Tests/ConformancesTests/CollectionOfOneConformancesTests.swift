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

import TestHelpers
import Testing

@testable import Rapid

@Suite struct CollectionOfOneConformancesTests {
  /// `CollectionOfOne`'s conformance to `ExpressibleByArrayLiteral` allows a
  /// literal with one element.
  @Test("CollectionOfOne+ExpressibleByArrayLiteral")
  func collectionOfOneArrayLiteral() {
    let oneElement: CollectionOfOne = [42]
    #expect(oneElement[0] == 42)
  }

  /// `CollectionOfOne`'s conformance to `ExpressibleByArrayLiteral` does not
  /// allow a literal with zero elements, or literals with two or more elements.
  @Test("CollectionOfOne+ExpressibleByArrayLiteral <- invalid", .tags(.traps))
  func collectionOfOneArrayLiteralInvalid() async {
    await #expect(crashes {
      _ = [] as CollectionOfOne
    })
    await #expect(crashes {
      _ = [42, 69] as CollectionOfOne
    })
  }
}
