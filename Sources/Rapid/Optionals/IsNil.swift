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
