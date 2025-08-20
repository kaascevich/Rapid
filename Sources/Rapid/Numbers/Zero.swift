// Copyright © 2024-2025 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

public extension AdditiveArithmetic {
  /// A Boolean value indicating whether this value is equal to the zero value.
  @inlinable var isZero: Bool {
    self == .zero
  }

  /// A Boolean value indicating whether this value is not equal to the zero
  /// value.
  @inlinable var isNonzero: Bool {
    !isZero
  }
}
