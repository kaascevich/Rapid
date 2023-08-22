// SimpleResultBuilder.swift
// Copyright © 2023 Kaleb A. Ascevich
//
// This package is free software: you can redistribute it and/or modify it
// under the terms of the GNU General Public License as published by the
// Free Software Foundation, either version 3 of the License, or (at your
// option) any later version.
//
// This package is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
// FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
// for more details.
//
// You should have received a copy of the GNU General Public License along
// with this package. If not, see https://www.gnu.org/licenses/.

/// Automatically creates all result builder methods from a single
/// `buildResult(from:)` method.
///
/// When creating a custom result builder type, consider conforming to
/// `SimpleResultBuilder` to remove boilerplate. Your type must implement
/// a `buildResult(from:)` method that takes an array of components and
/// returns the combined result of those components, as well as a
/// `buildExpression(_:)` method that takes an expression and creates a
/// component from it.
///
/// - Important: The conforming type must still be annotated with the
///   `@resultBuilder` attribute to be used as a result builder.
///
/// If the `Expression` and `Component` types are the same, you only need
/// to implement `buildResult(from:)`.
///
/// ```swift
/// @resultBuilder public enum StringBuilder: SimpleResultBuilder {
///     public typealias Expression = String
///
///     public static func buildResult(from components: [String]) -> String {
///         components.reduce("", +)
///     }
/// }
/// ```
///
/// If your type requires specialized implementations of some builder
/// methods, implement those as usual.
///
/// ```swift
/// public extension StringBuilder {
///     static func buildOptional(_ component: String?) -> String {
///         let components = component.isNotNil ? [component!] : ["Nothing"]
///         return buildResult(from: components)
///     }
/// }
/// ```
///
/// Default implementations are provided for types whose `Component` type
/// conforms to `RangeReplaceableCollection`.
///
/// ```swift
/// @resultBuilder public enum ArrayBuilder<Element>: SimpleResultBuilder {
///     public typealias Component = [Element]
///     public typealias Expression = Element
///
///     // everything else is already implemented
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
public protocol SimpleResultBuilder {
    /// The type to use when creating blocks.
    ///
    /// ## See Also
    ///
    /// ``Component``
    associatedtype Expression
    
    /// The type to use for building results.
    ///
    /// ## See Also
    ///
    /// ``Expression``
    associatedtype Component
    
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

public extension SimpleResultBuilder {
    /// Required by every result builder to build combined results from
    /// statement blocks.
    ///
    /// ```swift
    /// let string = String {
    ///     "Hello, World!"
    /// }
    /// // string == "Hello, World!"
    /// ```
    ///
    /// - Parameter components: The components to build the result from.
    ///
    /// - Returns: The result of combining all the components.
    static func buildBlock(_ components: Component...) -> Component {
        buildResult(from: components)
    }
    
    /// Enables support for `for`-`in` loops in a result builder by
    /// combining the results of all iterations into a single result.
    ///
    /// ```swift
    /// let string = String {
    ///     for i in 1...3 {
    ///         §i
    ///     }
    /// }
    /// // string == "123"
    /// ```
    ///
    /// - Parameter components: An array of components to build the result
    ///   from.
    ///
    /// - Returns: The result of combining all the components.
    static func buildArray(_ components: [Component]) -> Component {
        buildResult(from: components)
    }
    
    /// With ``buildEither(second:)``, enables support for `if`-`else` and
    /// `switch` statements by folding conditional results into a single
    /// result.
    ///
    /// ```swift
    /// let string = String {
    ///     if 42 % 2 == 0 {
    ///         "42 is even."
    ///     } else {
    ///         "42 is odd."
    ///     }
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
    static func buildEither(first component: Component) -> Component {
        buildResult(from: [component])
    }
    
    /// With ``buildEither(first:)``, enables support for `if`-`else` and
    /// `switch` statements by folding conditional results into a single
    /// result.
    ///
    /// ```swift
    /// let string = String {
    ///     if 6 * 9 == 42 {
    ///         "The universe is broken!"
    ///     } else {
    ///         "Everything's fine."
    ///     }
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
    static func buildEither(second component: Component) -> Component {
        buildResult(from: [component])
    }
    
    /// If declared, this will be called on the partial result of an
    /// `if #available` block to allow the result builder to erase type
    /// information.
    ///
    /// ```swift
    /// let string = String {
    ///     if #available(macOS 14, *) {
    ///         "macOS Sonoma"
    ///     } else {
    ///         "An older version"
    ///     }
    /// }
    /// ```
    ///
    /// - Parameter component: A component.
    ///
    /// - Returns: The `component` parameter.
    static func buildLimitedAvailability(_ component: Component) -> Component {
        buildResult(from: [component])
    }
    
    /// Enables support for `if` statements that do not have an `else`.
    ///
    /// ```swift
    /// let string = String {
    ///     if 1 + 1 == 2 {
    ///         "It's true!"
    ///     }
    /// }
    /// // string == "It's true!"
    /// ```
    ///
    /// - Parameter component: A component.
    ///
    /// - Returns: The `component` parameter, if it isn't `nil`; otherwise,
    ///   an empty result.
    static func buildOptional(_ component: Component?) -> Component {
        if let component {
            buildResult(from: [component])
        } else {
            buildResult(from: [])
        }
    }
}

public extension SimpleResultBuilder where Component == Expression {
    static func buildExpression(_ expression: Expression) -> Component {
        expression
    }
}

// MARK: - RangeReplaceableCollection Conformances

public extension SimpleResultBuilder where Component: RangeReplaceableCollection {
    static func buildResult(from components: [Component]) -> Component {
        components.reduce(.init(), +)
    }
    
    static func buildExpression(_ expression: Component.Element) -> Component {
        Component([expression])
    }
}

// MARK: - StringBuilder

public extension String {
    /// Creates a `String` using a result builder.
    @resultBuilder enum Builder: SimpleResultBuilder {
        public typealias Expression = String
    }
    
    /// Creates a new instance from a `String.Builder`.
    ///
    /// ```swift
    /// let theAnswer = String {
    ///     "6 times 9 is "
    ///     if 6 * 9 != 42 {
    ///         "not "
    ///     }
    ///     "42."
    /// }
    /// print(theAnswer)
    /// // Prints "6 times 9 is not 42."
    /// ```
    ///
    /// - Parameter stringBuilder: A `String.Builder` result builder.
    init(@Builder stringBuilder: () -> String) {
        self = stringBuilder()
    }
}

// MARK: - ArrayBuilder

public extension Array {
    /// Creates an `Array` using a result builder.
    @resultBuilder enum Builder: SimpleResultBuilder {
        public typealias Component = [Element]
        public typealias Expression = Element
    }
    
    /// Creates a new instance from an `Array.Builder`.
    ///
    /// - Parameter arrayBuilder: An `Array.Builder` result builder.
    init(@Builder arrayBuilder: () -> [Element]) {
        self = arrayBuilder()
    }
}
