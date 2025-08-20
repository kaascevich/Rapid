// Copyright © 2024-2025 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

public extension String {
  /// Creates a new string representing the given string repeated the specified
  /// number of times.
  ///
  /// For example, you can use this operator to create a string with ten `"ab"`
  /// strings in a row.
  ///
  /// ```swift
  /// let s = "ab" * 10
  /// print(s)
  /// // Prints "abababababababababab"
  /// ```
  ///
  /// - Parameters:
  ///   - repeatedValue: The string to repeat.
  ///   - count: The number of times to repeat `repeatedValue` in the resulting
  ///     string.
  ///
  /// - Returns: A new string representing `repeatedValue` repeated `count`
  ///   times.
  @inlinable static func * (_ repeatedValue: Self, count: UInt) -> Self {
    .init(repeating: repeatedValue, count: Int(count))
  }
}
