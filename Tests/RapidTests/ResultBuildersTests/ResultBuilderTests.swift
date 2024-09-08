// ResultBuilderTests.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

import Testing
@testable import Rapid

@Suite struct ResultBuilderTests {
  /// The `StringBuilder` result builder creates a String from a result
  /// builder.
  @Test("StringBuilder") func stringBuilder() {
    let notTrue = false // bypassing the "will never be executed" warning
    let randomThings = String {
      "hello"
      if true { "yes" }
      if notTrue { "if" } else { "else" }
      for i in 1...5 { §i }
      if #available(macOS 15, *) { "Sequoia" }
    }
    
    if #available(macOS 15, *) {
      #expect(randomThings == "hello" + "yes" + "else" + "12345" + "Sequoia")
    } else {
      #expect(randomThings == "hello" + "yes" + "else" + "12345")
    }
  }
  
  /// The `ArrayBuilder` result builder creates an Array from a result builder.
  @Test("ArrayBuilder") func arrayBuilder() {
    let notTrue = false // bypassing the "will never be executed" warning
    let randomThings = Array {
      "hello"
      if true { "yes" }
      if notTrue { "if" } else { "else" }
      for i in 1...3 { §i }
      if #available(macOS 15, *) { "Sequoia" }
    }
    
    if #available(macOS 15, *) {
      #expect(randomThings == ["hello", "yes", "else", "1", "2", "3", "Sequoia"])
    } else {
      #expect(randomThings == ["hello", "yes", "else", "1", "2", "3"])
    }
  }
}
