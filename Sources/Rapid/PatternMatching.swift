// PatternMatching.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

// MARK: - Errors

public extension Error where Self: Equatable {
  /// Returns a Boolean value indicating whether an error is equal to
  /// another error.
  ///
  /// You can use the pattern-matching operator (`~=`) to test whether an
  /// error equals another error. The pattern-matching operator is used
  /// internally in `case` statements for pattern matching. The following
  /// example implicitly uses the `~=` operator to test whether an error
  /// is an HTTP error:
  ///
  /// ```swift
  /// enum HTTPError: Error {
  ///   case unauthorized, notFound
  /// }
  ///
  /// func handle(_ error: Error) -> String {
  ///   switch error {
  ///     case HTTPError.unauthorized: "Unauthorized"
  ///     case is HTTPError: "HTTP Error"
  ///     default: "Unknown Error"
  ///   }
  /// }
  /// ```
  ///
  /// - Parameters:
  ///   - error: An error.
  ///   - other: Another error to match against `error`.
  ///
  /// - Returns: Whether the two errors match.
  static func ~= (error: Self, other: some Error) -> Bool {
    error == (other as? Self)
  }
}

// MARK: - Key Path Booleans

public extension KeyPath where Value == Bool {
  /// Returns a Boolean value indicating whether the property referenced
  /// by a key path is `true` for a value.
  ///
  /// You can use the pattern-matching operator (`~=`) to test whether a
  /// property referenced by a key path is `true` for a value. The
  /// pattern-matching operator is used internally in `case` statements
  /// for pattern matching.
  ///
  /// - Parameters:
  ///   - keyPath: A key path referencing a `Bool` value.
  ///   - value: Anything.
  ///
  /// - Returns: Whether the property referenced by `keyPath` is `true`
  ///   for `value`.
  static func ~= (keyPath: KeyPath, value: Root) -> Bool {
    value[keyPath: keyPath] == true
  }
}

// MARK: - Regular Expressions

@available(iOS 16, macOS 13, tvOS 16, watchOS 9, *)
public extension Regex {
  /// Returns a Boolean value indicating whether a regex matches the
  /// given string in its entirety.
  ///
  /// You can use the pattern-matching operator (`~=`) to test whether
  /// a regular expression matches the entire string you're matching
  /// against. The following example shows matching a regular expression
  /// that only matches digits, with different candidate strings.
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
  /// If `regex` includes a transformation closure that throws an error,
  /// and it does so when matching, this operator returns `false`.
  ///
  /// - Parameters:
  ///   - regex: A regular expression.
  ///   - string: The string to match `regex` against.
  ///
  /// - Returns: `true`, if `regex` successfully matches the entirety
  ///   of `string`; otherwise, `false`.
  static func ~= (regex: Self, string: String) -> Bool {
    (try? regex.wholeMatch(in: string)).isNotNil
  }
}
