# Changelog

## Unreleased

 - Added `appendInterpolation(_:format:)` and `appendInterpolation(_:if:)` string interpolation methods
 - `SetAlgebra` now has `+`, `+=`, `-`, and `-=` operators
 - Added `~=` operators for `Error` and `KeyPath`
 - Added `sorted(by:)` and `sorted(by:using:)` methods to `Sequence`
 - The package previously did not build on anything other than macOS. This has **hopefully** been fixed.

## 2.2.0

 - `CollectionOfOne` now conforms to `ExpressibleByArrayLiteral`
 - Added an `asInt` property and an `init(fromInt:)` initializer to `Bool`
 - Minor documentation improvements

## 2.1.1

 - `EmptyCollection` now conforms to `ExpressibleByArrayLiteral` and `ExpressibleByDictionaryLiteral`, with element types of `Never` to prevent use of non-empty literals

## 2.1.0

 - Added `mutate(_:using:)` function to mutate values directly
 - `PartialRangeFrom`, `PartialRangeThrough`, and `PartialRangeUpTo` now conform to `Equatable` `Hashable`, `CustomStringConvertible`, `CustomDebugStringConvertible`, and `CustomReflectable`
 - Added `AnyEquatable`, a type-erased wrapper for `Equatable`

## 2.0.0

 - `isBetween(_:)` now accepts a `RangeExpression` instead of only a `ClosedRange`
 - Replaced the `?!` operator's `ErrorType` with `some Error`
 - The `++`, `--`, `&++`, and `&--` operators have been marked as unavailable. They will be removed entirely in Rapid 3.
 - Added `minutes(_:)`, `hours(_:)`, `days(_:)`, and `weeks(_:)` static methods to `Duration` 
   - Each method has two overloads: one taking `some BinaryInteger`, and one taking a `Double`

## 1.3.0

 - General documentation improvements (fixing typos and whatnot).

### Potentially Breaking Changes

 - `repeat(_:)` now starts iteration from 0 instead of 1, to more closely match the behavior of the standard library
   - Issues caused by this should be trivial to fix -- just add 1 to the loop index each time you use it
 - Removed `@inlinable` from everything -- it doesn't make life any easier

## 1.2.0

 - The `++`, `--`, `&++`, and `&--` operators have been deprecated; see [this Swift Evolution proposal](https://github.com/apple/swift-evolution/blob/main/proposals/0004-remove-pre-post-inc-decrement.md) for reasons as to why. Use `+= 1`, `-= 1`, `&+= 1`, and `&-= 1` instead. The operators will be marked as unavailable in Rapid 2, and will be removed entirely in Rapid 3.
 - `Clamped` now conforms to `Sendable` when its `Value` type is `Sendable`
 - Added the `<-` operator as an alias for `configure(_:using:)`
 - Added `isNilOrEmpty` and `isNotNilOrEmpty` for optional collections

## 1.1.0

 - A `factorial()` method has been added to `BinaryInteger`
 - Added `@Clamped`, `@Transformed`, and `@Validated` property wrappers
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
