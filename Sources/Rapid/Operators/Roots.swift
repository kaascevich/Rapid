// Roots.swift
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

// MARK: - Prefix Roots

prefix operator √

public extension FloatingPoint {
    /// Returns the square root of the given number, rounded to a representable
    /// value.
    ///
    /// The following example declares a function that calculates the length of
    /// the hypotenuse of a right triangle given its two perpendicular sides.
    ///
    ///     func hypotenuse(_ a: Double, _ b: Double) -> Double {
    ///         return √(a * a + b * b)
    ///     }
    ///
    ///     let (dx, dy) = (3.0, 4.0)
    ///     let distance = hypotenuse(dx, dy)
    ///     // distance == 5.0
    ///
    /// On US English keyboard layouts, the "`√`" character can be entered using ⌥V.
    ///
    /// - Parameter value: The value to calculate the square root of.
    ///
    /// - Returns: The square root of the value.
    static prefix func √ (value: Self) -> Self {
        value.squareRoot()
    }
}
