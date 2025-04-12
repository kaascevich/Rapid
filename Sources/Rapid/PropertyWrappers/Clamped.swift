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

/// A property wrapper that clamps a value to the provided range.
///
/// For example, you can use `@Clamped` to only allow numbers between 3
/// and 15.
///
/// ```swift
/// @Clamped(to: 3...15)
/// var value = 7 // value == 7
///
/// value = 22    // value == 15
/// value = -4    // value == 3
/// value = 9     // value == 9
/// ```
@propertyWrapper public struct Clamped<Value: Comparable> {
  /// The wrapped value.
  ///
  /// On mutation, this property is clamped to `range`.
  public var wrappedValue: Value {
    didSet {
      wrappedValue.clamp(to: range)
    }
  }

  /// The range to clamp the wrapped value to.
  public var range: ClosedRange<Value>

  /// Creates a new instance.
  ///
  /// - Parameters:
  ///   - wrappedValue: The wrapped value.
  ///   - range: A closed range.
  public init(wrappedValue: Value, to range: ClosedRange<Value>) {
    self.range = range
    self.wrappedValue = wrappedValue.clamped(to: range)
  }
}

extension Clamped: Sendable where Value: Sendable { }
