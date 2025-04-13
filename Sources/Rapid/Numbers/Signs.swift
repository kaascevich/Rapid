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

public extension SignedNumeric where Self: Comparable {
  // MARK: - Positivity

  /// A Boolean value indicating whether this value is positive.
  ///
  /// A number is positive if it compares greater than zero. Zero is neither
  /// negative nor positive.
  var isPositive: Bool {
    self > 0
  }

  // MARK: - Negativity

  /// A Boolean value indicating whether this value is negative.
  ///
  /// A number is negative if it compares less than zero. Zero is neither
  /// negative nor positive.
  var isNegative: Bool {
    self < 0
  }

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
  var absoluteValue: Self {
    abs(self)
  }
}
