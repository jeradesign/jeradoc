# Swift Cheat Sheet

## Strings

```swift
let actor = "Denzel Washington"
let filename = "paris.jpg"
let result = "⭐️ You win! ⭐️"

let quote = "Then he tapped a sign saying \"Believe\" and walked away."

let movie = """
    A day in
    the life of an
    Apple engineer
    """ // whitespace ahead of lines trimmed to here

actor.count // 17

result.uppercased() // "⭐️ YOU WIN! ⭐️"
movie.hasPrefix("a day") // false -- case matters!
filename.hasSuffix(".jpg") // true

string.components(separatedBy: "\n")
string.trimmingCharacters(in: .whitespacesAndNewlines)
```

## Arrays

```swift
var presidents = ["Washington", "Adams", "Jefferson", "Madison", "Monroe", "Adams"]
```

### Transforming (non-mutating)

```swift
map(_:) // from Sequence
flatMap(_:) // append elements of returned sequences individually
compactMap() // non-nil returned elements only
reduce(_:_:) // closure returns a new result object
reduce(into:_:) // closure mutates inout result object
lazy:
```

### Reordering

| Mutating            | Non-Mutating         |
| ---                 | ---                  |
| ``sort(by:)``       | ``sorted(by:)``      |
| ``reverse()``       | ``reversed()``       |
| ``shuffle(using:)`` | ``shuffled(using:)`` |
| ``partition(by:)``  |                      |
| ``swapAt(,)``       |                      |

### Splitting and Joining

```swift
split(separator:maxSplits:omittingEmptySubsequences:)
split(maxSplits:omittingEmptySubsequences:whereSeparator) // closure
joined(separator:)
```

### Differences

```swift
difference(from:by:)
applying()

print(presidents.count)
print(presidents.sorted())
presidents.remove(at: 5)
print(presidents)
print(presidents.contains("Washington"))
print(presidents.contains("Hubbard"))
print(presidents.reversed())
presidents.sort()
presidents.reverse()
presidents.randomElement() ?? "Empty string"
presidents.removeFirst()
presidents.removeLast()
presidents.popLast() -> Element?
```

### Two-Dimensional Arrays

```swift
var a = Array(repeating: Array(repeating: 0, count: 8), count: 8)
```

## Dictionaries

```swift
let employee2 = [
    "name": "Taylor Swift",
    "job": "Singer",
    "location": "Nashville" ]

print(employee2["name"]) // Optional("Taylor Swift")
print(employee2["job"] ?? "Unknown")
print(employee2["location"])
print(employee2["password"]) // nil
print(employee2["favorite color"] ?? "Unknown") // Unknown
print(employee2["favorite color", default: "red"]) // red

let names = [true: "true", false: "false"]

print(names[true])

print(employee2["favorite ice cream flavor", default: "Vanilla"])
```

## Tuples

```swift
func getUser() -> (firstName: String, lastName: String) {
    ("Taylor", "Swift")
}
```

## Closures

* Parameters and return type go after the `{` up to the keyword `in`.
* Parameter names are only used when calling named functions, not closures.
* Parameter types are only needed when they can't be inferred from the closure's code.
* `()` means the same thing as `Void`
* Closures can't use external parameter labels
* Shorthand parameters `$0`...`$n` omit parameter list
* Can use a function with the same signature in place of a closure

## Structs

```swift
var computedProperty: Type {
    /* compute value */
}

var computedProperty: Type {
    get {
        /* compute value */
    }
    set {
        /* mutate stuff */
    }
}

var propertyObservers: Type {
    willSet {
        print(newValue)
    }
    didSet {
        print(oldValue)
    }
}
```

### Access Control

* `open /* allow subclassing */`
* `public`
* `package /* multi-module package */`
* `internal /* current module -- default */`
* `fileprivate`
* `private`

### Static Properties and Methods

* `self` -- current *value* of a struct
* `Self` -- current *type* of a struct
* Only statics?
  * Make it an empty `enum` so it can't be instantiated
* You can make a `static` variable `private` so only the struct's `static` methods can access it.

## Classes

### Differences from Struct

* Inheritance
* No automatic memberwise initializer
* Copies share the same data
* Can add a deinitializer to run when final copy is destroyed
* Constant class variables can have their variable properties changed

## Protocols

* `some Foo` -- some specific class that implements Foo. The compiler figures it out.
* `any Foo` ???

```swift
struct User: Equatable { // Swift automatically writes piecewise equality test
    let name: String
}
```

## Extensions

* Can add computed properties as well as functions
* Protocol extensions let you provide default functionality for a protocol

```swift
extension Numeric {
    func squared() -> Self {
        self * self
    }
}
```

## Optionals

```swift
let theyMightBeGiants: [Giant?]
let wereCertainlyDwarfs: [Dwarf]
```

### Nil Coalescing Operator

```swift
optional ?? valueIfNil
```

### Optional Chaining

```swift
let author2 = book2?.author?.first?.uppercased() ?? "A"
```

### Optional in Lieu of Do/Try/Catch

* With `guard let` at top of function
* With nil coalescing to try and provide default value on failure
* When you genuinely don't care if the function failed or not

```swift
let user = (try? getUser(id: 23)) ?? "Error"
```

* See also: `try!` if you promise the called function will **never** throw

## Generics

```swift
func identity<A>(_ value: A) -> A {
    return value
}

enum Optional<Wrapped> {
    case none
    case some(Wrapped)
}
```

## Logging

```swift
let log = Logger(subsystem: "com.josh.example", category: "error")
```

## Value Types

```swift
struct MyValueType: Codable, Sendable, Identifiable, Hashable {}
```

## Dates

```swift
DateComponents
```

## Serialization

```swift
MyClass: Codable { }
    enum CodingKeys: String, CodingKey { }

if let encoded = try? JSONEncoder().encode(object) { }
if let decodedObject = try? JSONDecoder().decode(DecodedObjectType.self, from: encoded) { }
```

## Loading Data

```swift
let (data, _) = try await URLSession.shared.data(from: url)
let recentChangesResponse = try JSONDecoder().decode(RecentChangesResponse.self, from: data)
recentChanges = recentChangesResponse.query.recentchanges
```

## Concurrency

* Under **Swift 6.1**
  * Non-isolated `async` functions run on the *global* (background) executor
  * Non-isolated non-`async` functions run on the *caller*'s actor
* Under **Swift 6.2**
  * `@concurrent` functions run on global executor whether `async` or not
  * **Default Actor Isolation** (set to `@MainActor` for new projects)
    * All unlabeled classes and functions run on specified actor
  * **Approachable Concurrency** (on by default for new projects)
    * `nonisolated(nonsending)` — `nonisolated` functions run on *caller's* actor whether `async` or not

## SwiftData

```swift
@Model class ModelClass {
```

```swift
WindowGroup {
    ContentView()
}
.modelContainer(for: ModelClass.self)
```

```swift
#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: User.self, configurations: config)
        let user = User(name: "Taylor Swift", city: "Nashville", joinDate: .now)
        return EditUserView(user: user)
            .modelContainer(container)
    } catch {
        return Text("Failed to create container: \(error.localizedDescription)")
    }
}
```

## Core Image

```swift
import CoreImage.CIFilterBuiltins
```
