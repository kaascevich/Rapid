// SPDX-FileCopyrightText: 2024 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

import TestHelpers
import Testing

@testable import Rapid

@Suite struct ConstantsTests {
  /// The `π` constant is equal to `Double.pi`.
  @Test func `π`() {
    #expect(Rapid.π == Double.pi)
  }
}
