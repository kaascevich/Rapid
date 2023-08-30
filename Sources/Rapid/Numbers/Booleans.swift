// Booleans.swift
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

public extension Bool {
    /// An integer representation of this value.
    ///
    /// This property evaluates to `1` if this value is `true`, and `0`
    /// otherwise. It's most useful when interfacing with legacy C code.
    var asInt: Int {
        if self { 1 } else { 0 }
    }
}
