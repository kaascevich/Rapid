// PatternMatchingSpec.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

import Quick
import Nimble
@testable import Rapid

final class PatternMatchingSpec: QuickSpec {
  override class func spec() {
    describe("error matching") {
      it("removes the need for type casts when matching errors") {
        enum URLError: Error {
          case connectionLost
          case cannotLoad
        }
        
        enum HTTPError: Error {
          case unauthorized
          case notFound
        }
        
        func handle(_ error: Error) -> String {
          switch error {
            case URLError.connectionLost, URLError.cannotLoad: "url error"
            case HTTPError.unauthorized: "unauthorized"
            case is HTTPError: "http error"
            default: "unknown"
          }
        }
        
        let error = HTTPError.unauthorized
        expect(handle(error)).to(equal("unauthorized"))
      }
    }
    
    describe("Boolean key path matching") {
      it("allows switching on values based on their Boolean properties") {
        let sign = switch -64 {
          case \.isPositive: "positive"
          case \.isNegative: "negative"
          default: "other"
        }
        expect(sign).to(equal("negative"))
      }
    }
    
    describe("regular expression pattern matching") {
      it("only matches if the regex matches the entire string") {
        let digitsOnly = switch "2022" {
          case /[0-9]+/: "Match!"
          default: "No match."
        }
        expect(digitsOnly).to(equal("Match!"))
        
        let digitsAndMore = switch "The year is 2022." {
          case /[0-9]+/: "Match!"
          default: "No match."
        }
        expect(digitsAndMore).to(equal("No match."))
      }
    }
  }
}
