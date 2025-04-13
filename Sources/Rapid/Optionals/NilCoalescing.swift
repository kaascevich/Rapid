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

infix operator ??=: AssignmentPrecedence

public extension Optional {
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
  static func ??=(
    optional: inout Self,
    defaultValue: @autoclosure () -> Wrapped,
  ) {
    optional = optional ?? defaultValue()
  }
}
