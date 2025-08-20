// Copyright © 2024-2025 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

import TestHelpers
import Testing

@testable import Rapid

@Suite struct InterpolationTests {
#if canImport(Foundation)
  /// The `(_:format:)` string interpolation formats a value.
  @available(macOS 12, iOS 15, tvOS 15, watchOS 8, *)
  @Test("appendInterpolation(_:format)")
  func formatInterpolation() {
    #expect("\(42.6921, format: .currency(code: "USD"))" == "$42.69")
  }
#endif

  /// The `(_:if:)` string interpolation only interpolates the value if the
  /// condition is true.
  @Test("appendInterpolation(_:if:)")
  func ifInterpolation() {
    #expect("test \("test", if: true)" == "test test")
    #expect("test \("test", if: false)" == "test ")
  }
}
