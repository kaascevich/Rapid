// SPDX-FileCopyrightText: 2024 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

extension BinaryInteger {
  /// A Boolean value indicating whether this value is even.
  ///
  /// An integer is even if it is evenly divisible by `2`. `0` is considered
  /// even.
  ///
  /// ```swift
  /// let evenNumber = 6
  /// // evenNumber.isEven == true
  ///
  /// let oddNumber = -3
  /// // evenNumber.isEven == false
  /// ```
  @inlinable
  public var isEven: Bool {
    isMultiple(of: 2)
  }

  /// A Boolean value indicating whether this value is odd.
  ///
  /// An integer is odd if it is not evenly divisible by `2`. `0` is not
  /// considered odd.
  ///
  /// ```swift
  /// let oddNumber = 3
  /// // evenNumber.isOdd == true
  ///
  /// let evenNumber = -6
  /// // evenNumber.isOdd == false
  /// ```
  @inlinable
  public var isOdd: Bool {
    !isEven
  }
}
