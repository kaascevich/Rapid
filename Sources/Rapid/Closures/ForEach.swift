// SPDX-FileCopyrightText: 2024 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

extension BinaryInteger where Stride: SignedInteger {
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
  @inlinable
  public func `repeat`<E: Error>(
    _ body: (Self) throws(E) -> Void
  ) throws(E) {
    for index in 0..<self {
      try body(index)
    }
  }
}
