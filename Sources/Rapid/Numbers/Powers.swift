// Copyright © 2024-2025 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

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
