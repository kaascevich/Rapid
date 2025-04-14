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

// TODO: Figure out how to make this work without Foundation
#if canImport(Foundation)

import func Foundation.pow

precedencegroup PowerPrecedence {
  higherThan: MultiplicationPrecedence
  associativity: right
}

infix operator ** : PowerPrecedence
infix operator **= : AssignmentPrecedence

public extension Double {
  /// Returns a number raised to a given power.
  ///
  /// - Parameters:
  ///   - base: A number.
  ///   - exponent: Another number.
  ///
  /// - Returns: The result of raising `base` to `exponent`.
  static func ** (base: Self, exponent: Self) -> Self {
    pow(base, exponent)
  }

  /// Raises a number to the given power and assigns the result.
  ///
  /// - Parameters:
  ///   - base: A number.
  ///   - exponent: Another number.
  @inlinable static func **= (base: inout Self, exponent: Self) {
    base = base ** exponent
  }
}

#endif
