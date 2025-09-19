// SPDX-FileCopyrightText: 2024 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

/// A metatype that can contain any other metatype.
///
/// @DeprecationSummary {
///   Use `Any.Type` instead.
/// }
@available(
  *,
  deprecated,
  renamed: "Any.Type",
  message: "use 'Any.Type' instead"
)
public typealias AnyType = Any.Type

/// The return type of functions that don’t explicitly specify a return type,
/// that is, an empty tuple `()`.
///
/// @DeprecationSummary {
///   Use `Void` instead.
/// }
@available(*, deprecated, renamed: "Void", message: "use 'Void' instead")
public typealias Nothing = Void
