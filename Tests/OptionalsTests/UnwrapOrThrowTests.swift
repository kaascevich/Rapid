// Copyright © 2024-2025 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

import TestHelpers
import Testing

@testable import Rapid

@Suite enum UnwrapOrThrowTests {
  @Suite struct ThrowingCoalesceTests {
    /// The `?!(optional:error:)` operator returns the unwrapped value if it
    /// exists.
    @Test("?!(optional:error:) -> success")
    func throwingCoalesceSuccess() {
      #expect((try? Int("100") ?! MockError.bad) == 100)
    }

    /// The `?!(optional:error:)` operator throws the error if the value is
    /// `nil`.
    @Test("?!(optional:error:) -> fail")
    func throwingCoalesceFail() {
      #expect(throws: MockError.bad) {
        try Int("invalid-input") ?! MockError.bad
      }
    }
  }

  @Suite struct ForcedCoalesceTests {
    /// The `!(optional:error:)!` operator returns the unwrapped value if it
    /// exists.
    @Test("!!(optional:error:) -> success")
    func forcedCoalesceSuccess() {
      #expect((Int("100") !! fatalError("The input is invalid!")) == 100)
    }

    /// The `!!(optional:error:)` operator calls the never-returning function
    /// if the value is `nil`.
    @Test("!!(optional:error:) -> fail", .tags(.traps))
    func forcedCoalesceFail() async {
      await #expect(crashes {
        _ = Int("invalid-input") !! fatalError("The input is invalid!")
      })
    }
  }
}
