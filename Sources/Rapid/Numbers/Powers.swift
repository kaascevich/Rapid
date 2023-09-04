// Powers.swift
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

#if canImport(Foundation)

import Foundation

precedencegroup PowerPrecedence {
    higherThan: MultiplicationPrecedence
    associativity: left
}

infix operator **: PowerPrecedence
infix operator **=: AssignmentPrecedence

public extension Double {
    /// Returns a number raised to a given power.
    ///
    /// - Parameters:
    ///   - base: A number.
    ///   - exponent: Another number.
    ///
    /// - Returns: The result of raising `base` to `exponent`.
    static func ** (base: Self, exponent: Self) -> Self {
        pow(base, exponent)
    }
    
    /// Raises a number to the given power and assigns the result.
    ///
    /// - Parameters:
    ///   - base: A number.
    ///   - exponent: Another number.
    static func **= (base: inout Self, exponent: Self) {
        base = base ** exponent
    }
}

#endif
