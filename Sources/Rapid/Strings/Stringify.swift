// Stringify.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

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
///   let x: Int, y: Int
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
///   var description: String {
///     return "(\(x), \(y))"
///   }
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
