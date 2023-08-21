// Stringify.swift
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

prefix operator §

/// Creates a string representing the given value.
///
/// Use this operator to convert an instance of any type to its preferred
/// representation as a `String` instance. The `§` operator creates the
/// string representation of `instance` in one of the following ways,
/// depending on its protocol conformance:
///
/// - If `instance` conforms to the `TextOutputStreamable` protocol, the
///   result is obtained by calling `instance.write(to: s)` on an empty
///   string `s`.
/// - If `instance` conforms to the `CustomStringConvertible` protocol, the
///   result is `instance.description`.
/// - If `instance` conforms to the `CustomDebugStringConvertible` protocol,
///   the result is `instance.debugDescription`.
/// - An unspecified result is supplied automatically by the Swift standard
///   library.
///
/// For example, this custom `Point` struct uses the default representation
/// supplied by the standard library.
///
/// ```swift
/// struct Point {
///     let x: Int, y: Int
/// }
///
/// let p = Point(x: 21, y: 30)
/// print(§p)
/// // Prints "Point(x: 21, y: 30)"
/// ```
///
/// After adding `CustomStringConvertible` conformance by implementing the
/// `description` property, `Point` provides its own custom representation.
///
/// ```swift
/// extension Point: CustomStringConvertible {
///     var description: String {
///         return "(\(x), \(y))"
///     }
/// }
///
/// print(§p)
/// // Prints "(21, 30)"
/// ```
///
/// With US English keyboard layouts, the `§` character can be typed using
/// ⌥6.
///
/// - Parameter instance: The value for which to create a string
///   representation.
///
/// - Returns: A string representing `instance`.
public prefix func § (_ instance: Any) -> String {
    String(describing: instance)
}
