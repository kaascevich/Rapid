// Clamped.swift
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

public extension Comparable {
    /// Returns this value, clamped to the given range.
    ///
    /// ```swift
    /// 1.clamped(to: 5...7)          // 5
    /// 7.clamped(to: 6...12)         // 7
    /// "e".clamped(to: "a"..."d")    // "d""
    /// 0.32.clamped(to: 0.31...0.33) // 0.32
    /// ```
    ///
    /// - Parameter range: A closed range.
    ///
    /// - Returns: `self`, clamped to `range`.
    func clamped(to range: ClosedRange<Self>) -> Self {
        if self > range.upperBound {
            range.upperBound
        } else if self < range.lowerBound {
            range.lowerBound
        } else {
            self
        }
    }
}
