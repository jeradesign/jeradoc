# Swift Cheat Sheet
## Strings
```
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
movie.hasSuffix(".jpg") // true

string.components(separatedBy: "\n")
string.trimmmingCharacters(in: .whitespacesAndNewlines)
```

## Arrays
```
var presidents = ["Washington", "Adams", "Jefferson", "Madison", "Monroe", "Adams"]

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
```
var a = Array(repeating: Array(repeating: 0, count: 8), count: 8)
```

## Dictionaries
	let employee2 = [
		"name": "Taylor Swift",
		"job": "Singer",
		"location": "Nashville" ]

	print(employee2["name"]) // Optional("Taylor Swift")
	print(employee2["job"] ?? "Unknown")
	print(employee2["location"])
	print(employee2["password"]) // nil
	print(employee2["favorite color"] ?? "Unknown") // Unknown
	print(employee2["favorite color", default: "red"] // red

	let names = [true: "true", false: "false"]

	print(names[true])

	print(employee2["favorite ice cream flavor", default: "Vanilla"])

## Tuples
    func getUser() -> (firstName: String, lastName: String) {
        ("Taylor", "Swift")
    } 

## Closures
* Parameters and return type go after the "{" up to the keyword "in".
* Parameter names are only used when calling named functions, not closures.
* Parameter types are only needed when they can't be inferred from the closure's code.
* () means the same thing as Void
* Closures can't use external parameter labels
* Shorthand parameters \$0...$n omit parameter list
* Can use a function with the same signature in place of a closure

## Structs
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

### Access Control
* open /* allow subclassing */
* public
* package /* multi-module package */
* internal /* current module -- default */
* fileprivate
* private

### Static Properties and Methods
* self -- current *value* of a struct
* Self -- current *type* of a struct
* Only statics?
    * Make it an empty enum so it can't be instantiated
* You can make a static variable private so only the struct's static methods can access it.

## Classes
### Differences from Struct
* Inheritance
* No automatic memberwise initializer
* Copies share the same data
* Can add a deinitializer to run when final copy is destroyed
* Constant class variables can have their variable properties changed

## Protocols
* "some Foo" -- some specific class that implements Foo. The compiler figures it out.
* "any Foo" ???
```
struct User: Equatable { // Swift automatically writes piecewise equality test
    let name: String
}
```

## Extensions
* Can add computed properties as well as functions
* Protocol extensions let you provide default functionality for a protocol
```
extension Numeric {
    func squared() -> Self {
        self * self
    }
}
```

## Optionals
```
let theyMightBeGiants: [Giant?]
let wereCertainlyDwarfs: [Dwarf]
```

### Nil Coalescing Operator
```
optional ?? valueIfNil
```

### Optional Chaining
```
let author2 = book2?.author?.first?.uppercased() ?? "A"
```

### Optional in Lieu of Do/Try/Catch
* With guard let at top of function
* With nil coalescing to try and provide default value on failure
* When you genuinely don't care if the function failed or not
```
let user = (try? getUser(id: 23)) ?? "Error"
```
* See also: try! if you promise the called function will **never** throw

## Generics
```
func identity<A>(_ value: A) -> A {
	return value
}

enum Optional<Wrapped> {
	case none
	case some(Wrapped)
}
```

## Logging
```
let log = Logger(subsystem: "com.josh.example", category: "error")
```

## Value Types
```
struct MyValueType: Codable, Sendable, Identifiable, Hashable {}
```

## Dates
```
DateComponents
```

## Serialization
```
MyClass: Codable { }
    enum CodingKeys: String, CodingKey { }

if let encoded = try? JSONEncoder().encode(object) { }
if let decodedObject = try? JSONDecoder().decode(DecodedObjectType.self, from: encoded) { }
```

## Loading Data
```
let (data, _) = try await URLSession.shared.data(from: url)
let recentChangesResponse = try JSONDecoder().decode(RecentChangesResponse.self, from: data)
recentChanges = recentChangesResponse.query.recentchanges
```
## SwiftData
```
@Model class ModelClass {
```

```
WindowGroup {
    ContentView()
}
.modelContainer(for: ModelClass.self)
```

```
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
```
import CoreImage.CIFilterBuiltins
```
