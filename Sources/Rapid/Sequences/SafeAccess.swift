// SafeAccess.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

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
  /// - Important: Please don't abuse this. The default subscript traps
  ///   on an out-of-bounds index for a reason.
  ///
  /// - Complexity: O(*n*), where *n* is the length of the collection.
  ///
  /// - Parameter position: The position of the element to access.
  ///
  /// - Returns: The element at the specified position, or `nil` if it
  ///   doesn't exist.
  subscript(ifExists position: Index) -> Element? {
    guard indices.contains(position) else {
      return nil
    }
    return self[position]
  }
}
