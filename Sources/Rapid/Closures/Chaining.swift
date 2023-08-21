// Chaining.swift
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

import Foundation

// MARK: - Chainable Definition

/// A marker protocol that enables a type to use the ``then(_:)-7emy7`` and
/// ``do(_:)`` methods.
///
/// Since Swift doesn't allow extending `Any` or related metatypes, types
/// that wish to enable these features need to conform to `Chainable` manually.
///
/// See the Conforming Types section below for a list of conformances provided
/// by Rapid -- most standard library and Foundation types are included, along
/// with almost all Objective-C classes.
public protocol Chainable { }

public extension Chainable {
    /// Mutates a copy of `self`.
    ///
    /// The `then(_:)` method mutates a copy of `self` and returns the
    /// result. It's useful for types that require properties to be
    /// configured, such as formatter components:
    ///
    /// ```swift
    /// let components = PersonNameComponents().then {
    ///     $0.givenName = "John"
    ///     $0.familyName = "Appleseed"
    /// }
    /// ```
    ///
    /// - Parameter closure: The closure to execute. Recieves a copy of
    ///   `self` to mutate.
    ///
    /// - Returns: The return value of the closure.
    ///
    /// ## See Also
    ///
    /// - ``do(_:)``
    /// - ``run(_:)``
    /// - ``Chainable/then(_:)-4mhy8``
    func then(_ closure: (inout Self) throws -> Void) rethrows -> Self {
        var copy = self
        try closure(&copy)
        return copy
    }
    
    /// Executes a closure, passing it a copy of `self`.
    ///
    /// The `do(_:)` method is useful when you need to perform several
    /// operations involving a specific value. For instance, the following
    /// code:
    ///
    /// ```swift
    /// editor.do {
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
    /// - Parameter closure: The closure to execute. Recieves a copy of
    ///  `self`.
    ///
    /// ## See Also
    ///
    /// - ``run(_:)``
    /// - ``Chainable/then(_:)-7emy7``
    /// - ``Chainable/then(_:)-4mhy8``
    func `do`(_ closure: (Self) throws -> Void) rethrows {
        try closure(self)
    }
}

public extension Chainable where Self: AnyObject {
    /// Mutates `self` in place.
    ///
    /// The `then(_:)` method mutates `self` and returns the result. It's
    /// useful for types that require properties to be configured, such as
    /// formatters:
    ///
    /// ```swift
    /// let formatter = NumberFormatter().then {
    ///     $0.numberStyle = .decimal
    ///     $0.minimumFractionDigits = 2
    ///     $0.allowsFloats = true
    /// }
    /// ```
    ///
    /// - Parameter closure: The closure to execute. Recieves a reference
    ///   to `self`.
    ///
    /// - Returns: The return value of the closure.
    ///
    /// ## See Also
    ///
    /// - ``do(_:)``
    /// - ``run(_:)``
    /// - ``Chainable/then(_:)-7emy7``
    func then(_ closure: (Self) throws -> Void) rethrows -> Self {
        try closure(self)
        return self
    }
}

// MARK: - Classes

// This effectively makes every Objective-C type Chainable.
extension NSObject: Chainable { }

// MARK: - Strings

extension String: Chainable { }
extension Substring: Chainable { }
extension Character: Chainable { }

@available(iOS 15, macOS 12, macCatalyst 15, tvOS 15, watchOS 8, *) extension AttributedString: Chainable { }
@available(iOS 15, macOS 12, macCatalyst 15, tvOS 15, watchOS 8, *) extension AttributedSubstring: Chainable { }

// MARK: - Collections

extension Array: Chainable { }
extension Set: Chainable { }
extension Dictionary: Chainable { }

extension ArraySlice: Chainable { }
extension CollectionDifference: Chainable { }
extension CollectionOfOne: Chainable { }
extension ContiguousArray: Chainable { }
extension EmptyCollection: Chainable { }
extension KeyValuePairs: Chainable { }

