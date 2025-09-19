// SPDX-FileCopyrightText: 2024 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

import TestHelpers
import Testing

@testable import Rapid

@Suite struct ResultBuilderTests {
  let notTrue = false  // bypassing the "will never be executed" warning

  /// The `StringBuilder` result builder creates a String from a result builder.
  @Test func `StringBuilder`() {
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
  @Test func `ArrayBuilder`() {
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
