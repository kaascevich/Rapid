// AnyEquatable.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

/// A type-erased wrapper over any value that can be compared for value
/// equality.
///
/// The AnyEquatable type forwards equality comparisons to an underlying
/// equatable value, hiding the type of the wrapped value.
public struct AnyEquatable: Equatable {
  /// The value wrapped by this instance.
  ///
  /// The base property can be cast back to its original type using one
  /// of the type casting operators (`as?` or `as!`).
  ///
  /// ```swift
  /// let anyMessage = AnyEquatable("Hello world!")
  /// if let unwrappedMessage = anyMessage.base as? String {
  ///   print(unwrappedMessage)
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
