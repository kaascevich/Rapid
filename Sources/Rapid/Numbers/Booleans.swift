// Booleans.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

public extension Bool {
  /// An integer representation of this value.
  ///
  /// This property evaluates to `1` if this value is `true`, and `0`
  /// otherwise. It's most useful when interfacing with legacy C code.
  var asInt: Int { self ? 1 : 0 }
  
  /// Creates an instance from the given integer value.
  ///
  /// The result is `false` if `value` is `0`, and `true` for all other
  /// values. This initializer is most useful when interfacing with legacy
  /// C code.
  ///
  /// - Parameter value: An integer value.
  init(fromInt value: some BinaryInteger) { self = value.isNonzero }
}
