// Zero.swift
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

public extension AdditiveArithmetic {
    /// A Boolean value indicating whether this value is equal to the zero
    /// value.
    var isZero: Bool {
        self == .zero
    }
    
    /// A Boolean value indicating whether this value is not equal to the
    /// zero value.
    var isNonzero: Bool {
        !isZero
    }
}
