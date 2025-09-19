// SPDX-FileCopyrightText: 2024 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

// MARK: - Addition

extension SetAlgebra {
  /// Returns a new set with the elements of both of the given sets.
  ///
  /// In the following example, the `attendeesAndVisitors` set is made up of the
  /// elements of the `attendees` and `visitors` sets:
  ///
  /// ```swift
  /// let attendees: Set = ["Alicia", "Bethany", "Diana"]
  /// let visitors = ["Marcia", "Nathaniel"]
  /// let attendeesAndVisitors = attendees + visitors
  /// print(attendeesAndVisitors)
  /// // Prints "["Diana", "Nathaniel", "Bethany", "Alicia", "Marcia"]"
  /// ```
  ///
  /// If a set already contains one or more elements that are also in the other
  /// set, the existing members are kept.
  ///
  /// ```swift
  /// let initialIndices = Set(0..<5)
  /// let expandedIndices = initialIndices + [2, 3, 6, 7]
  /// print(expandedIndices)
  /// // Prints "[2, 4, 6, 7, 0, 1, 3]"
  /// ```
  ///
  /// - Note: If the sets both contain elements that are equal but
  ///   distinguishable (e.g. via `===`), which of these elements is present in
  ///   the result is unspecified.
  ///
  /// - Parameters:
  ///   - lhs: A set.
  ///   - rhs: Another set of the same type.
  ///
  /// - Returns: A new set with the unique elements of `lhs` and `rhs`.
  @inlinable
  public static func + (lhs: Self, rhs: Self) -> Self {
    lhs.union(rhs)
  }

  /// Adds the elements of the second set to the first set.
  ///
  /// In the following example, the elements of the `visitors` set are added to
  /// the `attendees` set:
  ///
  /// ```swift
  /// var attendees: Set = ["Alicia", "Bethany", "Diana"]
  /// let visitors: Set = ["Diana", "Marcia", "Nathaniel"]
  /// attendees += visitors
  /// print(attendees)
  /// // Prints "["Diana", "Nathaniel", "Bethany", "Alicia", "Marcia"]"
  /// ```
  ///
  /// If a set already contains one or more elements that are also in the other
  /// set, the existing members are kept.
  ///
  /// ```swift
  /// let initialIndices = Set(0..<5)
  /// initialIndices += [2, 3, 6, 7]
  /// print(initialIndices)
  /// // Prints "[2, 4, 6, 7, 0, 1, 3]"
  /// ```
  ///
  /// - Note: If the sets both contain elements that are equal but
  ///   distinguishable (e.g. via `===`), which of these elements is present in
  ///   the result is unspecified.
  ///
  /// - Parameters:
  ///   - lhs: A set.
  ///   - rhs: Another set of the same type.
  @inlinable
  public static func += (lhs: inout Self, rhs: Self) {
    lhs.formUnion(rhs)
  }
}

// MARK: - Subtraction

extension SetAlgebra {
  /// Returns a new set the elements of the first set that do not occur in the
  /// second set.
  ///
  /// In the following example, the `nonNeighbors` set is made up of the
  /// elements of the `employees` set that are not elements of `neighbors`:
  ///
  /// ```swift
  /// let employees: Set = ["Alicia", "Bethany", "Chris", "Diana", "Eric"]
  /// let neighbors: Set = ["Bethany", "Eric", "Forlani", "Greta"]
  /// let nonNeighbors = employees - neighbors
  /// print(nonNeighbors)
  /// // Prints "["Diana", "Chris", "Alicia"]"
  /// ```
  ///
  /// - Parameters:
  ///   - lhs: A set.
  ///   - rhs: Another set of the same type.
  ///
  /// - Returns: A new set.
  @inlinable
  public static func - (lhs: Self, rhs: Self) -> Self {
    lhs.subtracting(rhs)
  }

  /// Removes the elements of the second set from the first set.
  ///
  /// In the following example, the elements of the `employees` set that are
  /// also members of the `neighbors` set are removed. In particular, the names
  /// `"Bethany"` and `"Eric"` are removed from `employees`.
  ///
  /// ```swift
  /// let employees: Set = ["Alicia", "Bethany", "Chris", "Diana", "Eric"]
  /// let neighbors: Set = ["Bethany", "Eric", "Forlani", "Greta"]
  /// employees -= neighbors
  /// print(employees)
  /// // Prints "["Diana", "Chris", "Alicia"]"
  /// ```
  ///
  /// - Parameters:
  ///   - lhs: A set.
  ///   - rhs: Another set of the same type.
  @inlinable
  public static func -= (lhs: inout Self, rhs: Self) {
    lhs.subtract(rhs)
  }
}
