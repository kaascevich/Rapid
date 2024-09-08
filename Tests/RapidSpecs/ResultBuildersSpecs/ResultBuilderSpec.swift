// ResultBuilderSpec.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

import Quick
import Nimble
@testable import Rapid

final class ResultBuilderSpec: QuickSpec {
  override class func spec() {
    describe("the StringBuilder result builder") {
      it("creates a String from a result builder") {
        let theAnswer = String {
          "6 times 9 is "
          if 6 * 9 != 42 {
            "not "
          }
          "42."
        }
        
        expect(theAnswer).to(equal("6 times 9 is not 42."))
      }
      
      it("implements all the result builder methods") {
        let notTrue = false // bypassing the "will never be executed" warning
        let aBunchOfRandomThings = String {
          "hello"
          if true { "yes" }
          if notTrue { "if" } else { "else" }
          for i in 1...5 { §i }
          if #available(macOS 14, *) { "Sonoma" }
        }
        
        if #available(macOS 14, *) {
          expect(aBunchOfRandomThings).to(equal("hello" + "yes" + "else" + "12345" + "Sonoma"))
        } else {
          expect(aBunchOfRandomThings).to(equal("hello" + "yes" + "else" + "12345"))
        }
      }
    }
    
    describe("the ArrayBuilder result builder") {
      it("creates an Array from a result builder") {
        // Contrived? Yes. But it works.
        let primes = Array {
          2; 3; 5; 7; 11
          13; 17; 19; 23
        }
        
        expect(primes).to(equal([2, 3, 5, 7, 11, 13, 17, 19, 23]))
      }
      
      it("implements all the result builder methods") {
        let notTrue = false // bypassing the "will never be executed" warning
        let aBunchOfRandomThings = Array {
          "hello"
          if true { "yes" }
          if notTrue { "if" } else { "else" }
          for i in 1...3 { §i }
          if #available(macOS 14, *) { "Sonoma" }
        }
        
        if #available(macOS 14, *) {
          expect(aBunchOfRandomThings).to(equal(["hello", "yes", "else", "1", "2", "3", "Sonoma"]))
        } else {
          expect(aBunchOfRandomThings).to(equal(["hello", "yes", "else", "1", "2", "3"]))
        }
      }
    }
  }
}
