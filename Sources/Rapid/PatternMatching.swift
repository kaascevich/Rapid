// PatternMatching.swift
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
    ///     case unauthorized, notFound
    /// }
    ///
    /// func handle(_ error: Error) -> String {
    ///     switch error {
    ///         case HTTPError.unauthorized: "Unauthorized"
    ///         case is HTTPError: "HTTP Error"
    ///         default: "Unknown Error"
    ///     }
    /// }
    /// ```
    ///
    /// - Parameters:
    ///   - error: An error.
    ///   - other: Another error to match against `pattern`.
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
    ///   - pattern: Anything.
    ///   - keyPath: A key path referencing a `Bool` value.
    ///
    /// - Returns: Whether the property referenced by `keyPath` is `true`
    ///   for `value`.
    static func ~= (keyPath: KeyPath, value: Root) -> Bool {
        value[keyPath: keyPath] == true
    }
}
