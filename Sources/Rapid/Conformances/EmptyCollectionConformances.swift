// Copyright © 2024-2025 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

extension EmptyCollection: @retroactive ExpressibleByArrayLiteral { }
extension EmptyCollection: ExpressibleByEmptyArrayLiteral {
  /// Creates an instance with an empty array literal.
  ///
  /// The array literal type is defined as `Never` to prevent accidental use of
  /// a non-empty array literal, since `Never` is uninhabited and therefore
  /// can't be instantiated.
  ///
  /// ```swift
  /// let nothing: EmptyCollection<Int> = []
  ///
  /// // Throws a compiler error - cannot convert 'Int' to 'Never'
  /// let something: EmptyCollection<Int> = [42]
  /// ```
  @inlinable public init(emptyArrayLiteral _: Void) {
    self.init()
  }
}

extension EmptyCollection: @retroactive ExpressibleByDictionaryLiteral {}
extension EmptyCollection: ExpressibleByEmptyDictionaryLiteral {
  /// Creates an instance with an empty dictionary literal.
  ///
  /// The dictionary literal type is defined as `(Never, Never)` to prevent
  /// accidental use of a non-empty dictionary literal, since `Never` is
  /// uninhabited and therefore can't be instantiated.
  ///
  /// ```swift
  /// let nothing: EmptyCollection<(Int, Int)> = [:]
  ///
  /// // Throws 2 compiler errors - cannot convert 'Int' to 'Never'
  /// let something: EmptyCollection<(Int, Int)> = [42: 69]
  /// ```
  @inlinable public init(emptyDictionaryLiteral _: Void) {
    self.init()
  }
}
