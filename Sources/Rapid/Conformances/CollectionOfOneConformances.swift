// This file is part of BrainflipKit.
// Copyright © 2024-2025 Kaleb A. Ascevich
//
// BrainflipKit is free software: you can redistribute it and/or modify it under
// the terms of the GNU Affero General Public License (GNU AGPL) as published by
// the Free Software Foundation, either version 3 of the License, or (at your
// option) any later version.
//
// BrainflipKit is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
// FOR A PARTICULAR PURPOSE. See the GNU AGPL for more details.
//
// You should have received a copy of the GNU AGPL along with BrainflipKit. If
// not, see <https://www.gnu.org/licenses/>.

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
      "CollectionOfOne must be instantiated with a single-element array literal",
    )

    self.init(elements.first!)
  }
}
