// Copyright © 2024-2025 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

extension PartialRangeFrom: @retroactive Equatable {
  /// Returns a Boolean value indicating whether two partial ranges are equal.
  ///
  /// Two partial ranges are equal when they have the same lower bounds.
  ///
  /// ```swift
  /// let x = 5...
  /// print(x == 5...)   // Prints "true"
  /// print(x == 10...)  // Prints "false"
  /// ```
  ///
  /// - Parameters:
  ///   - lhs: A range to compare.
  ///   - rhs: Another range to compare.
  ///
  /// - Returns: Whether the two ranges are equal.
  @inlinable public static func == (lhs: Self, rhs: Self) -> Bool {
    lhs.lowerBound == rhs.lowerBound
  }
}

extension PartialRangeFrom: @retroactive Hashable where Bound: Hashable {
  @inlinable public func hash(into hasher: inout Hasher) {
    hasher.combine(lowerBound)
  }
}

extension PartialRangeFrom: @retroactive CustomStringConvertible {
  /// A textual representation of the range.
  public var description: String {
    "\(lowerBound)..."
  }
}

extension PartialRangeFrom: @retroactive CustomDebugStringConvertible {
  /// A textual representation of the range, suitable for debugging.
  public var debugDescription: String {
    "PartialRangeFrom(\(String(reflecting: lowerBound))...)"
  }
}

extension PartialRangeFrom: @retroactive CustomReflectable {
  public var customMirror: Mirror {
    Mirror(self, children: ["lowerBound": lowerBound])
  }
}
