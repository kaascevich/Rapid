// InterpolationTests.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

#if canImport(Foundation)
import Foundation
#endif

import Testing
@testable import Rapid

@Suite struct InterpolationTests {
#if canImport(Foundation)
  /// The `(_:format:)` string interpolation formats a value.
  @available(macOS 12, iOS 15, tvOS 15, watchOS 8, *)
  @Test("appendInterpolation(_:format)") func formatInterpolation() {
    #expect("\(42.6921, format: .currency(code: "USD"))" == "$42.69")
  }
#endif
  
  /// The `(_:if:)` string interpolation only interpolates the value if the
  /// condition is true.
  @Test("appendInterpolation(_:if:)") func ifInterpolation() {
    #expect("\("test", if: true)" == "test")
    #expect("\("test", if: false)" == "")
  }
}
