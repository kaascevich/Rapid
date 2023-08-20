// IncrementDecrement.swift
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

// MARK: - Increment

postfix operator ++

public extension BinaryInteger {
    /// Increments the specified value by 1.
    ///
    /// The increment operator (postfix `++`) adds 1 to its argument and assigns
    /// the result to said argument.
    ///
    /// ```swift
    /// var x = 21
    /// x++
    /// // x == 22
    /// ```
    ///
    /// The resulting value must be representable in the same type as the argument.
    /// In particular, incrementing an integer type's maximum results in a value
    /// that cannot be represented.
    ///
    /// ```swift
    /// var y = Int8.max
    /// y++
    /// // Overflow error
    /// ```
    ///
    /// - Parameters:
    ///   - operand: The value to increment.
    static postfix func ++ (_ operand: inout Self) {
        operand += 1
    }
}

// MARK: - Decrement

postfix operator --

public extension BinaryInteger {
    /// Decrements the specified value by 1.
    ///
    /// The decrement operator (postfix `--`) subtracts 1 from its argument and
    /// assigns the result to said argument.
    ///
    /// ```swift
    /// var x = 21
    /// x--
    /// // x == 20
    /// ```
    ///
    /// The resulting value must be representable in the same type as the argument.
    /// In particular, decrementing an integer type's minimum results in a value
    /// that cannot be represented.
    ///
    /// ```swift
    /// var y = Int8.min
    /// y--
    /// // Overflow error
    /// ```
    ///
    /// - Parameters:
    ///   - operand: The value to decrement.
    static postfix func -- (_ operand: inout Self) {
        operand -= 1
    }
}

// MARK: - Overflowing Increment

postfix operator &++

public extension FixedWidthInteger {
    /// Increments the specified value by 1, wrapping any overflow.
    ///
    /// The masking increment operator (postfix `&++`) silently wraps any overflow
    /// that occurs during the operation. In the following example, incrementing
    /// `127` results in a value that is greater than the maximum representable
    /// `Int8` value, so the result is the partial value after discarding the
    /// overflowing bits.
    ///
    /// ```swift
    /// var x: Int8 = 27
    /// x&++
    /// // x == 28
    /// var y: Int8 = 127
    /// y&++
    /// // y == -128 (after overflow)
    /// ```
    ///
    /// - Parameters:
    ///   - operand: The value to increment.
    static postfix func &++ (_ operand: inout Self) {
        operand &+= 1
    }
}

// MARK: - Overflowing Decrement

postfix operator &--

public extension FixedWidthInteger {
    /// Decrements the specified value by 1, wrapping any overflow.
    ///
    /// The masking decrement operator (postfix `&--`) silently wraps any overflow
    /// that occurs during the operation. In the following example, decrementing
    /// `127` results in a value that is less than the minimum representable `Int8`
    /// value, so the result is the partial value after discarding the overflowing
    /// bits.
    ///
    /// ```swift
    /// var x: Int8 = -28
    /// x&--
    /// // x == -29
    /// var y: Int8 = -128
    /// y&--
    /// // y == 127 (after overflow)
    /// ```
    ///
    /// - Parameters:
    ///   - operand: The value to decrement.
    static postfix func &-- (_ operand: inout Self) {
        operand &-= 1
    }
}
