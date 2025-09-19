// SPDX-FileCopyrightText: 2024 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

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
@inlinable
public func |> <
  ArgumentType: ~Copyable & ~Escapable,
  ReturnType: ~Copyable,
  E: Error,
>(
  argument: consuming ArgumentType,
  function: (consuming ArgumentType) throws(E) -> ReturnType,
) throws(E) -> ReturnType {
  try function(argument)
}
