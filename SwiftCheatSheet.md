#Swift Cheat Sheet

##Generics
	func identity<A>(_ value: A) -> A {
		return value
	}

	enum Optional<Wrapped> {
		case none
		case some(Wrapped)
	}

##Computed Properties
	var property: Type {
		computedValue
	}
	
##Logging
    let log = Logger(subsystem: "com.josh.example", category: "error")

##Value Types
	struct MyValueType: Codable, Sendable, Identifiable, Hashable {}
