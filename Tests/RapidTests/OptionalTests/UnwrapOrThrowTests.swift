// UnwrapOrThrowTests.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

import CwlPreconditionTesting
import Testing
@testable import Rapid

@Suite struct UnwrapOrThrowTests {
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
