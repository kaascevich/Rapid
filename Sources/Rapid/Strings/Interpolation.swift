// Interpolation.swift
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

import Foundation

public extension String.StringInterpolation {
    /// Formats the given value and interpolates it into the string literal
    /// being created.
    ///
    /// Do not call this method directly. It is used by the compiler when
    /// interpreting string interpolations. Instead, use string interpolation
    /// to create a new string by including values, literals, variables, or
    /// expressions enclosed in parentheses, prefixed by a backslash
    /// (`\(`...`)`).
    ///
    /// - Parameters:
    ///   - value: The value to format and interpolate.
    ///   - format: A format style to format `value` with.
    @available(iOS 15, macOS 12, tvOS 15, watchOS 8, *)
    mutating func appendInterpolation<Style: FormatStyle>(_ value: Style.FormatInput, format formatStyle: Style) {
        appendInterpolation(formatStyle.format(value))
    }
}
