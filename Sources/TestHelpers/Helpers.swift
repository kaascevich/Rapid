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

import func CwlPreconditionTesting.catchBadInstruction

/// Runs the provided block, and returns `true` if it crashed during execution.
///
/// This function runs the provided block in a separate thread and watches for
/// calls to `fatalError` and friends. If one of these calls occurs, this
/// function returns `true`; if the block ran without crashing, it returns
/// `false` instead.
///
/// If the block throws a Swift error during execution, this function returns
/// `true`.
///
/// - Warning: **Do _not_ call this function outside of a testing context.**
///
///   This function calls `CwlPreconditionTesting.catchBadInstruction(in:)` to
///   check for crashes; that function uses Objective-C exceptions internally.
///   The vast majority of Swift and Objective-C functions are _not_
///   exception-safe; therefore, calling this function outside of a testing
///   context is **undefined behavior**.
///
/// - Parameter block: A block to run.
///
/// - Returns: `true` if the block crashed during execution; otherwise, `false`.
@MainActor package func crashes(_ block: @escaping () throws -> Void) -> Bool {
  catchBadInstruction {
    do {
      try block()
    } catch {
      // if the block exited by throwing, it did _not_ crash; we should return
      // sucessfully in this case
      return
    }
  } != nil
}

// MARK: Mocks

package enum MockError: Error, Equatable { case bad }
