// SPDX-FileCopyrightText: 2024 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

// MARK: - Not Equal To

infix operator ≠ : ComparisonPrecedence

extension Equatable {
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
  @inlinable
  public static func ≠ (lhs: Self, rhs: Self) -> Bool {
    lhs != rhs
  }
}

// MARK: - Greater/Less Than or Equal To

infix operator ≤ : ComparisonPrecedence
infix operator ≥ : ComparisonPrecedence

extension Comparable {
  /// Returns a Boolean value indicating whether the value of the first argument
  /// is less than or equal to that of the second argument.
  ///
  /// - Parameters:
  ///   - lhs: A value to compare.
  ///   - rhs: Another value to compare.
  ///
  /// - Returns: Whether the first value is less than or equal to the second.
  @inlinable
  public static func ≤ (lhs: Self, rhs: Self) -> Bool {
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
  @inlinable
  public static func ≥ (lhs: Self, rhs: Self) -> Bool {
    lhs >= rhs
  }
}
