// Typealiases.swift
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
