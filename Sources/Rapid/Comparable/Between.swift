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

public extension Comparable {
  /// Returns a Boolean value indicating whether this value is in the provided
  /// range.
  ///
  /// ```swift
  /// 1.isBetween(5...7)           // false
  /// 7.isBetween(6...12)          // true
  /// "e".isBetween("a"..."d")     // false
  /// 0.32.isBetween(0.31...0.33)  // true
  /// ```
  ///
  /// - Parameter range: A range expression.
  ///
  /// - Returns: `true` if this value is contained within `range`; otherwise,
  ///   `false`.
  func isBetween(_ range: some RangeExpression<Self>) -> Bool {
    range.contains(self)
  }
}
