// SafeAccess.swift
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

public extension Collection {
    /// Accesses the element at the specified position, returning `nil` if
    /// the position is invalid.
    ///
    /// The following example tries to access an element of an array through
    /// its subscript, but fails because the element does not exist:
    ///
    /// ```swift
    /// var streets = ["Adams", "Bryant", "Channing", "Douglas", "Evarts"]
    /// print(streets[ifExists: 7])
    /// // Prints "nil"
    /// ```
    ///
    /// You can subscript a collection with any valid index other than the
    /// collection's end index. The end index refers to the position one past
    /// the last element of a collection, so it doesn't correspond with an
    /// element.
    ///
    /// -
    ///
    /// - Complexity: If the type conforms to `RandomAccessCollection`, O(1);
    ///   otherwise, O(*n*), where *n* is the length of the collection.
    ///
    /// - Parameter position: The position of the element to access.
    ///
    /// - Returns: The element at the specified position, or `nil` if it
    ///   doesn't exist.
    @inlinable subscript(ifExists position: Index) -> Element? {
        guard indices.contains(position) else {
            return nil
        }
        return self[position]
    }
}
