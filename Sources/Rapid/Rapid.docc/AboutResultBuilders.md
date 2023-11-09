# About Result Builders

Implement a DSL for creating nested data structures in a natural, declarative way.

*This article was taken mostly verbatim from [The Swift Programming Language], with minor modifications.*

[The Swift Programming Language]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/

A *result builder* is a type you define that adds syntax for creating nested data, like a list or tree, in a natural, declarative way. The code that uses the result builder can include ordinary Swift syntax, like `if` and `for`, to handle conditional or repeated pieces of data.

The code below defines a few types for drawing on a single line using stars and text.

```swift
protocol Drawable {
    func draw() -> String
}

struct Line: Drawable {
    var elements: [Drawable]
    func draw() -> String {
        elements.map(\.draw).joined()
    }
}

struct Text: Drawable {
    var content: String
    init(_ content: String) { self.content = content }
    func draw() -> String { content }
}

struct Space: Drawable {
    func draw() -> String { " " }
}

struct Stars: Drawable {
    var length: Int
    func draw() -> String { .init(repeating: "*", count: length) }
}

struct AllCaps: Drawable {
    var content: Drawable
    func draw() -> String { content.draw().uppercased() }
}
```

The `Drawable` protocol defines the requirement for something that can be drawn, like a line or shape: the type must implement a `draw()` method. The `Line` structure represents a single-line drawing, and it serves as the top-level container for most drawings. To draw a `Line`, the structure calls `draw()` on each of the line's components, and then concatenates the resulting strings into a single string. The `Text` structure wraps a string to make it part of a drawing. The `AllCaps` structure wraps and modifies another drawing, converting any text in the drawing to uppercase.

It's possible to make a drawing with these types by calling their initializers:

```swift
let name: _? = "Ravi Patel"
let manualDrawing = Line(elements: [
    Stars(length: 3),
    Text("Hello"),
    Space(),
    AllCaps(content: Text("\(name ?? "World")!")),
    Stars(length: 2)
])
print(manualDrawing.draw())
// Prints "***Hello RAVI PATEL!**"
```

This code works, but it's a little awkward. The deeply nested parentheses after `AllCaps` are hard to read. The fallback logic to use `"World"` when `name` is `nil` has to be done inline using the `??` operator, which would be difficult with anything more complex. If you needed to include switches or `for` loops to build up part of the drawing, there's no way to do that. A result builder lets you rewrite code like this so that it looks like normal Swift code.

To define a result builder, you write the `@resultBuilder` attribute on a type declaration. For example, this code defines a result builder called `DrawingBuilder`, which lets you use a declarative syntax to describe a drawing:

```swift
@resultBuilder struct DrawingBuilder {
    static func buildBlock(_ components: Drawable...) -> Drawable {
        Line(elements: components)
    }

    static func buildEither(first:  Drawable) -> Drawable { first  }
    static func buildEither(second: Drawable) -> Drawable { second }
}
```

The `DrawingBuilder` structure defines three methods that implement parts of the result builder syntax. The `buildBlock(_:)` method adds support for writing a series of lines in a block of code. It combines the components in that block into a `Line`. The `buildEither(first:)` and `buildEither(second:)` methods add support for `if`-`else`.

You can apply the `@DrawingBuilder` attribute to a function's parameter, which turns a closure passed to the function into the value that the result builder creates from that closure. For example:

```swift
func draw(@DrawingBuilder content: () -> Drawable) -> Drawable {
    content()
}

func caps(@DrawingBuilder content: () -> Drawable) -> Drawable {
    AllCaps(content: content())
}

func makeGreeting(for name: String? = nil) -> Drawable {
    let greeting = draw {
        Stars(length: 3)
        Text("Hello")
        Space()
        caps {
            if let name = name {
                Text("\(name)!")
            } else {
                Text("World!")
            }
        }
        Stars(length: 2)
    }
    return greeting
}

let genericGreeting = makeGreeting()
print(genericGreeting.draw())
// Prints "***Hello WORLD!**"

let personalGreeting = makeGreeting(for: "Ravi Patel")
print(personalGreeting.draw())
// Prints "***Hello RAVI PATEL!**"
```

The `makeGreeting(for:)` function takes a `name` parameter and uses it to draw a personalized greeting. The `draw(_:)` and `caps(_:)` functions both take a single closure as their argument, which is marked with the `@DrawingBuilder` attribute. When you call those functions, you use the special syntax that `DrawingBuilder` defines. Swift transforms that declarative description of a drawing into a series of calls to the methods on `DrawingBuilder` to build up the value that's passed as the function argument. For example, Swift transforms the call to `caps(_:)` in that example into code like the following:

```swift
let capsDrawing = caps {
    let partialDrawing: Drawable
    if let name = name {
        let text = Text("\(name)!")
        partialDrawing = DrawingBuilder.buildEither(first: text)
    } else {
        let text = Text("World!")
        partialDrawing = DrawingBuilder.buildEither(second: text)
    }
    return partialDrawing
}
```

Swift transforms the `if`-`else` block into calls to the `buildEither(first:)` and `buildEither(second:)` methods. Although you don't call these methods in your own code, showing the result of the transformation makes it easier to see how Swift transforms your code when you use the `DrawingBuilder` syntax.

To add support for writing `for` loops in the special drawing syntax, add a `buildArray(_:)` method.

```swift
extension DrawingBuilder {
    static func buildArray(_ components: [Drawable]) -> Drawable {
        Line(elements: components)
    }
}
let manyStars = draw {
    Text("Stars:")
    for length in 1...3 {
        Space()
        Stars(length: length)
    }
}
```

In the code above, the `for` loop creates an array of drawings, and the `buildArray(_:)` method turns that array into a `Line`.
