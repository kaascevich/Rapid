# ``Rapid``

A host of utilities to make Swift Swiftier.

## Overview

Rapid is a package containing many of the most common extensions to the standard library (and, occasionally, other frameworks).

Within Rapid, you will find:
- Operators for the most commonly used features, such as ``§(_:)`` to create `String` representations
- Unicode versions of built-in operators, such as ``Swift/Equatable/≠(_:_:)`` instead of `!=(_:_:)`
- Property wrappers, such as ``Transformed`` or ``Clamped``
- Global constants for commonly used values, such as ``π`` for `Double.pi`
- Computed properties to simplify common comparisons, such as ``Swift/Optional/isNil`` or ``Swift/Collection/isNotEmpty``
- Inverted versions of methods, such as ``Swift/Sequence/last(where:)`` or ``Swift/Sequence/noneSatisfy(_:)``
- Syntactic sugar for working on specific values, such as ``configure(_:using:)`` or ``run(with:do:)``
- Methods and subscripts that return `nil` instead of crashing when invalid arguments are passed
- And more...

## Using Rapid

### Using in a Swift package

1. Add Rapid to your package manifest:

```swift
.package(
    url: "https://github.com/kaascevich/Rapid.git",
    branch: "main"
)
```

2. Add Rapid as a dependency for each of your targets:

```swift
.product(
    name: "Rapid",
    package: "Rapid"
)
```

### Using in an Xcode project

1. Choose *File* → *Add Package Dependencies...*
2. [Copy this link](https://github.com/kaascevich/Rapid.git), and paste it into the search bar.
3. Click *Add Package*.
4. Choose the target you want to add Rapid to, and then click *Add Package* again.

## Topics

 - <doc:Conformances>
 - <doc:Strings>
 - <doc:Numbers>
 - <doc:Sequences>
 - <doc:ResultBuilders>
 - <doc:Time>

### Closures

 - ``run(closure:)``
 - ``run(with:do:)``
 - ``configure(_:using:)``
 - ``mutate(_:using:)``
 - ``<-(_:_:)``
 - ``Swift/BinaryInteger/repeat(_:)``

### Operator Aliases

 - ``Swift/Equatable/≠(_:_:)``
 - ``Swift/Comparable/≥(_:_:)``
 - ``Swift/Comparable/≤(_:_:)``

### Optionals

 - ``Swift/Optional/isNil``
 - ``Swift/Optional/isNotNil``
 - ``Swift/Optional/?!(_:_:)``

### Comparisons

 - ``Swift/Comparable/isBetween(_:)``
 - ``Swift/Comparable/clamped(to:)``
 - ``Swift/Comparable/clamp(to:)``

### Property Wrappers

 - ``Clamped``
 - ``Transformed``
 - ``Validated``

### Type Erasure

 - ``AnyEquatable``

### Other

 - ``<=>(_:_:)``
