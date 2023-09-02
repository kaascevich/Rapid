// Sum.swift
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

public extension Sequence {
    /// Returns the result of adding the elements of the sequence.
    ///
    /// Use the `sum()` method to produce a sum from the elements of an
    /// entire sequence. If the sequence has no elements, the result of
    /// the call to `sum()` is `0`.
    ///
    /// - Complexity: O(*n*), where *n* is the length of the sequence.
    ///
    /// - Returns: The sum of the sequence's elements. If the sequence has no
    ///   elements, the result is `0`.
    func sum() -> Element where Element: Numeric {
        reduce(.zero, +)
    }
    
    /// Returns the result of multiplying the elements of the sequence.
    ///
    /// Use the `product()` method to produce a product from the elements
    /// of an entire sequence. If the sequence has no elements, the result
    /// of the call to `product()` is `1`.
    ///
    /// - Complexity: O(*n*), where *n* is the length of the sequence.
    ///
    /// - Returns: The product of the sequence's elements. If the sequence
    ///   has no elements, the result is `1`.
    func product() -> Element where Element: Numeric {
        reduce(1, *)
    }
}
