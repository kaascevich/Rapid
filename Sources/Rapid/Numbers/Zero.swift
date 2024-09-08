// Zero.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

public extension AdditiveArithmetic {
  /// A Boolean value indicating whether this value is equal to the zero
  /// value.
  var isZero: Bool { self == .zero }
  
  /// A Boolean value indicating whether this value is not equal to the
  /// zero value.
  var isNonzero: Bool { !isZero }
}