extension DropFirstSequence: Chainable { }
extension DropWhileSequence: Chainable { }
extension EnumeratedSequence: Chainable { }
extension FlattenSequence: Chainable { }
extension IteratorSequence: Chainable { }
extension JoinedSequence: Chainable { }
extension PrefixSequence: Chainable { }
extension Repeated: Chainable { }
extension ReversedCollection: Chainable { }
extension Slice: Chainable { }
extension StrideThrough: Chainable { }
extension StrideTo: Chainable { }

// MARK: - Async Sequences

@available(iOS 15, macOS 12, macCatalyst 15, tvOS 15, watchOS 8, *) extension AsyncCharacterSequence: Chainable { }
extension AsyncCompactMapSequence: Chainable { }
extension AsyncDropFirstSequence: Chainable { }
extension AsyncDropWhileSequence: Chainable { }
extension AsyncFilterSequence: Chainable { }
extension AsyncFlatMapSequence: Chainable { }
extension AsyncMapSequence: Chainable { }
extension AsyncPrefixSequence: Chainable { }
extension AsyncPrefixWhileSequence: Chainable { }
extension AsyncStream: Chainable { }

// MARK: - Async Throwing Sequences

extension AsyncThrowingCompactMapSequence: Chainable { }
extension AsyncThrowingDropWhileSequence: Chainable { }
extension AsyncThrowingFilterSequence: Chainable { }
extension AsyncThrowingFlatMapSequence: Chainable { }
extension AsyncThrowingMapSequence: Chainable { }
extension AsyncThrowingPrefixWhileSequence: Chainable { }
extension AsyncThrowingStream: Chainable { }

// MARK: - Lazy Sequences

extension LazyDropWhileSequence: Chainable { }
extension LazyFilterSequence: Chainable { }
extension LazyMapSequence: Chainable { }
extension LazyPrefixWhileSequence: Chainable { }
extension LazySequence: Chainable { }

// MARK: - Erased Types

extension AnyBidirectionalCollection: Chainable { }
extension AnyCollection: Chainable { }
extension AnyHashable: Chainable { }
extension AnyIndex: Chainable { }
extension AnyIterator: Chainable { }
extension AnyRandomAccessCollection: Chainable { }
extension AnySequence: Chainable { }

@available(iOS 16, macOS 13, macCatalyst 16, tvOS 16, watchOS 9, *) extension AnyRegexOutput: Chainable { }

// MARK: - Ranges

extension ClosedRange: Chainable { }
extension Range: Chainable { }
extension PartialRangeFrom: Chainable { }
extension PartialRangeThrough: Chainable { }
extension PartialRangeUpTo: Chainable { }

// MARK: - Signed Integers

extension Int: Chainable { }
extension Int8: Chainable { }
extension Int16: Chainable { }
extension Int32: Chainable { }
extension Int64: Chainable { }

// MARK: - Unsigned Integers

extension UInt: Chainable { }
extension UInt8: Chainable { }
extension UInt16: Chainable { }
extension UInt32: Chainable { }
extension UInt64: Chainable { }

// MARK: - Floats

extension Double: Chainable { }
extension Float: Chainable { }

// MARK: - Dates

extension Date: Chainable { }
extension DateInterval: Chainable { }

// MARK: - Formatter Components

extension URLComponents: Chainable { }
extension DateComponents: Chainable { }
extension PersonNameComponents: Chainable { }

// MARK: - Unsafe Pointers

extension UnsafePointer: Chainable { }
extension UnsafeBufferPointer: Chainable { }
extension UnsafeRawPointer: Chainable { }
extension UnsafeRawBufferPointer: Chainable { }

extension UnsafeMutablePointer: Chainable { }
extension UnsafeMutableBufferPointer: Chainable { }
extension UnsafeMutableRawPointer: Chainable { }
extension UnsafeMutableRawBufferPointer: Chainable { }

// MARK: - Other

extension Data: Chainable { }
extension URL: Chainable { }
extension Measurement: Chainable { }

extension Bool: Chainable { }
extension Optional: Chainable { }
extension Mirror: Chainable { }

@available(iOS 16, macOS 13, macCatalyst 16, tvOS 16, watchOS 9, *) extension Regex: Chainable { }
