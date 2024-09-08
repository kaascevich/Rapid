// PartialRangeFromConformances.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

extension PartialRangeFrom: @retroactive Equatable {
  /// Returns a Boolean value indicating whether two partial ranges are
  /// equal.
  ///
  /// Two partial ranges are equal when they have the same lower bounds.
  ///
  /// ```swift
  /// let x = 5...
  /// print(x == 5...)  // Prints "true"
  /// print(x == 10...) // Prints "false"
  /// ```
  ///
  /// - Parameters:
  ///   - lhs: A range to compare.
  ///   - rhs: Another range to compare.
  ///
  /// - Returns: Whether the two ranges are equal.
  public static func == (lhs: Self, rhs: Self) -> Bool {
    lhs.lowerBound == rhs.lowerBound
  }
}

extension PartialRangeFrom: @retroactive Hashable where Bound: Hashable {
  public func hash(into hasher: inout Hasher) {
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
