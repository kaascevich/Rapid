// Aliases.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

// MARK: - Not Equal To

infix operator ≠: ComparisonPrecedence

public extension Equatable {
  /// Returns a Boolean value indicating whether two values are not equal.
  ///
  /// Inequality is the inverse of equality. For any values `a` and `b`,
  /// `a ≠ b` implies that `a == b` is `false`.
  ///
  /// - Parameters:
  ///   - lhs: A value to compare.
  ///   - rhs: Another value to compare.
  ///
  /// - Returns: Whether the two values are not equal.
  static func ≠ (lhs: Self, rhs: Self) -> Bool {
    lhs != rhs
  }
}

// MARK: - Greater/Less Than or Equal To

infix operator ≤: ComparisonPrecedence
infix operator ≥: ComparisonPrecedence

public extension Comparable {
  /// Returns a Boolean value indicating whether the value of the first
  /// argument is less than or equal to that of the second argument.
  ///
  /// - Parameters:
  ///   - lhs: A value to compare.
  ///   - rhs: Another value to compare.
  ///
  /// - Returns: Whether the first value is less than or equal to the
  ///   second.
  static func ≤ (lhs: Self, rhs: Self) -> Bool {
    lhs <= rhs
  }
  
  /// Returns a Boolean value indicating whether the value of the first
  /// argument is greater than or equal to that of the second argument.
  ///
  /// - Parameters:
  ///   - lhs: A value to compare.
  ///   - rhs: Another value to compare.
  ///
  /// - Returns: Whether the first value is greater than or equal to
  ///   the second.
  static func ≥ (lhs: Self, rhs: Self) -> Bool {
    lhs >= rhs
  }
}
