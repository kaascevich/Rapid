// EquatableRange.swift
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

extension PartialRangeThrough: Equatable {
    /// Returns a Boolean value indicating whether two partial ranges are
    /// equal.
    ///
    /// Two partial ranges are equal when they have the same upper bounds.
    ///
    ///     let x = ...15
    ///     print(x == ...15)
    ///     // Prints "true"
    ///     print(x == ...20)
    ///     // Prints "false"
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

extension PartialRangeUpTo: Equatable {
    /// Returns a Boolean value indicating whether two partial ranges are
    /// equal.
    ///
    /// Two partial ranges are equal when they have the same upper bounds.
    ///
    ///     let x = ..<15
    ///     print(x == ..<15)
    ///     // Prints "true"
    ///     print(x == ..<20)
    ///     // Prints "false"
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
