// SPDX-FileCopyrightText: 2024 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

extension AdditiveArithmetic {
  /// A Boolean value indicating whether this value is equal to the zero value.
  @inlinable
  public var isZero: Bool {
    self == .zero
  }

  /// A Boolean value indicating whether this value is not equal to the zero
  /// value.
  @inlinable
  public var isNonzero: Bool {
    !isZero
  }
}
