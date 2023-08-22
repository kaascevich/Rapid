# Features

## Operators

### `++` and `--`

Why doesn't Swift have these by default? You're asking the wrong person. But if you're using Rapid, you don't need to ask at all.

```swift
var x = 21
x++
// x == 22

var y = -6
y--
// y == -7
```

To avoid confusion as to what value is returned, `++` and `--` don't return a value at all.

```swift
let z = y--
// warning: constant 'z' inferred to have type '()', which may be unexpected
```

Rapid also provides `&++` and `&--`, which behave like their `&`-less counterparts but wrap when an overflow occurs.

```swift
var x = Int8.max
// x == 127

x&++
// x == -128
```

### The `<=>` operator

`swap(x, y)` in a somewhat more elegant form.

```swift
var fortyTwo = 42
var sixtyNine = 69

fortyTwo <=> sixtyNine
// fortyTwo == 69
// sixtyNine == 42
```

## Numbers

### `isPositive` and `isNegative`

```swift
let x = 7
// x.isPositive == true
// x.isNegative == false

let y = -5
// x.isPositive == false
// x.isNegative == true

let z = 0
// x.isPositive == false
// x.isNegative == false
```

### `isZero` and `isNonzero`

```swift
let x = 0
// x.isZero == true
// x.isNonzero == false

let y = 7
// x.isZero == false
// x.isNonzero == true
```

### `isEven` and `isOdd`

```swift
let x = 6
// x.isEven == true
// x.isOdd == false

let y = -3
// x.isEven == false
// x.isOff == true

let z = 0
// x.isEven == true
// x.isOff == false
```

### `absoluteValue`

```swift
let x = 5.absoluteValue
// x == 5

let y = (-8).absoluteValue
// y == 8
```

## Closures

### `run(_:)`

Syntactic sugar for self-executing closures.

```swift
let sixPlusOne = run {
    var six = 6
    six++
    return six
}
// sixPlusOne == 7
```

### `do(_:)`

```swift
editor.do {
    $0.click()
    $0.typeKey("a", modifierFlags: .command)
    $0.typeKey(.delete, modifierFlags: [])
}
```

### `then(_:)`

You know all those Objective-C types that you configure by setting their numerous properties? This method helps with that.

```swift
let formatter = NumberFormatter().then {
    $0.numberStyle = .decimal
    $0.minimumFractionDigits = 2
    $0.allowsFloats = true
}
```

### `repeat(_:)`

A more concise way to represent a `for`-`in` loop when iterating through a range of integers.

```swift
3.repeat { number in
    print(number)
}
// Prints "1"
// Prints "2"
// Prints "3"
```

## Collections

### `noneSatisfy(_:)`

```swift
let names = ["Sofia", "Camilla", "Martina", "Mateo", "Nicolás"]
let noneHaveFewerThanFive = names.noneSatisfy { $0.count < 5 }
// noneHaveFewerThanFive == true
```

### `last(where:)`

```swift
let numbers = [3, 7, 4, -2, 9, -6, 10, 1]
if let lastNegative = numbers.last(where: \.isNegative) {
    print("The last negative number is \(lastNegative).")
}
// Prints "The last negative number is -6."
```

### `count(of:)`

There are two of these: one that takes a predicate, and one that takes an element.

The one taking a predicate:

```swift
let cast = ["Vivien", "Marlon", "Kim", "Karl"]
let numberOfShortNames = cast.count { $0.count < 5 }
print(numberOfShortNames)
// Prints "2"
```

The one taking an element:

```swift
let cast = [5, 4, 9, 3, 6, 4, 1, 4, 3]
let numberOfFours = cast.count(of: 4)
print(numberOfFours)
// Prints "3"
```

### `subscript(ifExists:)`

Returns `nil` if the index isn't valid; returns the element at that index otherwise.

```swift
let streets = ["Adams", "Bryant", "Channing", "Douglas", "Evarts"]

print(streets[ifExists: 1]) // Prints Optional("Bryant")
print(streets[1])           // Prints "Bryant"

print(streets[ifExists: 7]) // Prints nil
print(streets[7])           // Fatal error: Index out of range
```

### `isNotEmpty`

If there's one reason to extend `Collection`, it's for this. If there's one reason *not* to extend `Collection`, it's because Rapid does it for you.

```swift
let horseName = "Silver"
if horseName.isNotEmpty {
    print("Hi ho, \(horseName)!")
} else {
    print("My horse has no name.")
}
// Prints "Hi ho, Silver!"
```

### `removeAll(occurrencesOf:)`

````swift
var numbers = [5, 6, 7, 8, 7, 6, 5]
numbers.removeAll(occurrencesOf: 6)
// numbers == [5, 7, 8, 7, 5]
```

## Optionals

### `isNil` and `isNotNil`

```swift
let intWithoutValue: Int? = nil
// intWithoutValue.isNil == true
// intWithoutValue.isNotNil == false

let intWithValue: Int? = 42
// intWithValue.isNil == false
// intWithValue.isNotNil == true
```

## Comparable

### `isBetween(_:)`

```swift
1.isBetween(5...7)          // false
7.isBetween(6...12)         // true
"e".isBetween("a"..."d")    // false
0.32.isBetween(0.31...0.33) // true
```

## Strings

### The `§` operator

A more concise way to write the `String(describing:)` initializer.

```swift
struct Point {
    let x: Int, y: Int
}
let p = Point(x: 21, y: 30)
print(§p)
// Prints "Point(x: 21, y: 30)"
```

### The `*` operator

A more concise way to write the `String(repeating:count:)` initializer.

```swift
let s = "ab" * 10
print(s)
// Prints "abababababababababab"
```

## Result Builders

### `SimpleResultBuilder`

A protocol that implements all result builder methods for you using a `buildResult(from:)` method.

### `StringBuilder` and `ArrayBuilder`

Create strings and arrays using result builders.
