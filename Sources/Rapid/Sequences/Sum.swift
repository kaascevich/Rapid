// SPDX-FileCopyrightText: 2024 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

extension Sequence where Element: Numeric {
  /// Returns the result of adding the elements of the sequence.
  ///
  /// Use the `sum()` method to produce a sum from the elements of an entire
  /// sequence. If the sequence has no elements, the result of the call to
  /// `sum()` is `0`.
  ///
  /// - Complexity: O(*n*), where *n* is the length of the sequence.
  ///
  /// - Returns: The sum of the sequence's elements. If the sequence has no
  ///   elements, the result is `0`.
  @inlinable
  public func sum() -> Element {
    reduce(.zero, +)
  }

  /// Returns the result of multiplying the elements of the sequence.
  ///
  /// Use the `product()` method to produce a product from the elements of an
  /// entire sequence. If the sequence has no elements, the result of the call
  /// to `product()` is `1`.
  ///
  /// - Complexity: O(*n*), where *n* is the length of the sequence.
  ///
  /// - Returns: The product of the sequence's elements. If the sequence has no
  ///   elements, the result is `1`.
  @inlinable
  public func product() -> Element {
    reduce(1, *)
  }
}
