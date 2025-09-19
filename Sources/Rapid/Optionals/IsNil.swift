// SPDX-FileCopyrightText: 2024 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

extension Optional where Wrapped: ~Copyable & ~Escapable {
  /// A Boolean value indicating whether this optional does not contain a value.
  @inlinable
  public var isNil: Bool {
    self == nil
  }

  /// A Boolean value indicating whether this optional contains a value.
  @inlinable
  public var isNotNil: Bool {
    !isNil
  }
}
