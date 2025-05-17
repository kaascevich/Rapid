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

precedencegroup FunctionPipePrecedence {
  higherThan: BitwiseShiftPrecedence
  associativity: left
}

infix operator |> : FunctionPipePrecedence

/// Calls `function` with `argument`.
///
/// - Parameters:
///   - function: A unary function (a function that takes one argument).
///   - argument: The argument to pass to `function`.
///
/// - Returns: The return value of `function` when passed `argument`.
@inlinable public func |> <
  ArgumentType: ~Copyable & ~Escapable,
  ReturnType: ~Copyable & ~Escapable,
  E: Error,
>(
  argument: consuming ArgumentType,
  function: (consuming ArgumentType) throws(E) -> ReturnType,
) throws(E) -> ReturnType {
  try function(argument)
}
