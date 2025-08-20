// Copyright © 2024-2025 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

public extension Comparable {
  /// Returns this value, clamped to the given range.
  ///
  /// ```swift
  /// 1.clamped(to: 5...7)           // 5
  /// 7.clamped(to: 6...12)          // 7
  /// "e".clamped(to: "a"..."d")     // "d"
  /// 0.32.clamped(to: 0.31...0.33)  // 0.32
  /// ```
  ///
  /// - Parameter range: A closed range.
  ///
  /// - Returns: `self`, clamped to `range`.
  @inlinable func clamped(to range: ClosedRange<Self>) -> Self {
    if self > range.upperBound {
      range.upperBound
    } else if self < range.lowerBound {
      range.lowerBound
    } else {
      self
    }
  }

  /// Clamps `self` to the given range.
  ///
  /// ```swift
  /// var one = 1, seven = 7, e = "e", point32 = 0.32
  ///
  /// one.clamp(to: 5...7)            // one == 5
  /// seven.clamp(to: 6...12)         // seven == 7
  /// e.clamp(to: "a"..."d")          // e == "d"
  /// point32.clamp(to: 0.31...0.33)  // point32 == 0.32
  /// ```
  ///
  /// - Parameter range: A closed range.
  @inlinable mutating func clamp(to range: ClosedRange<Self>) {
    self = clamped(to: range)
  }
}
