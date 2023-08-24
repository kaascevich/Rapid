// Constants.swift
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

/// The mathematical constant pi (π), approximately equal to 3.14159.
///
/// When measuring an angle in radians, π is equivalent to a half-turn.
///
/// This value is rounded toward zero to keep user computations with angles
/// from inadvertently ending up in the wrong quadrant.
///
/// ```swift
/// print(π)
/// // Prints "3.14159265358979"
/// ```
///
/// This value is equivalent to `Double.pi`.
public let π = Double.pi
