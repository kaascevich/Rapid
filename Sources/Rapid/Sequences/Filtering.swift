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
    
    /// Returns the last element of the sequence that satisfies the given
    /// predicate.
    ///
    /// The following example uses the `last(where:)` method to find the last
    /// negative number in an array of integers:
    ///
    /// ```swift
    /// let numbers = [3, 7, 4, -2, 9, -6, 10, 1]
    /// if let lastNegative = numbers.last(where: \.isNegative) {
    ///     print("The last negative number is \(lastNegative).")
    /// }
    /// // Prints "The last negative number is -6."
    /// ```
    ///
    /// - Complexity: O(*n*), where *n* is the length of the sequence.
    ///
    /// - Parameter predicate: A closure that takes an element of the sequence as
    ///   its argument and returns a Boolean value indicating whether the element
    ///   is a match.
    ///
    /// - Returns: The last element of the sequence that satisfies `predicate`,
    ///   or `nil` if there is no element that satisfies `predicate`.
    func last(where predicate: (Element) throws -> Bool) rethrows -> Element? {
        for element in self.reversed() where try predicate(element) {
            return element
        }
        return nil
    }
}

public extension RangeReplaceableCollection where Element: Equatable {
    /// Removes all the elements that equal the given value..
    ///
    /// Use this method to remove every element in a collection equal to a
    /// particular value. The order of the remaining elements is preserved.
    /// This example removes all the sixes from an array of numbers:
    ///
    /// ````swift
    /// var numbers = [5, 6, 7, 8, 7, 6, 5]
    /// numbers.removeAll(occurrencesOf: 6)
    /// // numbers == [5, 7, 8, 7, 5]
    /// ```
    ///
    /// - Parameter element: An element of the collection.
    ///
    /// - Complexity: O(*n*), where *n* is the length of the collection.
    mutating func removeAll(occurrencesOf element: Element) {
        removeAll { $0 == element }
    }
}

// MARK: - Counting

public extension Collection {
    /// The number of elements in the collection that satisfy the given predicate.
    ///
    /// In this example, `count(of:)` is used to count the number of names shorter
    /// than five characters.
    ///
    /// ```swift
    /// let cast = ["Vivien", "Marlon", "Kim", "Karl"]
    /// let numberOfShortNames = cast.count { $0.count < 5 }
    /// print(numberOfShortNames)
    /// // Prints "2"
    /// ```
    ///
    /// - Complexity: O(*n*), where *n* is the length of the sequence.
    ///
    /// - Parameter predicate: A closure that takes an element of the sequence as
    ///   its argument and returns a Boolean value indicating whether the element
    ///   should be included in the count.
    ///
    /// - Returns: The number of elements that satisfy `predicate`.
    ///
    /// ## See Also
    ///
    /// ``count(of:)-3wi3r``
    func count(of predicate: (Element) throws -> Bool) rethrows -> Int {
        try filter(predicate).count
    }
}

public extension Collection where Element: Equatable {
    /// The number of times the given element appears in the collection.
    ///
    /// In this example, `count(of:)` is used to count the number of times the
    /// number `4` occurs in the array.
    ///
    /// ```swift
    /// let cast = [5, 4, 9, 3, 6, 4, 1, 4, 3]
    /// let numberOfFours = cast.count(of: 4)
    /// print(numberOfFours)
    /// // Prints "3"
    /// ```
    ///
    /// - Complexity: O(*n*), where *n* is the length of the sequence.
    ///
    /// - Parameter element: The element to count.
    ///
    /// - Returns: The number of times `element` appears in the collection.
    ///
    /// ## See Also
    ///
    /// ``count(of:)-4eom8``
    func count(of element: Element) -> Int {
        count { $0 == element }
    }
}
