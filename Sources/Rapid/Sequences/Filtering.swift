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

public extension Sequence {
  /// Returns a Boolean value indicating whether no elements of a sequence
  /// satisfy a given predicate.
  ///
  /// The following code uses this method to test whether none of the names in
  /// an array have fewer than five characters:
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
  /// - Parameter predicate: A closure that takes an element of the sequence as
  ///   its argument and returns a Boolean value that indicates whether the
  ///   passed element satisfies a condition.
  ///
  /// - Returns: `true` if the sequence contains no elements that satisfy
  ///   `predicate`; otherwise, `false`.
  func noneSatisfy(_ predicate: (Element) throws -> Bool) rethrows -> Bool {
    try allSatisfy { try !predicate($0) }
  }

  /// Returns an array containing the non-`nil` elements of this sequence.
  ///
  /// Use this method to concisely remove all `nil` elements from this sequence.
  ///
  /// - Complexity: O(*n*), where *n* is the length of this sequence.
  ///
  /// - Returns: An array of the non-`nil` elements of the sequence.
  func compacted<Value>() -> [Value] where Element == Value? {
    compactMap(\.self)
  }

  /// Returns the last element of the sequence that satisfies the given
  /// predicate.
  ///
  /// @DeprecationSummary {
  ///   Use the standard library version on `BidirectionalCollection` instead.
  /// }
  @available(
    *, deprecated,
    message: "use the standard library version on 'BidirectionalCollection' instead"
  )
  func last(where predicate: (Element) throws -> Bool) rethrows -> Element? {
    try reversed().first(where: predicate)
  }
}

public extension RangeReplaceableCollection where Element: Equatable {
  /// Removes all the elements that equal the given value.
  ///
  /// Use this method to remove every element in a collection equal to a
  /// particular value. The order of the remaining elements is preserved. This
  /// example removes all the sixes from an array of numbers:
  ///
  /// ```swift
  /// var numbers = [5, 6, 7, 8, 7, 6, 5]
  /// numbers.removeAll(occurrencesOf: 6)
  /// // numbers == [5, 7, 8, 7, 5]
  /// ```
  ///
  /// - Complexity: O(*n*), where *n* is the length of the collection.
  ///
  /// - Parameter element: An element of the collection.
  mutating func removeAll(occurrencesOf element: Element) {
    removeAll { $0 == element }
  }
}

// MARK: - Counting

public extension Sequence {
  /// Returns the number of times the given element appears in the sequence.
  ///
  /// In this example, `count(of:)` is used to count the number of times the
  /// string `"duck"` occurs in `birds`.
  ///
  /// ```swift
  /// let birds = ["duck", "duck", "duck", "duck", "goose"]
  /// let duckCount = birds.count(of: "duck")
  /// // duckCount == 4
  /// ```
  ///
  /// - Precondition: The sequence must be finite.
  ///
  /// - Complexity: O(2*n*), where *n* is the length of the sequence.
  ///
  /// - Parameter element: The element to count.
  ///
  /// - Returns: The number of times `element` appears in the sequence.
  func count(of element: Element) -> Int where Element: Equatable {
    count(where: { $0 == element }) // swiftlint:disable:this trailing_closure
  }
}

// MARK: - Sorting

public extension Sequence {
  /// Returns the elements of the sequence, sorted by the given property.
  ///
  /// You can sort any sequence of elements with a property that conforms to the
  /// `Comparable` protocol by calling this method. Elements are sorted in
  /// ascending order.
  ///
  /// To sort the elements of your sequence in descending order, pass the
  /// greater-than operator (`>`) to the ``sorted(by:using:)`` method.
  ///
  /// The sorting algorithm is guaranteed to be stable. A stable sort preserves
  /// the relative order of elements that compare as equal.
  ///
  /// - Complexity: O(*n* log *n*), where *n* is the length of the sequence.
  ///
  /// - Parameter keyPath: A key path to a property of `Element`.
  ///
  /// - Returns: An array of the sequence's elements, sorted by `keyPath`.
  func sorted(by keyPath: KeyPath<Element, some Comparable>) -> [Element] {
    sorted(by: keyPath, using: <)
  }

  /// Returns the elements of the sequence, sorted by the given property, using
  /// the given predicate as the comparison between elements.
  ///
  /// When you want to sort a sequence of elements by a property that dosen't
  /// conform to the `Comparable` protocol, pass a predicate to this method that
  /// returns `true` when the first element should be ordered before the second.
  /// The elements of the resulting array are ordered according to the given
  /// predicate.
  ///
  /// You also use this method to sort elements that conform to the `Comparable`
  /// protocol in descending order. To sort your sequence in descending order,
  /// pass the greater-than operator (`>`) as the `areInIncreasingOrder`
  /// parameter.
  ///
  /// Calling the related ``sorted(by:)`` method is equivalent to calling this
  /// method and passing the less-than operator (`<`) as the predicate.
  ///
  /// The predicate must be a *strict weak ordering* over the elements. That is,
  /// for any elements a, b, and c, the following conditions must hold:
  ///
  /// - `areInIncreasingOrder(a, a)` is always `false`. (Irreflexivity)
  /// - If `areInIncreasingOrder(a, b)` and `areInIncreasingOrder(b, c)` are
  ///   both `true`, then `areInIncreasingOrder(a, c)` is also `true`.
  ///   (Transitive comparability)
  /// - Two elements are *incomparable* if neither is ordered before the other
  ///   according to the predicate. If a and b are incomparable, and b and c are
  ///   incomparable, then a and c are also incomparable. (Transitive
  ///   incomparability)
  ///
  /// The sorting algorithm is guaranteed to be stable. A stable sort preserves
  /// the relative order of elements for which `areInIncreasingOrder` does not
  /// establish an order.
  ///
  /// - Complexity: O(*n* log *n*), where *n* is the length of the sequence.
  ///
  /// - Parameters:
  ///   - keyPath: A key path to a property of `Element`.
  ///   - areInIncreasingOrder: A predicate that returns `true` if its first
  ///     argument should be ordered before its second argument; otherwise,
  ///     `false`.
  ///
  /// - Returns: An array of the sequence's elements, sorted by `keyPath`.
  func sorted<T>(
    by keyPath: KeyPath<Element, T>,
    using areInIncreasingOrder: (T, T) throws -> Bool,
  ) rethrows -> [Element] {
    try sorted {
      try areInIncreasingOrder($0[keyPath: keyPath], $1[keyPath: keyPath])
    }
  }
}
