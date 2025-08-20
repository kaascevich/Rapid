// Copyright © 2024-2025 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

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
