# Changelog

## 1.0.1

 - A `factorial()` method has been added to `BinaryInteger`
 - Added `@Transformed` and `@Validated` property wrappers
 - Added `clamped(to:)` and `clamp(to:)` methods to `Comparable`

## 1.0.0

I'm really bad at making incremental releases.

Here are the most major changes:
 
 - Rapid now has *vastly* improved documentation all around
 - `Chainable` has been removed in favor of global functions
   - `then(_:)` for value types has been moved to `configure(_:using:)`
   - The dedicated `then(_:)` method for reference types has been removed
   - `do(_:)` has been moved to `run(with:do:)`

Other, more minor changes:

 - Operator aliases -- `≠`, `≤` and `≥` -- have been added
 - A global `π` constant for `Double.pi` has been added
 - The `@inlinable` attribute has been applied to most methods and properties
 - The implementation of `last(where:)` has been changed to use `first(where:)` instead of a `for`-`in` loop
 - A default value for the `Component` associated type of `ResultBuilder` has been added
 - The `throws` and `rethrows` keywords have been added to the `String` and `Array` result builder initializers
 - `SimpleResultBuilder` has been renamed to `ResultBuilder`
 - The `?!` operator for throwing an error when optional unwrapping fails has been added
 
I've also decided that Rapid will be kept API stable from this point onward to the best of my ability.

## 0.2.0

 - The `SimpleResultBuilder` protocol and related types have been added

## 0.1.0

 - Initial release
