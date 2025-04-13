// This file is part of Rapid.
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

/// A property wrapper that applies a transformation to the wrapped value.
///
/// For example, you can use `@Transform` to automatically negate a value upon
/// assigning it.
///
/// ```swift
/// @Transformed(with: -)
/// var value = 5  // value == -5
///
/// value = -346   // value == 346
/// ```
@propertyWrapper public struct Transformed<Value> {
  /// A function type that transforms a value.
  public typealias Transform = (Value) -> Value

  /// The wrapped value.
  ///
  /// On mutation, this property is set to the result of calling ``transform``
  /// with the new value.
  public var wrappedValue: Value {
    didSet {
      wrappedValue = transform(wrappedValue)
    }
  }

  /// The transformation to apply to the wrapped value.
  ///
  /// When mutated, the wrapped value is set to the result of calling this
  /// function with the new value.
  public var transform: Transform

  /// Creates a new instance.
  ///
  /// - Parameters:
  ///   - wrappedValue: The wrapped value.
  ///   - transform: The transformation to apply to the wrapped value.
  public init(wrappedValue: Value, with transform: @escaping Transform) {
    self.transform = transform
    self.wrappedValue = transform(wrappedValue)
  }
}
