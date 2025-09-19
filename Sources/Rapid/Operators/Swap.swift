// SPDX-FileCopyrightText: 2024 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

infix operator <=> : AssignmentPrecedence

/// Exchanges the values of the two operands.
///
/// The two operands must not alias each other. To swap two elements of a
/// mutable collection, use the `swapAt(_:_:)` method of that collection instead
/// of this operator.
///
/// - Parameters:
///   - lhs: The first value to swap.
///   - rhs: The second value to swap.
@inlinable
public func <=> <Value: ~Copyable>(
  lhs: inout Value,
  rhs: inout Value
) {
  swap(&lhs, &rhs)
}
