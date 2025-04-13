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

import CwlPreconditionTesting
import Testing

@testable import Rapid

@Suite struct FactorialsTests {
  /// The `factorial()` method returns the value's factorial.
  @Test("factorial()") func factorial() {
    #expect(6.factorial() == 720)
  }

  /// The `factorial()` method returns `1` when the value is `0`.
  @Test("factorial() <- 0") func factorialZero() {
    #expect(0.factorial() == 1)
  }

  /// The `factorial()` method asserts when the value is negative.
  @Test("factorial() <- negative") func factorialNegative() {
    #expect(catchBadInstruction { _ = (-4).factorial() } != nil)
  }
}
