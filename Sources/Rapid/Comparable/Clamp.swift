// Clamp.swift
// Copyright © 2024 Kaleb A. Ascevich
//
// This project is licensed under the MIT license; see `License.md` in the root
// directory of this repository for more information. If this file is missing,
// the license can also be found at <https://opensource.org/license/mit>.

public extension Comparable {
  /// Returns this value, clamped to the given range.
  ///
  /// ```swift
  /// 1.clamped(to: 5...7)          // 5
  /// 7.clamped(to: 6...12)         // 7
  /// "e".clamped(to: "a"..."d")    // "d"
  /// 0.32.clamped(to: 0.31...0.33) // 0.32
  /// ```
  ///
  /// - Parameter range: A closed range.
  ///
  /// - Returns: `self`, clamped to `range`.
  func clamped(to range: ClosedRange<Self>) -> Self {
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
  /// one.clamp(to: 5...7)           // one == 5
  /// seven.clamp(to: 6...12)        // seven == 7
  /// e.clamp(to: "a"..."d")         // e == "d"
  /// point32.clamp(to: 0.31...0.33) // point32 == 0.32
  /// ```
  ///
  /// - Parameter range: A closed range.
  mutating func clamp(to range: ClosedRange<Self>) {
    self = clamped(to: range)
  }
}
