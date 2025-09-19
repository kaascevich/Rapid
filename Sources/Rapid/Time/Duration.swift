// SPDX-FileCopyrightText: 2024 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

@available(iOS 16, macOS 13, tvOS 16, watchOS 9, *)
extension Duration {
  // MARK: - Minutes

  /// Construct a `Duration` given a number of minutes represented as a
  /// `BinaryInteger`.
  ///
  /// ```swift
  /// let d: Duration = .minutes(61)
  /// ```
  ///
  /// - Parameter minutes: A number of minutes.
  ///
  /// - Returns: A `Duration` representing the given number of minutes.
  @inlinable
  public static func minutes(_ minutes: some BinaryInteger) -> Self {
    seconds(minutes * 60)
  }

  /// Construct a `Duration` given a number of minutes represented as a `Double`
  /// by converting the value into the closest attosecond scale value.
  ///
  /// ```swift
  /// let d: Duration = .minutes(20.73)
  /// ```
  ///
  /// - Parameter minutes: A number of minutes.
  ///
  /// - Returns: A `Duration` representing the given number of minutes.
  @inlinable
  public static func minutes(_ minutes: Double) -> Self {
    seconds(minutes * 60)
  }

  // MARK: - Hours

  /// Construct a `Duration` given a number of hours represented as a
  /// `BinaryInteger`.
  ///
  /// ```swift
  /// let d: Duration = .hours(49)
  /// ```
  ///
  /// - Parameter hours: A number of hours.
  ///
  /// - Returns: A `Duration` representing the given number of hours.
  @inlinable
  public static func hours(_ hours: some BinaryInteger) -> Self {
    minutes(hours * 60)
  }

  /// Construct a `Duration` given a number of hours represented as a `Double`
  /// by converting the value into the closest attosecond scale value.
  ///
  /// ```swift
  /// let d: Duration = .hours(70.8)
  /// ```
  ///
  /// - Parameter hours: A number of hours.
  ///
  /// - Returns: A `Duration` representing the given number of hours.
  @inlinable
  public static func hours(_ hours: Double) -> Self {
    minutes(hours * 60)
  }

  // MARK: - Days

  /// Construct a `Duration` given a number of days represented as a
  /// `BinaryInteger`.
  ///
  /// ```swift
  /// let d: Duration = .days(13)
  /// ```
  ///
  /// - Parameter days: A number of days.
  ///
  /// - Returns: A `Duration` representing the given number of days.
  @inlinable
  public static func days(_ days: some BinaryInteger) -> Self {
    hours(days * 24)
  }

  /// Construct a `Duration` given a number of days represented as a `Double` by
  /// converting the value into the closest attosecond scale value.
  ///
  /// ```swift
  /// let d: Duration = .days(32.54)
  /// ```
  ///
  /// - Parameter days: A number of days.
  ///
  /// - Returns: A `Duration` representing the given number of days.
  @inlinable
  public static func days(_ days: Double) -> Self {
    hours(days * 24)
  }

  // MARK: - Weeks

  /// Construct a `Duration` given a number of weeks represented as a
  /// `BinaryInteger`.
  ///
  /// ```swift
  /// let d: Duration = .weeks(56)
  /// ```
  ///
  /// - Parameter weeks: A number of weeks.
  ///
  /// - Returns: A `Duration` representing the given number of weeks.
  @inlinable
  public static func weeks(_ weeks: some BinaryInteger) -> Self {
    days(weeks * 7)
  }

  /// Construct a `Duration` given a number of weeks represented as a `Double`
  /// by converting the value into the closest attosecond scale value.
  ///
  /// ```swift
  /// let d: Duration = .weeks(48.23)
  /// ```
  ///
  /// - Parameter weeks: A number of weeks.
  ///
  /// - Returns: A `Duration` representing the given number of weeks.
  @inlinable
  public static func weeks(_ weeks: Double) -> Self {
    days(weeks * 7)
  }
}
