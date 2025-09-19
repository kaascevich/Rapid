// SPDX-FileCopyrightText: 2024 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

infix operator ?! : NilCoalescingPrecedence
infix operator !! : NilCoalescingPrecedence

extension Optional where Wrapped: ~Copyable & ~Escapable {
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
  @_lifetime(copy optional)
  public static func ?! <E: Error>(
    optional: consuming Self,
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
  @_lifetime(copy optional)
  public static func !! (
    optional: consuming Self,
    error: @autoclosure () -> Never,
  ) -> Wrapped {
    if let optional {
      return optional
    } else {
      error()
    }
  }
}
