// CollectionOfOneConformances.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

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
      "CollectionOfOne must be instantiated with a single-element array literal"
    )
    
    self.init(elements.first!)
  }
}
