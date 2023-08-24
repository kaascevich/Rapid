# Result Builder Methods

Discover how you can enable `if` statements, `for` loops, and availability checks in your result builders.

Apply the `@resultBuilder` attribute to a class, structure, or enumeration to use that type as a result builder. A *result builder* is a type that builds a nested data structure step by step. You use result builders to implement a domain-specific language (DSL) for creating nested data structures in a natural, declarative way. For an example of how to use the `@resultBuilder` attribute, see <doc:AboutResultBuilders>.

## Result-Building Methods

A result builder implements the static methods described below. Because all of the result builder's functionality is exposed through static methods, you don't ever initialize an instance of that type. A result builder must implement either the `buildBlock(_:)` method or both the `buildPartialBlock(first:)` and `buildPartialBlock(accumulated:next:)` methods. The other methods -- which enable additional functionality in the DSL -- are optional. The declaration of a result builder type doesn't actually have to include any protocol conformances.

The descriptions of the static methods uses three types as placeholders. The type `Expression` is a placeholder for the type of the result builder's input, `Component` is a placeholder for the type of a partial result, and `FinalResult` is a placeholder for the type of the result that the result builder produces. You replace these types with the actual types that your result builder uses. If your result-building methods don't specify a type for `Expression` or `FinalResult`, they default to being the same as `Component`.

The block-building methods are as follows:

 - term `static func buildBlock(_ components: Component...) -> Component`: Combines an array of partial results into a single partial result.

 - term `static func buildPartialBlock(first: Component) -> Component`: Builds a partial result component from the first component. Implement both this method and `buildPartialBlock(accumulated:next:)` to support building blocks one component at a time. Compared to `buildBlock(_:)`, this approach reduces the need for generic overloads that handle different numbers of arguments.

 - term `static func buildPartialBlock(accumulated: Component, next: Component) -> Component`: Builds a partial result component by combining an accumulated component with a new component. Implement both this method and `buildPartialBlock(first:)` to support building blocks one component at a time. Compared to `buildBlock(_:)`, this approach reduces the need for generic overloads that handle different numbers of arguments.

A result builder can implement all three of the block-building methods listed above; in this case, availability determines which method is called. By default, Swift calls the `buildPartialBlock(first:)` and `buildPartialBlock(accumulated:next:)` methods. To make Swift call `buildBlock(_:)` instead, mark the enclosing declaration as being available before the availability you write on `buildPartialBlock(first:)` and `buildPartialBlock(accumulated:next:)`.

The additional result-building methods are as follows:

 - term `static func buildOptional(_ component: Component?) -> Component`: Builds a partial result from another partial result that can be `nil`. Implement this method to support `if` statements that don't include an `else` clause.

 - term `static func buildEither(first: Component) -> Component`: Builds a partial result whose value varies depending on some condition. Implement both this method and `buildEither(second:)` to support `switch` statements and `if` statements that include an `else` clause.

 - term `static func buildEither(second: Component) -> Component`: Builds a partial result whose value varies depending on some condition. Implement both this method and `buildEither(first:)` to support `switch` statements and `if` statements that include an `else` clause.

 - term `static func buildArray(_ components: [Component]) -> Component`: Builds a partial result from an array of partial results. Implement this method to support `for` loops.

 - term `static func buildExpression(_ expression: Expression) -> Component`: Builds a partial result from an expression. You can implement this method to perform preprocessing -- for example, converting expressions to an internal type -- or to provide additional information for type inference at use sites.

 - term `static func buildFinalResult(_ component: Component) -> FinalResult`: Builds a final result from a partial result. You can implement this method as part of a result builder that uses a different type for partial and final results, or to perform other postprocessing on a result before returning it.

 - term `static func buildLimitedAvailability(_ component: Component) -> Component`: Builds a partial result that propagates or erases type information outside a compiler-control statement that performs an availability check. You can use this to erase type information that varies between the conditional branches.

For example, the code below defines a simple result builder that builds an array of integers. This code defines `Component` and `Expression` as type aliases, to make it easier to match the examples below to the list of methods above.

