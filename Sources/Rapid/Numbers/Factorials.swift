// Factorials.swift
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
    /// Returns the factorial of this value.
    ///
    /// The factorial is calculated by multiplying every number between
    /// `1` and `self`, inclusive. By convention, `0.factorial()` is `1`.
    ///
    /// - Important: Negative factorials are not defined; attempting to
    ///   calculate one will result in a runtime error.
    ///
    /// ```swift
    /// print(6.factorial())
    /// // Prints "720"
    ///
    /// print(0.factorial())
    /// // Prints "1"
    /// ```
    ///
    /// - Complexity: O(*n*), where *n* is equal to `self`.
    ///
    /// - Returns: The factorial of `self`.
    ///
    /// - Precondition: `self >= 0`.
    func factorial() -> Self {
        precondition(self ≥ .zero, "the factorial of \(self), a negative number, is not defined")
        
        guard self.isNonzero else {
            return 1
        }
        
        return (1...self).reduce(1, *)
    }
}
