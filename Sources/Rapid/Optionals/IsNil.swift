// Copyright © 2024-2025 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

public extension Optional where Wrapped: ~Copyable {
  /// A Boolean value indicating whether this optional does not contain a value.
  @inlinable var isNil: Bool {
    self == nil
  }

  /// A Boolean value indicating whether this optional contains a value.
  @inlinable var isNotNil: Bool {
    !isNil
  }
}
