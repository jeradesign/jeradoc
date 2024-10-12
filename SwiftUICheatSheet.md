# SwiftUI Cheat Sheet
SwiftUI uses *structs* for UI design, but *classes* for data!

```
var body: some View { // computed property!
```

⌘-⌥-p to refresh preview

## @Tags

 ```
@AppStorage("onboarding") var isOnboardingViewActive: Bool = false
@State private var myVar = initialValue
@FocusState private var isFocused: Bool
@Binding var myBinding: Type
@Environment(\.someName) var someName: SomeNameType // EnvironmentValues
@MainActor
@Observer
```

## Views
```
Text
Button
Form / Section
VStack
HStack
NavigationStack / .navigationTitle
```

## #Preview

```
#Preview("Fixed size", traits: .fixedLayout(width, height) {}
#Preview("Size that fits", traits: .sizeThatFitsLayout) {}
#Preview("Orientation", traits: .landscapeLeft) {}
```
    
### Old Style

```
struct MapAnnotationView_Previews: PreviewProvider {
    static let locations: [NationalParkLocation] =
    	Bundle.main.decode("locations.json")

    static var previews: some View {
	    MapAnnotationView(location: locations[0])
    	    .previewLayout(.sizeThatFits)
        	.padding()
	}
}
```

## Tweaking Views

```
.padding()
.background(.black.opacity(0.50))
.foregroundStyle(.white)
.clipShape(Circle())

Spacer()
```

## Sheets

```
// Show sheet when optionalItem is non-nil
.sheet(item: $optionalItem) { item in
    // Build view of item
}
```

## Debugging
In your body { } :

```
let _ = Self._printChanges()
```

## Adding a delete button
```
    init() {
        UITextField.appearance().clearButtonMode = .whileEditing
    }
```