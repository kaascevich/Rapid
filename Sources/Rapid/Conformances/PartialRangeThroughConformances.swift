// Copyright © 2024-2025 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

extension PartialRangeThrough: @retroactive Equatable {
  /// Returns a Boolean value indicating whether two partial ranges are equal.
  ///
  /// Two partial ranges are equal when they have the same upper bounds.
  ///
  /// ```swift
  /// let x = ...15
  /// print(x == ...15)  // Prints "true"
  /// print(x == ...20)  // Prints "false"
  /// ```
  ///
  /// - Parameters:
  ///   - lhs: A range to compare.
  ///   - rhs: Another range to compare.
  ///
  /// - Returns: Whether the two ranges are equal.
  @inlinable public static func == (lhs: Self, rhs: Self) -> Bool {
    lhs.upperBound == rhs.upperBound
  }
}

extension PartialRangeThrough: @retroactive Hashable where Bound: Hashable {
  @inlinable public func hash(into hasher: inout Hasher) {
    hasher.combine(upperBound)
  }
}

extension PartialRangeThrough: @retroactive CustomStringConvertible {
  /// A textual representation of the range.
  public var description: String {
    "...\(upperBound)"
  }
}

extension PartialRangeThrough: @retroactive CustomDebugStringConvertible {
  /// A textual representation of the range, suitable for debugging.
  public var debugDescription: String {
    "PartialRangeThrough(...\(String(reflecting: upperBound)))"
  }
}

extension PartialRangeThrough: @retroactive CustomReflectable {
  public var customMirror: Mirror {
    Mirror(self, children: ["upperBound": upperBound])
  }
}
