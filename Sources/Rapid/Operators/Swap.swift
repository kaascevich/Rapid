// Swap.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

infix operator <=>: AssignmentPrecedence

/// Exchanges the values of the two operands.
///
/// The two operands must not alias each other. To swap two elements of a
/// mutable collection, use the `swapAt(_:_:)` method of that collection
/// instead of this operator.
///
/// - Parameters:
///   - a: The first value to swap.
///   - b: The second value to swap.
public func <=> <Value>(_ a: inout Value, _ b: inout Value) {
  swap(&a, &b)
}
