// Repetition.swift
// Copyright © 2023 Kaleb A. Ascevich
//
// This package is free software: you can redistribute it and/or modify it
// under the terms of the GNU General Public License as published by the
// Free Software Foundation, either version 3 of the License, or (at your
// option) any later version.
//
// This package is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
// FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
// for more details.
//
// You should have received a copy of the GNU General Public License along
// with this package. If not, see https://www.gnu.org/licenses/.

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
    static func * (_ repeatedValue: Self, count: Int) -> Self {
        Self(repeating: repeatedValue, count: count)
    }
}
