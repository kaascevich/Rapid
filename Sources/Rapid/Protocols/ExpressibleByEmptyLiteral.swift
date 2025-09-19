// SPDX-FileCopyrightText: 2024 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

/// A type that can be initialized using an empty array literal.
///
/// An empty array literal (`[]`) always has an element type of `Never`. This
/// provides a compile-time guarantee that the literal is indeed empty, since
/// `Never` is uninhabited and therefore can't be instantiated.
public protocol ExpressibleByEmptyArrayLiteral: ExpressibleByArrayLiteral {
  /// Creates an instance.
  init(emptyArrayLiteral _: Void)
}

extension ExpressibleByEmptyArrayLiteral {
  /// Creates an instance.
  @inlinable
  public init(arrayLiteral _: Never...) {
    self.init(emptyArrayLiteral: ())
  }
}

/// A type that can be initialized using an empty dictionary literal.
///
/// An empty dictionary literal (`[:]`) always has element types of `Never`.
/// This provides a compile-time guarantee that the literal is indeed empty,
/// since `Never` is uninhabited and therefore can't be instantiated.
public protocol ExpressibleByEmptyDictionaryLiteral:
  ExpressibleByDictionaryLiteral
{
  /// Creates an instance.
  init(emptyDictionaryLiteral _: Void)
}

extension ExpressibleByEmptyDictionaryLiteral {
  /// Creates an instance.
  @inlinable
  public init(dictionaryLiteral _: (Never, Never)...) {
    self.init(emptyDictionaryLiteral: ())
  }
}
