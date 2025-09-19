// SPDX-FileCopyrightText: 2024 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

import TestHelpers
import Testing

@testable import Rapid

@Suite enum UnwrapOrThrowTests {
  @Suite struct ThrowingCoalesceTests {
    /// The `?!(optional:error:)` operator returns the unwrapped value if it
    /// exists.
    @Test func `?!(optional:error:) -> success`() {
      #expect((try? Int("100") ?! MockError.bad) == 100)
    }

    /// The `?!(optional:error:)` operator throws the error if the value is
    /// `nil`.
    @Test func `?!(optional:error:) -> fail`() {
      #expect(throws: MockError.bad) {
        try Int("invalid-input") ?! MockError.bad
      }
    }
  }

  @Suite struct ForcedCoalesceTests {
    /// The `!(optional:error:)!` operator returns the unwrapped value if it
    /// exists.
    @Test func `!!(optional:error:) -> success`() {
      #expect((Int("100") !! fatalError("The input is invalid!")) == 100)
    }

    /// The `!!(optional:error:)` operator calls the never-returning function
    /// if the value is `nil`.
    @Test(.tags(.traps)) func `!!(optional:error:) -> fail`() async {
      await #expect(processExitsWith: .failure) {
        _ = Int("invalid-input") !! fatalError("The input is invalid!")
      }
    }
  }
}