```swift
@resultBuilder
struct ArrayBuilder {
    typealias Component = [Int]
    typealias Expression = Int

    static func buildExpression(_ element: Expression) -> Component {
        [element]
    }

    static func buildOptional(_ component: Component?) -> Component {
        guard let component else { return [] }
        return component
    }

    static func buildEither(first component: Component) -> Component {
        component
    }

    static func buildEither(second component: Component) -> Component {
        component
    }

    static func buildArray(_ components: [Component]) -> Component {
        Array(components.joined())
    }

    static func buildBlock(_ components: Component...) -> Component {
        Array(components.joined())
    }
}
```

## Result Transformations

The following syntactic transformations are applied recursively to transform code that uses result-builder syntax into code that calls the static methods of the result builder type:

 - If the result builder has a `buildExpression(_:)` method, each expression becomes a call to that method. This transformation is always first. For example, the following declarations are equivalent:

   ```swift
   @ArrayBuilder var builderNumber: [Int] { 10 }
   var manualNumber = ArrayBuilder.buildExpression(10)
   ```

 - An assignment statement is transformed like an expression, but is understood to evaluate to `Void`. You can define an overload of `buildExpression(_:)` that takes an argument of type `Void` to handle assignments specifically.
 - A branch statement that checks an availability condition becomes a call to the `buildLimitedAvailability(_:)` method. This transformation happens before the transformation into a call to `buildEither(first:)`, `buildEither(second:)`, or `buildOptional(_:)`. You use the `buildLimitedAvailability(_:)` method to erase type information that changes depending on which branch is taken. For example, the `buildEither(first:)` and  `buildEither(second:)` methods below use a generic type that captures type information about both branches.

   ```swift
   protocol Drawable {
       func draw() -> String
   }

   struct Text: Drawable {
       var content: String
       init(_ content: String) { self.content = content }
       func draw() -> String { content }
   }

   struct Line<D: Drawable>: Drawable {
       var elements: [D]
       func draw() -> String {
           elements.map { $0.draw() }.joined(separator: "")
       }
   }

   struct DrawEither<First: Drawable, Second: Drawable>: Drawable {
       var content: Drawable
       func draw() -> String { content.draw() }
   }
   
   @resultBuilder
   struct DrawingBuilder {
       static func buildBlock<D: Drawable>(_ components: D...) -> Line<D> {
           Line(elements: components)
       }

       static func buildEither<First, Second>(first: First) -> DrawEither<First, Second> {
           DrawEither(content: first)
       }

       static func buildEither<First, Second>(second: Second) -> DrawEither<First, Second> {
           DrawEither(content: second)
       }
   }
   ```
  
   However, this approach causes a problem in code that has availability checks:

   ```swift
   @available(macOS 99, *)
   struct FutureText: Drawable {
       var content: String
       init(_ content: String) { self.content = content }
       func draw() -> String { content }
   }

   @DrawingBuilder var brokenDrawing: Drawable {
       if #available(macOS 99, *) {
           FutureText("Inside.future")  // Problem
       } else {
           Text("Inside.present")
       }
   }
   // The type of brokenDrawing is Line<DrawEither<Line<FutureText>, Line<Text>>>
   ```
  
   In the code above, `FutureText` appears as part of the type of `brokenDrawing` because it's one of the types in the `DrawEither` generic type. This could   cause your program to crash if `FutureText` isn't available at runtime, even in the case where that type is explicitly not being used.
  
   To solve this problem, implement a `buildLimitedAvailability(_:)` method to erase type information. For example, the code below builds an `AnyDrawable`   value from its availability check.
  
   ```swift
   struct AnyDrawable: Drawable {
       var content: Drawable
       func draw() -> String { content.draw() }
   }

   extension DrawingBuilder {
       static func buildLimitedAvailability(_ content: Drawable) -> AnyDrawable {
           AnyDrawable(content: content)
       }
   }
   
   @DrawingBuilder var typeErasedDrawing: Drawable {
       if #available(macOS 99, *) {
           FutureText("Inside.future")
       } else {
           Text("Inside.present")
       }
   }
   // The type of typeErasedDrawing is Line<DrawEither<AnyDrawable, Line<Text>>>
   ```

 - A branch statement becomes a series of nested calls to the `buildEither(first:)` and `buildEither(second:)` methods. The statements' conditions and cases are mapped onto the leaf nodes of a binary tree, and the statement becomes a nested call to the `buildEither` methods following the path to that leaf node from the root node.

   For example, if you write a switch statement that has three cases, the compiler uses a binary tree with three leaf nodes. Likewise, because the path from the root node to the second case is "second child" and then "first child", that case becomes a nested call like `buildEither(first: buildEither(second: ... ))`. The following declarations are equivalent:

   ```swift
   let someNumber = 19
   @ArrayBuilder var builderConditional: [Int] {
       if someNumber < 12 {
           31
       } else if someNumber == 19 {
           32
       } else {
           33
       }
   }
   
   var manualConditional: [Int]
   if someNumber < 12 {
       let partialResult = ArrayBuilder.buildExpression(31)
       let outerPartialResult = ArrayBuilder.buildEither(first: partialResult)
       manualConditional = ArrayBuilder.buildEither(first: outerPartialResult)
   } else if someNumber == 19 {
       let partialResult = ArrayBuilder.buildExpression(32)
       let outerPartialResult = ArrayBuilder.buildEither(second: partialResult)
       manualConditional = ArrayBuilder.buildEither(first: outerPartialResult)
   } else {
       let partialResult = ArrayBuilder.buildExpression(33)
       manualConditional = ArrayBuilder.buildEither(second: partialResult)
   }
   ```

 - A branch statement that might not produce a value, like an `if` statement without an `else` clause, becomes a call to `buildOptional(_:)`. If the `if` statement's condition is satisfied, its code block is transformed and passed as the argument; otherwise, `buildOptional(_:)` is called with `nil` as its argument. For example, the following declarations are equivalent:

   ```swift
   @ArrayBuilder var builderOptional: [Int] {
       if (someNumber % 2) == 1 { 20 }
   }
   
   var partialResult: [Int]? = nil
   if (someNumber % 2) == 1 {
       partialResult = ArrayBuilder.buildExpression(20)
   }
   var manualOptional = ArrayBuilder.buildOptional(partialResult)
   ```

 - A code block or `do` statement becomes a call to the `buildBlock(_:)` method. Each of the statements inside of the block is transformed, one at a time, and they become the arguments to the `buildBlock(_:)` method. For example, the following declarations are equivalent:

   ```swift
   @ArrayBuilder var builderBlock: [Int] {
       100
       200
       300
   }
   
   var manualBlock = ArrayBuilder.buildBlock(
       ArrayBuilder.buildExpression(100),
       ArrayBuilder.buildExpression(200),
       ArrayBuilder.buildExpression(300)
   )
   ```

 - A `for` loop becomes a temporary variable, a `for` loop, and a call to the `buildArray(_:)` method. The new `for` loop iterates over the sequence and appends each partial result to that array. The temporary array is passed as the argument in the `buildArray(_:)` call. For example, the following declarations are equivalent:
 
   ```swift
   @ArrayBuilder var builderArray: [Int] {
       for i in 5...7 {
           100 + i
       }
   }
   
   var temporary: [[Int]] = []
   for i in 5...7 {
       let partialResult = ArrayBuilder.buildExpression(100 + i)
       temporary.append(partialResult)
   }
   let manualArray = ArrayBuilder.buildArray(temporary)
   ```
 
 - If the result builder has a `buildFinalResult(_:)` method, the final result becomes a call to that method. This transformation is always last.

Although the transformation behavior is described in terms of temporary variables, using a result builder doesn't actually create any new declarations that are visible from the rest of your code.

You can't use `break`, `continue`, `defer`, `guard`, `return`, `while`, or `do`-`catch` statements in the code that a result builder transforms.

The transformation process doesn't change declarations in the code, which lets you use temporary constants and variables to build up expressions piece by piece. It also doesn't change `throw` statements, compile-time diagnostic statements, or closures that contain a `return` statement.

Whenever possible, transformations are coalesced. For example, the expression `4 + 5 * 6` becomes `buildExpression(4 + 5 * 6)` rather than multiple calls to that function. Likewise, nested branch statements become a single binary tree of calls to the `buildEither` methods.

## Custom Result-Builder Attributes

Creating a result builder type creates a custom attribute with the same name. You can apply that attribute in the following places:

 - On a function declaration, the result builder builds the body of the function.
 - On a variable or subscript declaration that includes a getter, the result builder builds the body of the getter.
 - On a parameter in a function declaration, the result builder builds the body of a closure that's passed as the corresponding argument.

Applying a result builder attribute doesn't impact ABI compatibility. Applying a result builder attribute to a parameter makes that attribute part of the function's interface, which can affect source compatibility.
