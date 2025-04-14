// This file is part of Rapid.
// Copyright © 2024-2025 Kaleb A. Ascevich
//
// Rapid is free software: you can redistribute it and/or modify it under the
// terms of the GNU Affero General Public License (GNU AGPL) as published by the
// Free Software Foundation, either version 3 of the License, or (at your
// option) any later version.
//
// Rapid is distributed in the hope that it will be useful, but WITHOUT ANY
// WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
// A PARTICULAR PURPOSE. See the GNU AGPL for more details.
//
// You should have received a copy of the GNU AGPL along with Rapid. If not, see
// <https://www.gnu.org/licenses/>.

#if canImport(Foundation)

import protocol Foundation.FormatStyle

@available(iOS 15, macOS 12, tvOS 15, watchOS 8, *)
public extension String.StringInterpolation {
  /// Formats the given value and interpolates it into the string literal being
  /// created.
  ///
  /// Do not call this method directly. It is used by the compiler when
  /// interpreting string interpolations. Instead, use string interpolation to
  /// create a new string by including values, literals, variables, or
  /// expressions enclosed in parentheses, prefixed by a backslash (`\(`...`)`).
  ///
  /// - Parameters:
  ///   - value: The value to format and interpolate.
  ///   - formatStyle: A format style to format `value` with.
  mutating func appendInterpolation<Style: FormatStyle>(
    _ value: Style.FormatInput,
    format formatStyle: Style,
  ) {
    appendInterpolation(formatStyle.format(value))
  }
}

#endif

public extension String.StringInterpolation {
  /// Interpolates the given value into the string literal being created if the
  /// provided condition is `true`.
  ///
  /// Do not call this method directly. It is used by the compiler when
  /// interpreting string interpolations. Instead, use string interpolation to
  /// create a new string by including values, literals, variables, or
  /// expressions enclosed in parentheses, prefixed by a backslash (`\(`...`)`).
  ///
  /// This method uses short-circuit evaluation: The condition is evaluated
  /// first, and the value to interpolate is evaluated only if the condition
  /// evaluates to `true`.
  ///
  /// - Parameters:
  ///   - value: The value to interpolate if `condition` is `true`.
  ///   - condition: A Boolean condition.
  @inlinable mutating func appendInterpolation<T>(
    _ value: @autoclosure () -> T,
    if condition: Bool,
  ) {
    if condition { appendInterpolation(value()) }
  }
}
