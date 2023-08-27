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

postfix operator ++
postfix operator --
postfix operator &++
postfix operator &--

public extension BinaryInteger {
    @available(*, unavailable, message: "Use '+= 1' instead; see https://github.com/apple/swift-evolution/blob/main/proposals/0004-remove-pre-post-inc-decrement.md. This operator will be removed entirely in Rapid 3.")
    static postfix func ++ (_ operand: inout Self) {
        operand += 1
    }
    
    @available(*, unavailable, message: "Use '-= 1' instead; see https://github.com/apple/swift-evolution/blob/main/proposals/0004-remove-pre-post-inc-decrement.md. This operator will be removed in Rapid 3.")
    static postfix func -- (_ operand: inout Self) {
        operand -= 1
    }
}

public extension FixedWidthInteger {
    @available(*, unavailable, message: "Use '&+= 1' instead; see https://github.com/apple/swift-evolution/blob/main/proposals/0004-remove-pre-post-inc-decrement.md. This operator will be removed in Rapid 3.")
    static postfix func &++ (_ operand: inout Self) {
        operand &+= 1
    }
    
    @available(*, unavailable, message: "Use '&-= 1' instead; see https://github.com/apple/swift-evolution/blob/main/proposals/0004-remove-pre-post-inc-decrement.md. This operator will be removed in Rapid 3.")
    static postfix func &-- (_ operand: inout Self) {
        operand &-= 1
    }
}
