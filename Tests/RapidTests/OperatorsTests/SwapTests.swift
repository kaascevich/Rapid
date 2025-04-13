// This file is part of BrainflipKit.
// Copyright © 2024-2025 Kaleb A. Ascevich
//
// BrainflipKit is free software: you can redistribute it and/or modify it under
// the terms of the GNU Affero General Public License (GNU AGPL) as published by
// the Free Software Foundation, either version 3 of the License, or (at your
// option) any later version.
//
// BrainflipKit is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
// FOR A PARTICULAR PURPOSE. See the GNU AGPL for more details.
//
// You should have received a copy of the GNU AGPL along with BrainflipKit. If
// not, see <https://www.gnu.org/licenses/>.

import Testing

@testable import Rapid

@Suite struct SwapTests {
  /// The `<=>` operator swaps two values.
  @Test("<=>(_:_:)") func swap() {
    var fortyTwo = 42
    var sixtyNine = 69
    fortyTwo <=> sixtyNine

    #expect(fortyTwo == 69)
    #expect(sixtyNine == 42)
  }
}
