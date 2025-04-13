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

infix operator ?!: NilCoalescingPrecedence
infix operator !!: NilCoalescingPrecedence

public extension Optional {
  /// Performs a throwing `nil`-coalescing operation, returning the wrapped
  /// value of an `Optional` instance or throwing an error.
  ///
  /// A throwing `nil`-coalescing operation unwraps the left-hand side if it has
  /// a value, and throws the right-hand side as an error otherwise. The result
  /// of this operation will have the non-optional type of the left-hand side's
  /// `Wrapped` type.
  ///
  /// This operator uses short-circuit evaluation: `optional` is checked first,
  /// and `error` is evaluated only if `optional` is `nil`. For example:
  ///
  /// ```swift
  /// enum SomeError: Error { case ohNo }
  ///
  /// func getError() -> SomeError {
  ///   print("Calculating error...")
  ///   return .ohNo
  /// }
  ///
  /// let goodNumber = try Int("100") ?! getError()
  /// // goodNumber == 100
  ///
  /// let notSoGoodNumber = try Int("invalid-input") ?! getError()
  /// // Prints "Calculating error..."
  /// // Throws SomeError.ohNo
  /// ```
  ///
  /// In this example, `goodNumber` is assigned a value of `100` because
  /// `Int("100")` succeeded in returning a non-`nil` result. When
  /// `notSoGoodNumber` is initialized, `Int("invalid-input")` fails and returns
  /// `nil`, and so the `getError()` method is called to supply an error value
  /// to throw.
  ///
  /// - Parameters:
  ///   - optional: An optional value.
  ///   - error: An error to throw if `optional` is `nil`.
  ///
  /// - Returns: The unwrapped value of `optional`.
  ///
  /// - Throws: `error` if `optional` is `nil`.
  static func ?! <E: Error>(
    optional: Self,
    error: @autoclosure () -> E,
  ) throws(E) -> Wrapped {
    if let optional {
      return optional
    } else {
      throw error()
    }
  }

  /// Performs a forced `nil`-coalescing operation, returning the wrapped value
  /// of an `Optional` instance or calling a never-returning function.
  ///
  /// A forced `nil`-coalescing operation unwraps the left-hand side if it has a
  /// value, and calls the right-hand side -- a function that never returns --
  /// otherwise. The result of this operation will have the non-optional type of
  /// the left-hand side's `Wrapped` type.
  ///
  /// This operator uses short-circuit evaluation: `optional` is checked first,
  /// and `error` is evaluated only if `optional` is `nil`.
  ///
  /// - Parameters:
  ///   - optional: An optional value.
  ///   - error: A function that never returns.
  ///
  /// - Returns: The unwrapped value of `optional`. If `optional` is `nil`, this
  ///   operator never returns.
  static func !! (
    optional: Self,
    error: @autoclosure () -> Never,
  ) -> Wrapped {
    if let optional {
      return optional
    } else {
      error()
    }
  }
}
