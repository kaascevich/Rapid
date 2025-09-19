// SPDX-FileCopyrightText: 2024 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

#if canImport(Foundation)
  import protocol Foundation.FormatStyle

  @available(iOS 15, macOS 12, tvOS 15, watchOS 8, *)
  extension String.StringInterpolation {
    /// Formats the given value and interpolates it into the string literal
    /// being created.
    ///
    /// Do not call this method directly. It is used by the compiler when
    /// interpreting string interpolations. Instead, use string interpolation to
    /// create a new string by including values, literals, variables, or
    /// expressions enclosed in parentheses, prefixed by a backslash
    /// (`\(`...`)`).
    ///
    /// - Parameters:
    ///   - value: The value to format and interpolate.
    ///   - formatStyle: A format style to format `value` with.
    public mutating func appendInterpolation<Style: FormatStyle>(
      _ value: Style.FormatInput,
      format formatStyle: Style
    ) {
      appendInterpolation(formatStyle.format(value))
    }
  }
#endif

extension String.StringInterpolation {
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
  @inlinable
  public mutating func appendInterpolation(
    _ value: @autoclosure () -> some Any,
    if condition: Bool
  ) {
    if condition { appendInterpolation(value()) }
  }
}
