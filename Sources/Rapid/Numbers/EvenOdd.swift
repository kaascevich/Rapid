// EvenOdd.swift
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

public extension BinaryInteger {
    /// A Boolean value indicating whether this value is even.
    ///
    /// An integer is even if it is evenly divisible by `2`. `0` is considered
    /// even.
    ///
    /// ```swift
    /// let evenNumber = 6
    /// // evenNumber.isEven == true
    ///
    /// let oddNumber = -3
    /// // evenNumber.isEven == false
    /// ```
    var isEven: Bool { isMultiple(of: 2) }
    
    /// A Boolean value indicating whether this value is odd.
    ///
    /// An integer is odd if it is not evenly divisible by `2`. `0` is not
    /// considered odd.
    ///
    /// ```swift
    /// let oddNumber = 3
    /// // evenNumber.isOdd == true
    ///
    /// let evenNumber = -6
    /// // evenNumber.isOdd == false
    /// ```
    var isOdd: Bool { !isEven }
}
