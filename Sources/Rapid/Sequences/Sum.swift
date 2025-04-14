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

public extension Sequence where Element: Numeric {
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
  @inlinable func sum() -> Element {
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
  @inlinable func product() -> Element {
    reduce(1, *)
  }
}
