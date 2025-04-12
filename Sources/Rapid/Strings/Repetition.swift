// This file is part of BrainflipKit.
// Copyright © 2024-2025 Kaleb A. Ascevich
//
// BrainflipKit is free software: you can redistribute it and/or modify it under
// the terms of the GNU Affero General Public License (GNU AGPL) as published by
// the Free Software Foundation, either version 3 of the License, or (at your
// option) any later version.
//
// BrainflipKit is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
// FOR A PARTICULAR PURPOSE. See the GNU AGPL for more details.
//
// You should have received a copy of the GNU AGPL along with BrainflipKit. If
// not, see <https://www.gnu.org/licenses/>.

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
