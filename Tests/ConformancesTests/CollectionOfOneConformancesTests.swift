// SPDX-FileCopyrightText: 2024 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

import TestHelpers
import Testing

@testable import Rapid

@Suite struct CollectionOfOneConformancesTests {
  /// `CollectionOfOne`'s conformance to `ExpressibleByArrayLiteral` allows a
  /// literal with one element.
  @Test func `CollectionOfOne+ExpressibleByArrayLiteral`() {
    let oneElement: CollectionOfOne = [42]
    #expect(oneElement[0] == 42)
  }

  /// `CollectionOfOne`'s conformance to `ExpressibleByArrayLiteral` does not
  /// allow a literal with zero elements, or literals with two or more elements.
  @Test(.tags(.traps))
  func `CollectionOfOne+ExpressibleByArrayLiteral <- invalid`() async {
    await #expect(processExitsWith: .failure) {
      _ = [] as CollectionOfOne
    }
    await #expect(processExitsWith: .failure) {
      _ = [42, 69] as CollectionOfOne
    }
  }
}
