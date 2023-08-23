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
/// Don't overuse this, though. If you're not returning a value, and just want
/// to execute code in a seperate scope, use Swift's `do` keyword:
///
/// ```swift
/// do {
///     // ...statements...
/// }
/// ```
///
/// - Parameter closure: The closure to execute.
///
/// - Returns: The closure's return value, if any.
///
/// ## See Also
///
/// - ``Chainable/then(_:)-7emy7``
/// - ``Chainable/then(_:)-4mhy8``
/// - ``Chainable/do(_:)``
@inlinable public func run<T>(_ closure: () throws -> T) rethrows -> T {
    try closure()
}
