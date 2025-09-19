// SPDX-FileCopyrightText: 2024 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

extension CollectionOfOne: @retroactive ExpressibleByArrayLiteral {
  /// Creates an instance with a single-element array literal.
  ///
  /// ```swift
  /// let oneElement: CollectionOfOne<Int> = [42]
  ///
  /// // Fatal errors: CollectionOfOne must be instantiated with a single-element array literal
  /// let noElements: CollectionOfOne<Int> = []
  /// let twoElements: CollectionOfOne<Int> = [42, 69]
  /// ```
  ///
  /// - Parameter elements: An array literal with one element.
  ///
  /// - Precondition: `elements.count == 1`.
  public init(arrayLiteral elements: Element...) {
    precondition(
      elements.count == 1,
      """
      CollectionOfOne must be instantiated with a single-element array literal
      """
    )

    self.init(elements.first!)
  }
}
