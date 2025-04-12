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

extension PartialRangeThrough: @retroactive Equatable {
  /// Returns a Boolean value indicating whether two partial ranges are
  /// equal.
  ///
  /// Two partial ranges are equal when they have the same upper bounds.
  ///
  /// ```swift
  /// let x = ...15
  /// print(x == ...15) // Prints "true"
  /// print(x == ...20) // Prints "false"
  /// ```
  ///
  /// - Parameters:
  ///   - lhs: A range to compare.
  ///   - rhs: Another range to compare.
  ///
  /// - Returns: Whether the two ranges are equal.
  public static func == (lhs: Self, rhs: Self) -> Bool {
    lhs.upperBound == rhs.upperBound
  }
}

extension PartialRangeThrough: @retroactive Hashable where Bound: Hashable {
  public func hash(into hasher: inout Hasher) {
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
