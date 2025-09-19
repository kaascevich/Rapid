// SPDX-FileCopyrightText: 2024 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

/// A property wrapper that applies a transformation to the wrapped value.
///
/// For example, you can use `@Transformed` to automatically negate a value upon
/// assigning it.
///
/// ```swift
/// @Transformed(with: -)
/// var value = 5  // value == -5
///
/// value = -346   // value == 346
/// ```
@propertyWrapper
public struct Transformed<Value: ~Copyable>: ~Copyable {
  /// A function type that transforms a value.
  public typealias Transform = (borrowing Value) -> Value

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
  public init(
    wrappedValue: consuming Value,
    with transform: @escaping Transform,
  ) {
    self.transform = transform
    self.wrappedValue = transform(wrappedValue)
  }
}

extension Transformed: Copyable where Value: Copyable {}
