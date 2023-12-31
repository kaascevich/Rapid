// PartialRangeFromConformances.swift
// Copyright © 2023 Kaleb A. Ascevich
//
// This package is free software: you can redistribute it and/or modify it
// under the terms of the GNU General Public License as published by the
// Free Software Foundation, either version 3 of the License, or (at your
// option) any later version.
//
// This package is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
// FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
// for more details.
//
// You should have received a copy of the GNU General Public License along
// with this package. If not, see https://www.gnu.org/licenses/.

extension PartialRangeFrom: Equatable {
    /// Returns a Boolean value indicating whether two partial ranges are
    /// equal.
    ///
    /// Two partial ranges are equal when they have the same lower bounds.
    ///
    ///     let x = 5...
    ///     print(x == 5...)
    ///     // Prints "true"
    ///     print(x == 10...)
    ///     // Prints "false"
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

extension PartialRangeFrom: Hashable where Bound: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(lowerBound)
    }
}

extension PartialRangeFrom: CustomStringConvertible {
    /// A textual representation of the range.
    public var description: String {
        "\(lowerBound)..."
    }
}

extension PartialRangeFrom: CustomDebugStringConvertible {
    /// A textual representation of the range, suitable for debugging.
    public var debugDescription: String {
        "PartialRangeFrom(\(String(reflecting: lowerBound))...)"
    }
}

extension PartialRangeFrom: CustomReflectable {
    public var customMirror: Mirror {
        Mirror(self, children: ["lowerBound": lowerBound])
    }
}
