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
    #expect("test \("test", if: true)" == "test test")
    #expect("test \("test", if: false)" == "test ")
  }
}
