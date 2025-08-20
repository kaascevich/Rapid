// Copyright © 2024-2025 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

public extension Bool {
  /// An integer representation of this value.
  ///
  /// This property evaluates to `1` if this value is `true`, and `0` otherwise.
  /// It's most useful when interfacing with legacy C code.
  @inlinable var asInt: Int {
    if self { 1 } else { 0 }
  }

  /// Creates an instance from the given integer value.
  ///
  /// The result is `false` if `value` is `0`, and `true` for all other values.
  /// This initializer is most useful when interfacing with legacy C code.
  ///
  /// - Parameter value: An integer value.
  @inlinable init(fromInt value: some BinaryInteger) {
    self = value.isNonzero
  }
}
