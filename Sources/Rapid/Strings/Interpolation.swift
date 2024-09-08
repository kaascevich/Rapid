// Interpolation.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

#if canImport(Foundation)

import Foundation

@available(iOS 15, macOS 12, tvOS 15, watchOS 8, *)
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
  ///   - formatStyle: A format style to format `value` with.
  mutating func appendInterpolation<Style: FormatStyle>(_ value: Style.FormatInput, format formatStyle: Style) {
    appendInterpolation(formatStyle.format(value))
  }
}

#endif

public extension String.StringInterpolation {
  /// Interpolates the given value into the string literal being created
  /// if the provided condition is `true`.
  ///
  /// Do not call this method directly. It is used by the compiler when
  /// interpreting string interpolations. Instead, use string interpolation
  /// to create a new string by including values, literals, variables, or
  /// expressions enclosed in parentheses, prefixed by a backslash
  /// (`\(`...`)`).
  ///
  /// This method uses short-circuit evaluation: The condition is evaluated
  /// first, and the value to interpolate is evaluated only if the condition
  /// evaluates to `true`.
  ///
  /// - Parameters:
  ///   - value: The value to interpolate if `condition` is `true`.
  ///   - condition: A Boolean condition.
  mutating func appendInterpolation<T>(_ value: @autoclosure () -> T, if condition: Bool) {
    if condition { appendInterpolation(value()) }
  }
}
