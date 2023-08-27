// Swap.swift
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
