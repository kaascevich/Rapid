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

// MARK: - Not Equal To

infix operator ≠: ComparisonPrecedence

public extension Equatable {
  /// Returns a Boolean value indicating whether two values are not equal.
  ///
  /// Inequality is the inverse of equality. For any values `a` and `b`, `a ≠ b`
  /// implies that `a == b` is `false`.
  ///
  /// - Parameters:
  ///   - lhs: A value to compare.
  ///   - rhs: Another value to compare.
  ///
  /// - Returns: Whether the two values are not equal.
  @inlinable static func ≠ (lhs: Self, rhs: Self) -> Bool {
    lhs != rhs
  }
}

// MARK: - Greater/Less Than or Equal To

infix operator ≤: ComparisonPrecedence
infix operator ≥: ComparisonPrecedence

public extension Comparable {
  /// Returns a Boolean value indicating whether the value of the first argument
  /// is less than or equal to that of the second argument.
  ///
  /// - Parameters:
  ///   - lhs: A value to compare.
  ///   - rhs: Another value to compare.
  ///
  /// - Returns: Whether the first value is less than or equal to the second.
  @inlinable static func ≤ (lhs: Self, rhs: Self) -> Bool {
    lhs <= rhs
  }

  /// Returns a Boolean value indicating whether the value of the first argument
  /// is greater than or equal to that of the second argument.
  ///
  /// - Parameters:
  ///   - lhs: A value to compare.
  ///   - rhs: Another value to compare.
  ///
  /// - Returns: Whether the first value is greater than or equal to the second.
  @inlinable static func ≥ (lhs: Self, rhs: Self) -> Bool {
    lhs >= rhs
  }
}
