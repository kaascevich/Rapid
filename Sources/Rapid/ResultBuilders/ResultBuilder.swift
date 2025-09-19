// SPDX-FileCopyrightText: 2024 Kaleb A. Ascevich
// SPDX-License-Identifier: AGPL-3.0-or-later

/// Automatically creates all result builder methods from a `buildResult(from:)`
/// method and (optionally) a `buildExpression(_:)` method.
///
/// When creating a custom result builder type, consider conforming to
/// `ResultBuilder` to remove boilerplate. Your type must implement a static
/// ``buildResult(from:)`` method that takes an array of components and returns
/// the combined result of those components, as well as a static
/// ``buildExpression(_:)`` method that takes an expression and creates a
/// component from it.
///
/// If the ``Expression`` and ``Component`` types are the same, you only need to
/// implement ``buildResult(from:)``.
///
/// - Important: The conforming type must still be annotated with the
///   `@resultBuilder` attribute to be used as a result builder.
///
/// ```swift
/// @resultBuilder public enum StringBuilder: ResultBuilder {
///   public typealias Expression = String
///
///   public static func buildResult(from components: [String]) -> String {
///     components.reduce("", +)
///   }
/// }
/// ```
///
/// If your type requires specialized implementations of some builder methods,
/// implement those as usual. Other methods will still be synthesized for you.
///
/// ```swift
/// public extension StringBuilder {
///   static func buildOptional(_ component: String?) -> String {
///     let newComponent = component ?? "Nothing"
///     return buildResult(from: [newComponent])
///   }
/// }
/// ```
///
/// Default implementations are provided for types whose ``Component`` type
/// conforms to `RangeReplaceableCollection`.
///
/// ```swift
/// @resultBuilder public enum ArrayBuilder<Element>: ResultBuilder {
///   public typealias Component = [Element]
///   public typealias Expression = Element
///
///   // everything else is already implemented
/// }
/// ```
///
/// ## Topics
///
/// ### Requirements
///
/// - ``Expression``
/// - ``Component``
/// - ``buildResult(from:)``
/// - ``buildExpression(_:)``
public protocol ResultBuilder {
  /// The type to use when creating blocks.
  ///
  /// ## See Also
  ///
  /// <doc:/documentation/Rapid/ResultBuilder/Component>
  associatedtype Expression

  /// The type to use for building results.
  ///
  /// ## See Also
  ///
  /// ``Expression``
  associatedtype Component = Expression

  /// Builds a result from an array of components.
  ///
  /// - Parameter components: The components to build the result from.
  ///
  /// - Returns: The result of combining all the components.
  static func buildResult(from components: [Component]) -> Component

  /// Builds a component from an expression.
  ///
  /// - Parameter expression: The expression to build the component from.
  ///
  /// - Returns: A component created from the expression.
  static func buildExpression(_ expression: Expression) -> Component
}

extension ResultBuilder {
  /// Required by every result builder to build combined results from statement
  /// blocks.
  ///
  /// ```swift
  /// let string = String {
  ///   "Hello, "
  ///   "World!"
  /// }
  /// // string == "Hello, World!"
  /// ```
  ///
  /// - Parameter components: The components to build the result from.
  ///
  /// - Returns: The result of combining all the components.
  public static func buildBlock(_ components: Component...) -> Component {
    buildResult(from: components)
  }

  /// Enables support for `for`-`in` loops in a result builder by combining the
  /// results of all iterations into a single result.
  ///
  /// ```swift
  /// let string = String {
  ///   for i in 1...3 { §i }
  /// }
  /// // string == "123"
  /// ```
  ///
  /// - Parameter components: An array of components to build the result from.
  ///
  /// - Returns: The result of combining all the components.
  public static func buildArray(_ components: [Component]) -> Component {
    buildResult(from: components)
  }

  /// With ``buildEither(second:)``, enables support for `if`-`else` and
  /// `switch` statements by folding conditional results into a single result.
  ///
  /// ```swift
  /// let string = String {
  ///   if 42.isMultiple(of: 2) {
  ///     "42 is even."
  ///   } else {
  ///     "42 is odd."
  ///   }
  /// }
  /// // string == "42 is even."
  /// ```
  ///
  /// - Parameter component: The first component to choose from.
  ///
  /// - Returns: The `component` parameter.
  ///
  /// ## See Also
  ///
  /// - ``buildEither(second:)``
  public static func buildEither(first component: Component) -> Component {
    buildResult(from: [component])
  }

