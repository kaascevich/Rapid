// Between.swift
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
    /// Returns a Boolean value indicating whether this value is in the
    /// provided range.
    ///
    /// ```swift
    /// 1.isBetween(5...7)          // false
    /// 7.isBetween(6...12)         // true
    /// "e".isBetween("a"..."d")    // false
    /// 0.32.isBetween(0.31...0.33) // true
    /// ```
    ///
    /// - Parameter range: A closed range.
    ///
    /// - Returns: `true` if this value is contained within `range`;
    ///   otherwise, `false`.
    func isBetween(_ range: ClosedRange<Self>) -> Bool {
        range.contains(self)
    }
}
