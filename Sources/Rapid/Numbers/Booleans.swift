// SPDX-FileCopyrightText: 2024 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

extension BinaryInteger {
  /// Creates an instance from the given boolean value.
  ///
  /// The result is `1` if `bool` is `true`, and `0` otherwise. This initializer
  /// is most useful when interfacing with legacy C code.
  ///
  /// - Parameter bool: An boolean value.
  @inlinable
  public init(_ bool: Bool) {
    self = if bool { 1 } else { 0 }
  }
}

extension Bool {
  /// Creates an instance from the given integer value.
  ///
  /// The result is `false` if `value` is `0`, and `true` for all other values.
  /// This initializer is most useful when interfacing with legacy C code.
  ///
  /// - Parameter value: An integer value.
  @inlinable
  public init(_ value: some BinaryInteger) {
    self = value.isNonzero
  }
}

// MARK: Deprecations

extension Bool {
  @inlinable
  @available(*, deprecated, message: "replaced by BinaryInteger.init(_:)")
  public var asInt: Int {
    if self { 1 } else { 0 }
  }

  @inlinable
  @available(*, deprecated, renamed: "init(_:)")
  public init(fromInt value: some BinaryInteger) {
    self = value.isNonzero
  }
}
