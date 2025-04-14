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

/// A property wrapper that rejects a new value if it does not pass a validation
/// check.
///
/// For example, you can use `@Validated` to only allow numbers contained within
/// a range.
///
/// ```swift
/// func isInRange(value: Int) -> Bool {
///   (5...10).contains(value)
/// }
///
/// @Validated(if: isInRange)
/// var value = 7  // value == 7
///
/// value = 29     // value == 7
/// value = 9      // value == 9
/// ```
@propertyWrapper public struct Validated<Value> {
  /// A function type that validates a value.
  public typealias Validator = (Value) -> Bool

  /// The underlying value.
  private var _wrappedValue: Value

  /// The wrapped value.
  ///
  /// On mutation, this property is reverted to the old value if calling
  /// `validator` with this property returns `false`.
  public var wrappedValue: Value {
    get { _wrappedValue }
    set {
      if validator(newValue) {
        _wrappedValue = newValue
      }
    }
  }

  /// Validates the provided value.
  ///
  /// This function should return `true` if the value is valid and should be
  /// kept, and `false` otherwise.
  public var validator: Validator

  /// Creates a new instance.
  ///
  /// - Parameters:
  ///   - wrappedValue: The wrapped value.
  ///   - validator: A closure that validates a value.
  ///
  /// - Precondition: `validator(wrappedValue) == true`.
  public init(wrappedValue: Value, if validator: @escaping Validator) {
    self.validator = validator

    precondition(
      validator(wrappedValue),
      "initial value of \(wrappedValue) is invalid",
    )
    self._wrappedValue = wrappedValue
  }
}
