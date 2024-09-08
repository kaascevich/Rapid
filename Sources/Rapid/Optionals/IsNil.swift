// IsNil.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

public extension Optional {
  /// A Boolean value indicating whether this optional does not contain a
  /// value.
  var isNil: Bool { self == nil }
  
  /// A Boolean value indicating whether this optional contains a value.
  var isNotNil: Bool { !isNil }
}
