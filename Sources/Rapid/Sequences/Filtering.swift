// SPDX-FileCopyrightText: 2024 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

extension Sequence {
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
  public func noneSatisfy(
    _ predicate: (Element) throws -> Bool
  ) rethrows -> Bool {
    try allSatisfy { try !predicate($0) }
  }

  /// Returns an array containing the non-`nil` elements of this sequence.
  ///
  /// Use this method to concisely remove all `nil` elements from this sequence.
  ///
  /// - Complexity: O(*n*), where *n* is the length of this sequence.
  ///
  /// - Returns: An array of the non-`nil` elements of the sequence.
  public func compacted<Value>() -> [Value] where Element == Value? {
    compactMap(\.self)
  }

  /// Returns the last element of the sequence that satisfies the given
  /// predicate.
  ///
  /// @DeprecationSummary {
  ///   Use the standard library version on `BidirectionalCollection` instead.
  /// }
  @available(
    *,
    deprecated,
    message: """
      use the standard library version on 'BidirectionalCollection' instead
      """
  )
  public func last(
    where predicate: (Element) throws -> Bool
  ) rethrows -> Element? {
    try reversed().first(where: predicate)
  }
}

extension RangeReplaceableCollection where Element: Equatable {
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
  public mutating func removeAll(occurrencesOf element: Element) {
    removeAll { $0 == element }
  }
}

// MARK: - Counting

extension Sequence {
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
  public func count(of element: Element) -> Int where Element: Equatable {
    count(where: { $0 == element })  // swiftlint:disable:this trailing_closure
  }
}