  /// With ``buildEither(first:)``, enables support for `if`-`else` and `switch`
  /// statements by folding conditional results into a single result.
  ///
  /// ```swift
  /// let string = String {
  ///   if 6 * 9 == 42 {
  ///     "The universe is broken!"
  ///   } else {
  ///     "Everything's fine."
  ///   }
  /// }
  /// // string == "Everything's fine."
  /// ```
  ///
  /// - Parameter component: The second component to choose from.
  ///
  /// - Returns: The `component` parameter.
  ///
  /// ## See Also
  ///
  /// - ``buildEither(first:)``
  public static func buildEither(second component: Component) -> Component {
    buildResult(from: [component])
  }

  /// Called on the partial result of an `if #available` block to allow the
  /// result builder to erase type information.
  ///
  /// ```swift
  /// let string = String {
  ///   if #available(macOS 15, *) {
  ///     "macOS Sequoia"
  ///   } else {
  ///     "Some other version"
  ///   }
  /// }
  /// ```
  ///
  /// - Parameter component: A component.
  ///
  /// - Returns: The `component` parameter.
  public static func buildLimitedAvailability(_ component: Component)
    -> Component
  {
    buildResult(from: [component])
  }

  /// Enables support for `if` statements that do not have an `else`.
  ///
  /// ```swift
  /// let string = String {
  ///   if 1 + 1 == 2 {
  ///     "It's true!"
  ///   }
  /// }
  /// // string == "It's true!"
  /// ```
  ///
  /// - Parameter component: A component.
  ///
  /// - Returns: The `component` parameter, if it isn't `nil`; otherwise,  an
  ///   empty result.
  public static func buildOptional(_ component: Component?) -> Component {
    if let component {
      buildResult(from: [component])
    } else {
      buildResult(from: [])
    }
  }
}

extension ResultBuilder where Component == Expression {
  /// Builds a component from an expression.
  ///
  /// - Parameter expression: The expression to build the component from.
  ///
  /// - Returns: A component created from the expression.
  public static func buildExpression(_ expression: Expression) -> Component {
    expression
  }
}

// MARK: - RangeReplaceableCollection Conformances

extension ResultBuilder where Component: RangeReplaceableCollection {
  /// Builds a result from an array of components.
  ///
  /// - Parameter components: The components to build the result from.
  ///
  /// - Returns: The result of combining all the components.
  public static func buildResult(from components: [Component]) -> Component {
    components.reduce(.init(), +)
  }

  /// Builds a component from an expression.
  ///
  /// - Parameter expression: The expression to build the component from.
  ///
  /// - Returns: A component created from the expression.
  public static func buildExpression(
    _ expression: Component.Element
  ) -> Component {
    Component([expression])
  }
}

// MARK: - StringBuilder

extension String {
  /// Creates a `String` using a result builder.
  @resultBuilder
  public enum Builder: ResultBuilder {
    public typealias Expression = String
  }

  /// Creates a new instance from a `String.Builder`.
  ///
  /// ```swift
  /// let theAnswer = String {
  ///   "6 times 9 is "
  ///   if 6 * 9 != 42 {
  ///     "not "
  ///   }
  ///   "42."
  /// }
  /// print(theAnswer)
  /// // Prints "6 times 9 is not 42."
  /// ```
  ///
  /// - Parameter stringBuilder: A `String.Builder` result builder.
  public init(@Builder stringBuilder: () throws -> String) rethrows {
    self = try stringBuilder()
  }
}

// MARK: - ArrayBuilder

extension Array {
  /// Creates an `Array` using a result builder.
  @resultBuilder
  public enum Builder: ResultBuilder {
    public typealias Expression = Element
    public typealias Component = [Element]
  }

  /// Creates a new instance from an `Array.Builder`.
  ///
  /// - Parameter arrayBuilder: An `Array.Builder` result builder.
  public init(@Builder arrayBuilder: () throws -> [Element]) rethrows {
    self = try arrayBuilder()
  }
}
