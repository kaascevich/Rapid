// Closures.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

// MARK: - Run

/// Runs a closure as an expression.
///
/// This is a more elegant way of creating a self-executing closure. Instead
/// of doing something like this...
///
/// ```swift
/// let something = {
///   // ...statements...
/// }()
/// ```
///
/// ...you can do this:
///
/// ```swift
/// let something = run {
///   // ...statements...
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
///   $0.click()
///   $0.typeKey("a", modifierFlags: .command)
///   $0.typeKey(.delete, modifierFlags: [])
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
public func run<Value>(
  with value: Value,
  do closure: (Value) throws -> Nothing
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
///   $0.givenName = "John"
///   $0.familyName = "Appleseed"
/// }
/// ```
///
/// - Parameters:
///   - value: Anything.
///   - closure: The closure to execute. Receives a copy of `value` to
///     mutate.
///
/// - Returns: The return value of the closure.
public func configure<Value>(
  _ value: Value,
  using closure: (inout Value) throws -> Nothing
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
///   $0.givenName = "John"
///   $0.familyName = "Appleseed"
/// }
/// ```
///
/// - Parameters:
///   - value: Anything.
///   - closure: The closure to execute. Receives a copy of `value` to
///     mutate.
///
/// - Returns: The return value of the closure.
public func <- <Value>(
  _ value: Value,
  closure: (inout Value) throws -> Nothing
) rethrows -> Value {
  try configure(value, using: closure)
}

// MARK: - Mutate

/// Mutates the provided value directly.
///
/// The `mutate(_:using:)` method mutates the given value.
///
/// - Parameters:
///   - value: Anything.
///   - closure: The closure to execute. Receives a reference to
///     `value`.
public func mutate<Value>(
  _ value: inout Value,
  using closure: (inout Value) throws -> Nothing
) rethrows {
  try closure(&value)
}
