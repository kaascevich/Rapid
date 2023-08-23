# ``Rapid``

A host of utilities to make Swift Swiftier.

## Overview

Rapid is a package that will (eventually) contain many of the most common extensions to the standard library (and, occasionally, Foundation).

Within Rapid, you will find:
- Operators for the most commonly used features, such as ``§(_:)`` to create `String` representations
- Unicode versions of built-in operators, such as ``Swift/Equatable/≠(_:_:)`` instead of `!=`
- Global constants for commonly used values, such as ``π`` for `Double.pi`
- Computed properties to simplify common comparisons, such as ``Swift/Optional/isNil`` or ``Swift/Collection/isNotEmpty``
- Inverted versions of methods, such as ``Swift/Sequence/last(where:)`` or ``Swift/Sequence/noneSatisfy(_:)``
- Syntactic sugar for working on specific values, such as ``Chainable/then(_:)-7emy7`` or ``Chainable/do(_:)``
- Methods and subscripts that return `nil` instead of crashing when invalid arguments are passed
- And more...

## Topics

### Result Builders

- ``SimpleResultBuilder``

### Closures

- ``Chainable``
- ``run(_:)``

### Operator Aliases

- ``Swift/Equatable/≠(_:_:)``
- ``Swift/Comparable/≥(_:_:)``
- ``Swift/Comparable/≤(_:_:)``
