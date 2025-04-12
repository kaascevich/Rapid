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
