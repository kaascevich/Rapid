// Closures.swift
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

// MARK: - Run

/// Runs a closure as an expression.
///
/// This is a more elegant way of creating a self-executing closure. Instead
/// of doing something like this...
///
/// ```swift
/// let something = {
///     // ...statements...
/// }()
/// ```
///
/// ...you can do this:
///
/// ```swift
/// let something = run {
///     // ...statements...
/// }
/// ```
///
/// - Note: Don't overuse this. If you're not returning a value, and just
///   want to execute code in a separate scope, use Swift's `do` keyword
///   instead.
///
/// - Parameter closure: The closure to execute.
///
/// - Returns: The closure's return value, if any.
///
/// ## See Also
///
/// - ``run(with:do:)``
/// - ``configure(_:using:)``
/// - ``<-(_:_:)``
public func run<ReturnType>(
    closure: () throws -> ReturnType
) rethrows -> ReturnType {
    try closure()
}

/// Executes a closure, passing it a copy of the provided value.
///
/// The `run(with:do:)` method is useful when you need to perform several
/// operations involving a specific value. For instance, the following
/// code:
///
/// ```swift
/// run(with: editor) {
///     $0.click()
///     $0.typeKey("a", modifierFlags: .command)
///     $0.typeKey(.delete, modifierFlags: [])
/// }
/// ```
///
/// is equivalent to:
///
/// ```swift
/// editor.click()
/// editor.typeKey("a", modifierFlags: .command)
/// editor.typeKey(.delete, modifierFlags: [])
/// ```
///
/// - Parameters:
///   - value: Anything.
///   - closure: The closure to execute. Receives a copy of `value`.
///
/// ## See Also
///
/// - ``run(closure:)``
/// - ``configure(_:using:)``
/// - ``<-(_:_:)``
public func run<Value>(
    with value: Value,
    do closure: (Value) throws -> Void
) rethrows {
    try closure(value)
}

// MARK: - Configure

/// Mutates a copy of the provided value.
///
/// The `configure(_:using:)` method mutates a copy of the given value and
/// returns the result. It's useful for types that require properties to
/// be configured, such as formatter components:
///
/// ```swift
/// let components = configure(PersonNameComponents()) {
///     $0.givenName = "John"
///     $0.familyName = "Appleseed"
/// }
/// ```
///
/// - Parameters:
///   - value: Anything.
///   - closure: The closure to execute. Receives a copy of `value` to
///     mutate.
///
/// - Returns: The return value of the closure.
///
/// ## See Also
///
/// - ``run(closure:)``
/// - ``run(with:do:)``
/// - ``<-(_:_:)``
public func configure<Value>(
    _ value: Value,
    using closure: (inout Value) throws -> Void
) rethrows -> Value {
    var copy = value
    try closure(&copy)
    return copy
}

infix operator <-

/// Mutates a copy of the provided value.
///
/// The `<-` operator mutates a copy of the given value and returns the
/// result. It's useful for types that require properties to be configured,
/// such as formatter components:
///
/// ```swift
/// let components = PersonNameComponents() <- {
///     $0.givenName = "John"
///     $0.familyName = "Appleseed"
/// }
/// ```
///
/// - Parameters:
///   - value: Anything.
///   - closure: The closure to execute. Receives a copy of `value` to
///     mutate.
///
/// - Returns: The return value of the closure.
///
/// ## See Also
///
/// - ``run(closure:)``
/// - ``run(with:do:)``
/// - ``configure(_:using:)``
public func <- <Value>(
    _ value: Value,
    closure: (inout Value) throws -> Void
) rethrows -> Value {
    try configure(value, using: closure)
}
