// Between.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

public extension Comparable {
  /// Returns a Boolean value indicating whether this value is in the
  /// provided range.
  ///
  /// ```swift
  /// 1.isBetween(5...7)          // false
  /// 7.isBetween(6...12)         // true
  /// "e".isBetween("a"..."d")    // false
  /// 0.32.isBetween(0.31...0.33) // true
  /// ```
  ///
  /// - Parameter range: A range expression.
  ///
  /// - Returns: `true` if this value is contained within `range`;
  ///   otherwise, `false`.
  func isBetween(_ range: some RangeExpression<Self>) -> Bool {
    range.contains(self)
  }
}
