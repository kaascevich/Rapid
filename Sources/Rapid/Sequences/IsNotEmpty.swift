// This file is part of BrainflipKit.
// Copyright © 2024-2025 Kaleb A. Ascevich
//
// BrainflipKit is free software: you can redistribute it and/or modify it under
// the terms of the GNU Affero General Public License (GNU AGPL) as published by
// the Free Software Foundation, either version 3 of the License, or (at your
// option) any later version.
//
// BrainflipKit is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
// FOR A PARTICULAR PURPOSE. See the GNU AGPL for more details.
//
// You should have received a copy of the GNU AGPL along with BrainflipKit. If
// not, see <https://www.gnu.org/licenses/>.

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
  var isNotEmpty: Bool {
    !isEmpty
  }
}

// MARK: - Nil or Empty

public extension Optional where Wrapped: Collection {
  /// A Boolean value indicating whether this optional is `nil` or, if it has a
  /// value, whether it does not contain any elements.
  ///
  /// - Complexity: O(1).
  var isNilOrEmpty: Bool {
    self.isNil || self?.isEmpty == true
  }

  /// A Boolean value indicating whether this optional is not `nil` and, if so,
  /// whether it contains any elements.
  ///
  /// - Complexity: O(1).
  var isNotNilOrEmpty: Bool {
    !isNilOrEmpty
  }
}
