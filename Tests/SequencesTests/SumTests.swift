// SPDX-FileCopyrightText: 2024 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

import TestHelpers
import Testing

@testable import Rapid

@Suite struct SumTests {
  /// The `sum()` method returns the sum of the elements.
  @Test func `sum()`() {
    #expect((1...10).sum() == 55)
  }

  /// The `product()` method returns the product of the elements.
  @Test func `product()`() {
    #expect((1...5).product() == 120)
  }
}
