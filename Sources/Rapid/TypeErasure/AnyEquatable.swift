// AnyEquatable.swift
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

/// A type-erased wrapper over any value that can be compared for value
/// equality.
///
/// The AnyEquatable type forwards equality comparisons to an underlying
/// equatable value, hiding the type of the wrapped value.
public struct AnyEquatable: Equatable {
    /// The value wrapped by this instance.
    ///
    /// The base property can be cast back to its original type using one
    /// of the type casting operators (`as?`, `as!`, or `as`).
    ///
    /// ```swift
    /// let anyMessage = AnyEquatable("Hello world!")
    /// if let unwrappedMessage = anyMessage.base as? String {
    ///     print(unwrappedMessage)
    /// }
    /// // Prints "Hello world!"
    /// ```
    public let base: Any
    
    private let equals: (Any) -> Bool
    
    /// Creates a type-erased equatable value that wraps the given instance.
    ///
    /// - Parameter base: A value whose type conforms to `Equatable`.
    public init<T: Equatable>(_ base: T) {
        self.base = base
        self.equals = { $0 as? T == base }
    }
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.equals(rhs.base)
    }
}
