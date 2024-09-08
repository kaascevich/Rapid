# Rapid

![Swift Compatibility] ![Platform Compatibility]

[Swift Compatibility]: https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fkaascevich%2FRapid%2Fbadge%3Ftype%3Dswift-versions
[Platform Compatibility]: https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fkaascevich%2FRapid%2Fbadge%3Ftype%3Dplatforms

A host of utilities to make Swift Swiftier.

- [What's this about?](#whats-this-about)
- [Using Rapid](#using-rapid)
  - [Using in a Swift Package](#using-in-a-swift-package)
  - [Using in an Xcode project](#using-in-an-xcode-project)
- [Documentation](#documentation)
- [Changelog](/Changelog.md)
- [License](/License.md)
 
## What's this about?

Rapid is a package containing many of the most common extensions to the standard library (and, occasionally, other frameworks).

Within Rapid, you will find:
- Operators for the most commonly used features, such as `§` to create `String` representations
- Unicode versions of built-in operators, such as `≠` instead of `!=`
- Property wrappers, such as `@Transformed` or `@Clamped`
- Global constants for commonly used values, such as `π` for `Double.pi`
- Computed properties to simplify common comparisons, such as `isNil` or `isNotEmpty`
- Inverted versions of methods, such as `last(where:)` or `noneSatisfy(_:)`
- Syntactic sugar for working on specific values, such as `configure(_:_:)` or `run(with:do:)`
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

## Documentation

I've documented everything to the best of my ability. ~~However, due to an issue with the Swift Package Index, you'll need to build it yourself for now.~~ **Dunno when they fixed it, but they did! You can find it [here](https://swiftpackageindex.com/kaascevich/Rapid/main/documentation/rapid).**
