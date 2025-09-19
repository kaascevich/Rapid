// SPDX-FileCopyrightText: 2024 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

infix operator ??= : AssignmentPrecedence

extension Optional where Wrapped: ~Copyable {
  /// Assigns a default value to an `Optional` instance if it doesn't have a
  /// value.
  ///
  /// A nil-coalescing operation assigns the right-hand side to the left-hand
  /// side if the left-hand side is `nil`.
  ///
  /// This operator uses short-circuit evaluation: `optional` is checked first,
  /// and `defaultValue` is evaluated only if `optional` is `nil`. For example:
  ///
  /// ```swift
  /// func getDefault() -> Int {
  ///   print("Calculating default...")
  ///   return 42
  /// }
  ///
  /// var goodNumber = Int("100")
  /// goodNumber ??= getDefault()
  /// // goodNumber == 100
  ///
  /// var notSoGoodNumber = Int("invalid-input")
  /// notSoGoodNumber ??= getDefault()
  /// // Prints "Calculating default..."
  /// // notSoGoodNumber == 42
  /// ```
  ///
  /// In this example, the value of `goodNumber` remains unchanged because
  /// `Int("100")` succeeded in returning a non-`nil` result. When
  /// `notSoGoodNumber` is initialized, `Int("invalid-input")` fails and returns
  /// `nil`, and so the `getDefault()` method is called to supply a default
  /// value.
  ///
  /// - Parameters:
  ///   - optional: An optional value.
  ///   - defaultValue: A value to use as a default. `defaultValue` is the same
  ///     type as the `Wrapped` type of `optional`.
  @inlinable
  public static func ??= (
    optional: inout Self,
    defaultValue: @autoclosure () -> Wrapped,
  ) {
    optional = optional ?? defaultValue()
  }
}
