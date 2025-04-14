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

public extension BinaryInteger where Stride: SignedInteger {
  /// Calls the given closure `self` times in the same order as a `for`-`in`
  /// loop.
  ///
  /// The two loops in the following example produce the same output:
  ///
  /// ```swift
  /// for integer in 0..<3 {
  ///   print(integer)
  /// }
  /// // Prints "0"
  /// // Prints "1"
  /// // Prints "2"
  ///
  /// 3.repeat { number in
  ///   print(number)
  /// }
  /// // Same as above
  /// ```
  ///
  /// The `body` closure receives the current loop index, starting from 0.
  ///
  /// Using the `repeat` method is distinct from a `for`-`in` loop in two
  /// important ways:
  ///
  /// 1. You cannot use a `break` or `continue` statement to exit the current
  ///    call of the `body` closure or skip subsequent calls.
  /// 2. Using the `return` statement in the `body` closure will exit only from
  ///    the current call to `body`, not from any outer scope, and won't skip
  ///    subsequent calls.
  ///
  /// - Parameter body: A closure that takes an instance of `Self` as a
  ///   parameter.
  @inlinable func `repeat`<E: Error>(
    _ body: (Self) throws(E) -> Nothing,
  ) throws(E) {
    for index in 0..<self {
      try body(index)
    }
  }
}
