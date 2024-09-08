// Signs.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

public extension SignedNumeric where Self: Comparable {
  // MARK: - Positivity
  
  /// A Boolean value indicating whether this value is positive.
  ///
  /// A number is positive if it compares greater than zero. Zero is
  /// neither negative nor positive.
  var isPositive: Bool { self > 0 }
  
  // MARK: - Negativity
  
  /// A Boolean value indicating whether this value is negative.
  ///
  /// A number is negative if it compares less than zero. Zero is
  /// neither negative nor positive.
  var isNegative: Bool { self < 0 }
  
  // MARK: - Absolute Value

  /// Returns the absolute value of this value.
  ///
  /// The absolute value must be representable in the same type. In particular,
  /// the absolute value of a signed, fixed-width integer type's minimum cannot
  /// be represented.
  ///
  /// ```swift
  /// let x = Int8.min
  /// // x == -128
  /// let y = x.absoluteValue
  /// // Overflow error
  /// ```
  var absoluteValue: Self { abs(self) }
}
