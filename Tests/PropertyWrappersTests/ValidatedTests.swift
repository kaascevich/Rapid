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

import func CwlPreconditionTesting.catchBadInstruction
import Testing

@testable import Rapid

@Suite struct ValidatedTests {
  /// The `@Validated` property wrapper only allows mutations if they pass
  /// validation.
  @Test("@Validated")
  func validated() {
    @Validated(if: (5...10).contains) var value = 7

    value = 29
    #expect(value == 7)

    value = 9
    #expect(value == 9)
  }

  /// The `@Validated` property wrapper traps if the initial value is not valid.
  @Test("@Validated <- invalid")
  func validatedInvalid() {
    #expect(catchBadInstruction {
      @Validated(if: (5...10).contains) var value = 3
    } != nil)
  }
}
