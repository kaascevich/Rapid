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

import TestHelpers
import Testing

@testable import Rapid

@Suite struct ResultBuilderTests {
  let notTrue = false  // bypassing the "will never be executed" warning

  /// The `StringBuilder` result builder creates a String from a result builder.
  @Test("StringBuilder")
  func stringBuilder() {
    let randomThings = String {
      "hello"

      if true { "yes" }
      if notTrue { "no" }

      if true { "if" } else { "else" }
      if notTrue { "if" } else { "else" }

      for i in 1...5 { §i }
      if #available(macOS 15, *) { "Sequoia" }
    }

    if #available(macOS 15, *) {
      #expect(randomThings == "hello" + "yes" + "if" + "else" + "12345" + "Sequoia")
    } else {
      #expect(randomThings == "hello" + "yes" + "if" + "else" + "12345")
    }
  }

  /// The `ArrayBuilder` result builder creates an Array from a result builder.
  @Test("ArrayBuilder")
  func arrayBuilder() {
    let randomThings = Array {
      "hello"

      if true { "yes" }
      if notTrue { "no" }

      if true { "if" } else { "else" }
      if notTrue { "if" } else { "else" }

      for i in 1...3 { §i }
      if #available(macOS 15, *) { "Sequoia" }
    }

    if #available(macOS 15, *) {
      #expect(randomThings == ["hello", "yes", "if", "else", "1", "2", "3", "Sequoia"])
    } else {
      #expect(randomThings == ["hello", "yes", "if", "else", "1", "2", "3"])
    }
  }
}
