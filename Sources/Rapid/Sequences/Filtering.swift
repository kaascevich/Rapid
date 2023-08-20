// Filtering.swift
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
    // MARK: - Conditions
    
    /// Returns a Boolean value indicating whether no elements of a sequence
    /// satisfiy a given predicate.
    ///
    /// The following code uses this method to test whether none of the names
    /// in an array have fewer than five characters:
    ///
    /// ```swift
    /// let names = ["Sofia", "Camilla", "Martina", "Mateo", "Nicolás"]
    /// let noneHaveFewerThanFive = names.noneSatisfy { $0.count < 5 }
    /// // noneHaveFewerThanFive == true
    /// ```
    ///
    /// If the sequence is empty, this method returns `true`.
    ///
    /// - Complexity: O(*n*), where *n* is the length of the sequence.
    ///
    /// - Parameter predicate: A closure that takes an element of the sequence
    ///   as its argument and returns a Boolean value that indicates whether
    ///   the passed element satisfies a condition.
    ///
    /// - Returns: `true` if the sequence contains no elements that satisfy
    ///   `predicate`; otherwise, `false`.
    func noneSatisfy(_ predicate: (Element) throws -> Bool) rethrows -> Bool {
        try allSatisfy { try !predicate($0) }
    }
}
