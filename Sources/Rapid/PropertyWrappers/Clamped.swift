// Clamped.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

/// A property wrapper that clamps a value to the provided range.
///
/// For example, you can use `@Clamped` to only allow numbers between 3
/// and 15.
///
/// ```swift
/// @Clamped(to: 3...15)
/// var value = 7 // value == 7
///
/// value = 22    // value == 15
/// value = -4    // value == 3
/// value = 9     // value == 9
/// ```
@propertyWrapper public struct Clamped<Value: Comparable> {
  /// The wrapped value.
  ///
  /// On mutation, this property is clamped to `range`.
  public var wrappedValue: Value {
    didSet {
      wrappedValue.clamp(to: range)
    }
  }
  
  /// The range to clamp the wrapped value to.
  public var range: ClosedRange<Value>
  
  /// Creates a new instance.
  ///
  /// - Parameters:
  ///   - wrappedValue: The wrapped value.
  ///   - range: A closed range.
  public init(wrappedValue: Value, to range: ClosedRange<Value>) {
    self.range = range
    self.wrappedValue = wrappedValue.clamped(to: range)
  }
}

extension Clamped: Sendable where Value: Sendable { }
