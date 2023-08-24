// UnwrapOrThrow.swift
// Copyright © 2023 Kaleb A. Ascevich
//
// This package is free software: you can redistribute it and/or modify it
// under the terms of the GNU General Public License as published by the
// Free Software Foundation, either version 3 of the License, or (at your
// option) any later version.
//
// This package is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
// FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
// for more details.
//
// You should have received a copy of the GNU General Public License along
// with this package. If not, see https://www.gnu.org/licenses/.

infix operator ?!

public extension Optional {
    /// Performs a throwing nil-coalescing operation, returning the wrapped
    /// value of an `Optional` instance or throwing an error.
    ///
    /// A throwing nil-coalescing operation unwraps the left-hand side if it
    /// has a value, and throws the right-hand side as an error otherwise.
    /// The result of this operation will have the non-optional type of the
    /// left-hand side's `Wrapped` type.
    ///
    /// This operator uses short-circuit evaluation: `optional` is checked
    /// first, and `error` is evaluated only if `optional` is `nil`. For
    /// example:
    ///
    /// ```swift
    /// enum SomeError: Error { case ohNo }
    ///
    /// func getError() -> SomeError {
    ///     print("Calculating error...")
    ///     return .ohNo
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
    /// `notSoGoodNumber` is initialized, `Int("invalid-input")` fails and
    /// returns `nil`, and so the `getError()` method is called to supply
    /// an error value to throw.
    ///
    /// - Parameters:
    ///   - optional: An optional value.
    ///   - error: An error to throw if `optional` is `nil`.
    ///
    /// - Returns: The unwrapped value of `optional`.
    ///
    /// - Throws: `error` if `optional` is `nil`.
    static func ?! <ErrorType: Error>(
        optional: Self,
        error: @autoclosure () -> ErrorType
    ) throws -> Wrapped {
        switch optional {
            case .some(let value): return value
            case nil: throw error()
        }
    }
}
