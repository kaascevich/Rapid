// Validated.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

/// A property wrapper that rejects a new value if it does not pass a
/// validation check.
///
/// For example, you can use `@Validated` to only allow numbers contained
/// within a range.
///
/// ```swift
/// func isInRange(value: Int) -> Bool {
///   (5...10).contains(value)
/// }
///
/// @Validated(if: isInRange)
/// var value = 7 // value == 7
///
/// value = 29    // value == 7
/// value = 9     // value == 9
/// ```
@propertyWrapper public struct Validated<Value> {
  /// A function type that validates a value.
  public typealias Validator = (Value) -> Bool
  
  /// The wrapped value.
  ///
  /// On mutation, this property is reverted to the old value if
  /// calling `validator` with this property returns `false`.
  public var wrappedValue: Value {
    didSet {
      if !validator(wrappedValue) {
        wrappedValue = oldValue
      }
    }
  }
  
  /// Validates the provided value.
  ///
  /// This function should return `true` if the value is valid and
  /// should be kept, and `false` otherwise.
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
    
    precondition(validator(wrappedValue), "initial value of \(wrappedValue) is invalid")
    self.wrappedValue = wrappedValue
  }
}
