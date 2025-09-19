// SPDX-FileCopyrightText: 2024 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

public extension BinaryInteger where Stride: SignedInteger {
  /// Returns the factorial of this value.
  ///
  /// The factorial is calculated by multiplying every number between `1` and
  /// `self`, inclusive. By convention, `0.factorial()` is `1`.
  ///
  /// - Important: Negative factorials are not defined; attempting to calculate
  ///   one will result in a runtime error.
  ///
  /// ```swift
  /// print(6.factorial())
  /// // Prints "720"
  ///
  /// print(0.factorial())
  /// // Prints "1"
  /// ```
  ///
  /// - Complexity: O(*n*), where *n* is equal to `self`.
  ///
  /// - Returns: The factorial of `self`.
  ///
  /// - Precondition: `self >= 0`.
  @inlinable
  func factorial() -> Self {
    precondition(
      self >= 0,
      "the factorial of \(self), a negative number, is not defined"
    )

    return if isZero { 1 } else { (1...self).product() }
  }
}
