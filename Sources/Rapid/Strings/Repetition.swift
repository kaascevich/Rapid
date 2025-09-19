// SPDX-FileCopyrightText: 2024 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

extension String {
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
  @inlinable
  public static func * (_ repeatedValue: Self, count: Int) -> Self {
    .init(repeating: repeatedValue, count: count)
  }
}
