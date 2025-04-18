// Typealiases.swift
// Copyright © 2024 Kaleb A. Ascevich// This file is part of Rapid.
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

/// A metatype that can contain any other metatype.
@available(*, deprecated, renamed: "Any.Type")
public typealias AnyType = Any.Type

/// The return type of functions that don’t explicitly specify a return type,
/// that is, an empty tuple `()`.
///
/// When declaring a function or method, you don’t need to specify a return type
/// if no value will be returned. However, the type of a function, method, or
/// closure always includes a return type, which is `Nothing` if otherwise
/// unspecified.
///
/// Use `Nothing` or an empty tuple as the return type when declaring a closure,
/// function, or method that doesn’t return a value.
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
@available(*, deprecated, renamed: "Void")
public typealias Nothing = Void
