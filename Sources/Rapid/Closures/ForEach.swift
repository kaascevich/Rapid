// ForEach.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

public extension BinaryInteger where Stride: SignedInteger {
  /// Calls the given closure `self` times in the same order as a
  /// `for`-`in` loop.
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
  /// - Parameter body: A closure that takes an instance of `Self` as a parameter.
  func `repeat`(_ body: (Self) throws -> Nothing) rethrows {
    try (0..<self).forEach(body)
  }
}
