// Repetition.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

public extension String {
  /// Creates a new string representing the given string repeated the
  /// specified number of times.
  ///
  /// For example, you can use this operator to create a string with ten
  /// `"ab"` strings in a row.
  ///
  /// ```swift
  /// let s = "ab" * 10
  /// print(s)
  /// // Prints "abababababababababab"
  /// ```
  ///
  /// - Parameters:
  ///   - repeatedValue: The string to repeat.
  ///   - count: The number of times to repeat `repeatedValue` in the
  ///     resulting string.
  ///
  /// - Returns: A new string representing `repeatedValue` repeated
  ///   `count` times.
  static func * (_ repeatedValue: Self, count: UInt) -> Self {
    Self(repeating: repeatedValue, count: Int(count))
  }
}
