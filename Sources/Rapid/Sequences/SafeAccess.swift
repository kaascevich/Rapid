// SPDX-FileCopyrightText: 2024 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

extension Collection {
  /// Accesses the element at the specified position, returning `nil` if the
  /// position is invalid.
  ///
  /// The following example tries to access an element of an array through its
  /// subscript, but fails because the element does not exist:
  ///
  /// ```swift
  /// var streets = ["Adams", "Bryant", "Channing", "Douglas", "Evarts"]
  /// print(streets[ifExists: 7])
  /// // Prints "nil"
  /// ```
  ///
  /// You can subscript a collection with any valid index other than the
  /// collection's end index. The end index refers to the position one past the
  /// last element of a collection, so it doesn't correspond with an element.
  ///
  /// - Important: Please don't abuse this. The default subscript traps on an
  ///   out-of-bounds index for a reason.
  ///
  /// - Complexity: O(*n*), where *n* is the length of the collection.
  ///
  /// - Parameter position: The position of the element to access.
  ///
  /// - Returns: The element at the specified position, or `nil` if it doesn't
  ///   exist.
  @inlinable
  public subscript(ifExists position: Index) -> Element? {
    guard indices.contains(position) else {
      return nil
    }
    return self[position]
  }
}
