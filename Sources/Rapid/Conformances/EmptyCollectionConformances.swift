// EmptyCollectionConformances.swift
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

extension EmptyCollection: ExpressibleByEmptyArrayLiteral {
    /// Creates an instance with an empty array literal.
    ///
    /// The array literal type is defined as `Never` to prevent accidental
    /// use of a non-empty array literal, since `Never` is uninhabited and
    /// therefore can't be instantiated.
    ///
    /// ```swift
    /// let nothing: EmptyCollection<Int> = []
    ///
    /// // Throws a compiler error - cannot convert 'Int' to 'Never'
    /// let something: EmptyCollection<Int> = [42]
    /// ```
    ///
    /// - Parameter elements: An empty array literal.
    public init(emptyArrayLiteral: Nothing) {
        self.init()
    }
}

extension EmptyCollection: ExpressibleByEmptyDictionaryLiteral {
    /// Creates an instance with an empty dictionary literal.
    ///
    /// The dictionary literal type is defined as `(Never, Never)` to
    /// prevent accidental use of a non-empty dictionary literal, since
    /// `Never` is uninhabited and therefore can't be instantiated.
    ///
    /// ```swift
    /// let nothing: EmptyCollection<(Int, Int)> = [:]
    ///
    /// // Throws 2 compiler errors - cannot convert 'Int' to 'Never'
    /// let something: EmptyCollection<(Int, Int)> = [42: 69]
    /// ```
    ///
    /// - Parameter elements: An empty dictionary literal.
    public init(emptyDictionaryLiteral: Nothing) {
        self.init()
    }
}
