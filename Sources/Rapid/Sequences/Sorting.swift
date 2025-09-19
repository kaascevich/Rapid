// SPDX-FileCopyrightText: 2025 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

extension Sequence {
  /// Returns the elements of the sequence, sorted by the result of the given
  /// function.
  ///
  /// You can sort any sequence of elements using a function returning a value
  /// that conforms to the `Comparable` protocol by calling this method.
  /// Elements are sorted in ascending order.
  ///
  /// To sort the elements of your sequence in descending order, pass the
  /// greater-than operator (`>`) to the ``sorted(by:using:)`` method.
  ///
  /// The sorting algorithm is guaranteed to be stable. A stable sort preserves
  /// the relative order of elements that compare as equal.
  ///
  /// - Complexity: O(*n* log *n*), where *n* is the length of the sequence.
  ///
  /// - Parameter mapping: A function that takes an element and returns a
  ///   comparable value.
  ///
  /// - Returns: An array of the sequence's elements, sorted by `mapping`.
  public func sorted(
    by mapping: (Element) -> some Comparable
  ) -> [Element] {
    sorted(by: mapping, using: <)
  }

  /// Returns the elements of the sequence, sorted by the result of the given
  /// function, using the given predicate as the comparison between elements.
  ///
  /// When you want to sort a sequence of elements by a function returning a
  /// value that dosen't conform to the `Comparable` protocol, pass a predicate
  /// to this method that returns `true` when the first element should be
  /// ordered before the second. The elements of the resulting array are ordered
  /// according to the given predicate.
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
  ///   - mapping: A function that takes an element and returns a value to
  ///     sort by.
  ///   - areInIncreasingOrder: A predicate that returns `true` if its first
  ///     argument should be ordered before its second argument; otherwise,
  ///     `false`.
  ///
  /// - Returns: An array of the sequence's elements, sorted by `mapping`.
  public func sorted<T>(
    by mapping: (Element) -> T,
    using areInIncreasingOrder: (T, T) throws -> Bool
  ) rethrows -> [Element] {
    try sorted {
      try areInIncreasingOrder(mapping($0), mapping($1))
    }
  }
}
