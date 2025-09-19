// SPDX-FileCopyrightText: 2024 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

// MARK: - Errors

extension Error where Self: Equatable {
  /// Returns a Boolean value indicating whether an error is equal to another
  /// error.
  ///
  /// @DeprecationSummary {
  ///   Manually cast `other` to the appropriate type instead. **This operator
  ///   never worked correctly in the first place, so any existing usage is
  ///   likely to be a bug.**
  /// }
  @available(
    *,
    deprecated,
    message: """
      manually cast to the appropriate type instead; this operator never \
      worked properly
      """
  )
  @inlinable
  public static func ~= (error: Self, other: some Error) -> Bool {
    error == (other as? Self)
  }
}

// MARK: - Key Path Booleans

extension KeyPath where Value == Bool {
  /// Returns a Boolean value indicating whether the property referenced by a
  /// key path is `true` for a value.
  ///
  /// You can use the pattern-matching operator (`~=`) to test whether a
  /// property referenced by a key path is `true` for a value. The
  /// pattern-matching operator is used internally in `case` statements for
  /// pattern matching.
  ///
  /// - Parameters:
  ///   - keyPath: A key path referencing a `Bool` value.
  ///   - value: Anything.
  ///
  /// - Returns: Whether the property referenced by `keyPath` is `true` for
  ///   `value`.
  @inlinable
  public static func ~= (keyPath: KeyPath, value: Root) -> Bool {
    value[keyPath: keyPath] == true
  }
}

// MARK: - Regular Expressions

@available(iOS 16, macOS 13, tvOS 16, watchOS 9, *)
extension Regex {
  /// Returns a Boolean value indicating whether a regex matches the given
  /// string in its entirety.
  ///
  /// You can use the pattern-matching operator (`~=`) to test whether a regular
  /// expression matches the entire string you're matching against. The
  /// following example shows matching a regular expression that only matches
  /// digits, with different candidate strings.
  ///
  /// ```swift
  /// switch "2022" {
  ///   case /[0-9]+/: print("Match!")
  ///   default: print("No match.")
  /// }
  /// // Prints "Match!"
  ///
  /// switch "The year is 2022." {
  ///   case /[0-9]+/: print("Match!")
  ///   default: print("No match.")
  /// }
  /// // Prints "No match."
  /// ```
  ///
  /// If `regex` includes a transformation closure that throws an error, and it
  /// does so when matching, this operator returns `false`.
  ///
  /// - Note: In most cases, you should use the `wholeMatch(in:)` method to test
  ///   whether a regex matches an entire string. The pattern-matching operator
  ///   is primarily intended to enable `case` statement pattern matching.
  ///
  /// - Parameters:
  ///   - regex: A regular expression.
  ///   - string: The string to match `regex` against.
  ///
  /// - Returns: `true`, if `regex` successfully matches the entirety of
  /// `string`; otherwise, `false`.
  public static func ~= (regex: Self, string: String) -> Bool {
    (try? regex.wholeMatch(in: string)).isNotNil
  }
}
