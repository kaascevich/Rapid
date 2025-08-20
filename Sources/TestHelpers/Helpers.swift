// Copyright © 2024-2025 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

import func CwlPreconditionTesting.catchBadInstruction

/// Runs the provided block, and returns `true` if it crashed during execution.
///
/// This function runs the provided block in a separate thread and watches for
/// calls to `fatalError` and friends. If one of these calls occurs, this
/// function returns `true`; if the block ran without crashing, it returns
/// `false` instead.
///
/// If the block throws a Swift error during execution, this function returns
/// `false`.
///
/// - Warning: **Do _not_ call this function outside of a testing context.**
///
///   This function calls `CwlPreconditionTesting.catchBadInstruction(in:)`,
///   which uses Objective-C exceptions internally. The vast majority of Swift
///   and Objective-C code is _not_ exception-safe; therefore, calling this
///   outside of a testing context is **undefined behavior**.
///
/// - Parameter block: A block to run.
///
/// - Returns: `true` if the block crashed during execution; otherwise, `false`.
@MainActor public func crashes(_ block: @escaping () throws -> Void) -> Bool {
  nil != catchBadInstruction {
    do {
      try block()
    } catch {
      // if the block exited by throwing, it did _not_ crash; we should return
      // sucessfully in this case
      return
    }
  }
}

// MARK: Mocks

public enum MockError: Error, Equatable { case bad }
