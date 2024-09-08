// Typealiases.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

/// A metatype that can contain any other metatype.
public typealias AnyType = Any.Type

/// The return type of functions that don’t explicitly specify a return
/// type, that is, an empty tuple `()`.
///
/// When declaring a function or method, you don’t need to specify a return
/// type if no value will be returned. However, the type of a function,
/// method, or closure always includes a return type, which is `Nothing`
/// if otherwise unspecified.
///
/// Use `Nothing` or an empty tuple as the return type when declaring a
/// closure, function, or method that doesn’t return a value.
///
/// ```swift
/// // No return type declared:
/// func logMessage(_ s: String) {
///   print("Message: \(s)")
/// }
///
/// let logger: (String) -> Nothing = logMessage
/// logger("This is a void function")
/// // Prints "Message: This is a void function"
/// ```
public typealias Nothing = Void
