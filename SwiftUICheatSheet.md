# SwiftUI Cheat Sheet

SwiftUI uses *structs* for UI design, but *classes* for data!

```swift
var body: some View { // computed property!
```

⌘-⌥-p to refresh preview

## @Tags

```swift
@AppStorage("onboarding") var isOnboardingViewActive: Bool = false
@State private var myVar = initialValue
@FocusState private var isFocused: Bool
@Binding var myBinding: Type
@Environment(\.someName) var someName: SomeNameType // EnvironmentValues
@MainActor
@Observable
@Bindable
```

## Views

```swift
Text
Button
Form / Section
VStack / HStack / ZStack
NavigationStack / .navigationTitle
Slider / Stepper / Toggle
Picker
List

.navigationTitle("Title")
.onSubmit({ })
.onAppear(perform: { })
```

## Colors & Gradients

```swift
Color(.red)
    .ignoresSafeArea()
LinearGradient / RadialGradient / AngularGradient
View()
    .background(.indigo.gradient)
```

## Buttons & Images

```swift
Button("Button 3") { /* Action */ }
    .buttonStyle(.borderedProminent)
Button("Title", systemImage: "pencil")
Image("imageName")
Image(decorative: "imageName")
Image(systemName: "pencil")
Label("Name", systemImage: "pencil")
    .padding()
    .foregroundStyle(.white)
    .background(.red)
```

## Picker

```swift
Picker("Message", selection: $selection) {
    Text("First").tag(0)
    Text("Second").tag(1)
    Text("Third").tag(2)
}
.pickerStyle(.segmented)
```

## Stepper

```swift
Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
```

## DatePicker

```swift
DatePicker("Wake Up", selection: $wakeUp, in: Date.now..., displayedComponents: .date)
    .labelsHidden()
```

## List

Form looks *very* different on macOS!<br/>
List lets you use dynamic data without a ForEach.

```swift
List(0..<5) {
    Text("Dynamic Row \($0)")
}
```

## Alert

```swift
.alert(errorTitle, isPresented: $showingError) {
    Button("Something") { } // Omit buttons entirely for default "OK"
} message: {
    Text(errorMessage)
}
```

## Animation

### Implicit

```swift
.scaleEffect(animationAmount)
.blur(radius: (animationAmount - 1) * 3)
.animation(.default, value: animationAmount)
```

## Classes

```swift
@Observable
class MyDataClass
```

## Sheets

```swift
// Show sheet when optionalItem is non-nil
.sheet(item: $optionalItem) { item in
    // Build view of item
}

@Environment(\.dismiss) private var dismiss
```

## UserDefaults & AppStorage

```swift
UserDefaults.standard.set(tapCount, forKey: "Tap")
@AppStorage("tapCount") private var tapCount = 0
```

## Image

```swift
Image(.example)
    .resizable()
    .scaledToFit()
    .containerRelativeFrame(.horizontal) { size, axis in
        size * 0.8
    }
```

## VStack & LazyVStack

* LazyVStack always takes full horizontal space

## Navigation

```swift
NavigationStack(path: $path) {
    List(0..<100) { i in
        NavigationLink("Select \(i)", value: i)
    }
    .navigationDestination(for: Int.self) { selection in
        Text("You selected \(selection)")
    }
    .navigationTitle($title) // editable
    .navigationBarTitleDisplayMode(.inline) // must be inline to edit
}
.toolbarBackground(.blue)
.toolbarColorScheme(.dark)
.toolbar(.hidden, for: .navigationBar)
```

## ScrollView

```swift
    .scrollBounceBehavior(.basedOnSize)
```

### Preview

```swift
#Preview("Fixed size", traits: .fixedLayout(width: 300, height: 200)) {}
#Preview("Size that fits", traits: .sizeThatFitsLayout) {}
#Preview("Orientation", traits: .landscapeLeft) {}
```

### Old Style

```swift
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

```swift
.padding()
.background(.black.opacity(0.50))
.foregroundStyle(.white)
.clipShape(Circle())

Spacer()

.containerRelativeFrame(.horizontal) { width, axis in
    width * 0.6
}
```

## Debugging

In your `body { }`:

```swift
let _ = Self._printChanges()
```

## Adding a delete button

```swift
    init() {
        UITextField.appearance().clearButtonMode = .whileEditing
    }
```
