// Powers.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

// TODO: Figure out how to make this work without Foundation
#if canImport(Foundation)

import Foundation

precedencegroup PowerPrecedence {
  higherThan: MultiplicationPrecedence
  associativity: right
}

infix operator **: PowerPrecedence
infix operator **=: AssignmentPrecedence

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
  static func **= (base: inout Self, exponent: Self) {
    base = base ** exponent
  }
}

#endif
