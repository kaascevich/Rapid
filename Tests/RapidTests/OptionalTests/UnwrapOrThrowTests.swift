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

import CwlPreconditionTesting
import Testing

@testable import Rapid

@Suite enum UnwrapOrThrowTests {
  @Suite struct ThrowingCoalesceTests {
    enum SomeError: Error { case ohNo }

    /// The `?!(optional:error:)` operator returns the unwrapped value if it
    /// exists.
    @Test("?!(optional:error:) -> success")
    func throwingCoalesceSuccess() throws {
      #expect((try Int("100") ?! SomeError.ohNo) == 100)
    }

    /// The `?!(optional:error:)` operator throws the error if the value is
    /// `nil`.
    @Test("?!(optional:error:) -> fail")
    func throwingCoalesceFail() throws {
      #expect(throws: SomeError.self) {
        try Int("invalid-input") ?! SomeError.ohNo
      }
    }
  }

  @Suite struct ForcedCoalesceTests {
    /// The `!(optional:error:)!` operator returns the unwrapped value if it
    /// exists.
    @Test("!!(optional:error:) -> success")
    func forcedCoalesceSuccess() throws {
      #expect((Int("100") !! fatalError("The input is invalid!")) == 100)
    }

    /// The `!!(optional:error:)` operator calls the never-returning function
    /// if the value is `nil`.
    @Test("!!(optional:error:) -> fail")
    func forcedCoalesceFail() throws {
      #expect(catchBadInstruction {
        _ = Int("invalid-input") !! fatalError("The input is invalid!")
      } != nil)
    }
  }
}
