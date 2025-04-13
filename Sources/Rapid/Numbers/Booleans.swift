// This file is part of Rapid.
// Copyright © 2024-2025 Kaleb A. Ascevich
//
// Rapid is free software: you can redistribute it and/or modify it under the
// terms of the GNU Affero General Public License (GNU AGPL) as published by the
// Free Software Foundation, either version 3 of the License, or (at your
// option) any later version.
//
// Rapid is distributed in the hope that it will be useful, but WITHOUT ANY
// WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
// A PARTICULAR PURPOSE. See the GNU AGPL for more details.
//
// You should have received a copy of the GNU AGPL along with Rapid. If not, see
// <https://www.gnu.org/licenses/>.

public extension Bool {
  /// An integer representation of this value.
  ///
  /// This property evaluates to `1` if this value is `true`, and `0` otherwise.
  /// It's most useful when interfacing with legacy C code.
  var asInt: Int {
    if self { 1 } else { 0 }
  }

  /// Creates an instance from the given integer value.
  ///
  /// The result is `false` if `value` is `0`, and `true` for all other values.
  /// This initializer is most useful when interfacing with legacy C code.
  ///
  /// - Parameter value: An integer value.
  init(fromInt value: some BinaryInteger) {
    self = value.isNonzero
  }
}
