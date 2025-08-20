// Copyright © 2024-2025 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

public extension Collection {
  /// A Boolean value indicating whether the collection is not empty.
  ///
  /// When you need to check whether your collection is not empty, use the
  /// `isNotEmpty` property instead of checking that the `count` property is
  /// greater than zero. For collections that don't conform to
  /// `RandomAccessCollection`, accessing the `count` property iterates through
  /// the elements of the collection.
  ///
  /// ```swift
  /// let horseName = "Silver"
  /// if horseName.isNotEmpty {
  ///   print("Hi ho, \(horseName)!")
  /// } else {
  ///   print("My horse has no name.")
  /// }
  /// // Prints "Hi ho, Silver!"
  /// ```
  ///
  /// - Complexity: O(1).
  @inlinable var isNotEmpty: Bool {
    !isEmpty
  }
}

// MARK: - Nil or Empty

public extension Optional where Wrapped: Collection {
  /// A Boolean value indicating whether this optional is `nil` or, if it has a
  /// value, whether it does not contain any elements.
  ///
  /// - Complexity: O(1).
  @inlinable var isNilOrEmpty: Bool {
    self.isNil || self?.isEmpty == true
  }

  /// A Boolean value indicating whether this optional is not `nil` and, if so,
  /// whether it contains any elements.
  ///
  /// - Complexity: O(1).
  @inlinable var isNotNilOrEmpty: Bool {
    !isNilOrEmpty
  }
}
