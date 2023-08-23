// ForEach.swift
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

public extension BinaryInteger where Stride: SignedInteger {
    /// Calls the given closure `self` times in the same order as a
    /// `for`-`in` loop.
    ///
    /// The two loops in the following example produce the same output:
    ///
    /// ```swift
    /// for integer in 1...3 {
    ///     print(word)
    /// }
    /// // Prints "1"
    /// // Prints "2"
    /// // Prints "3"
    ///
    /// 3.repeat { number in
    ///     print(number)
    /// }
    /// // Same as above
    /// ```
    ///
    /// The `body` closure recieves the current loop index, starting from 1.
    ///
    /// Using the `repeat` method is distinct from a `for`-`in` loop in two
    /// important ways:
    ///
    /// 1. You cannot use a `break` or `continue` statement to exit the current
    ///    call of the `body` closure or skip subsequent calls.
    /// 2. Using the `return` statement in the `body` closure will exit only from
    ///    the current call to `body`, not from any outer scope, and won't skip
    ///    subsequent calls.
    ///
    /// - Parameter body: A closure that takes an instance of `Self` as a parameter.
    @inlinable func `repeat`(_ body: (Self) throws -> Void) rethrows {
        try (1...self).forEach(body)
    }
}
