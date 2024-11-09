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
@Observable
```

## Views
```
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
```
Color(.red)
    .ignoresSafeArea()
LinearGradient / RadialGradient / AngularGradient
View()
    .background(.indigo.gradient)
```

## Buttons & Images
```
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
```
Picker("Message", selection: $selection) {
    Text("First").tag(0)
    Text("Second").tag(1)
    Text("Third").tag(2)
}
.pickerStyle(.segmented)
```

## Stepper
```
Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
```

## DatePicker
```
DatePicker("Wake Up", selection: $wakeUp, in: Date.now..., displayedComponents: .date)
    .labelsHidden()
```

## List
Form looks *very* different on macOS!<br/>
List lets you use dynamic data without a ForEach.
```
List(0..<5) {
    Text("Dynamic Row \($0)")
}
```

## Alert
```
.alert(errorTitle, isPresented: $showingError) {
    Button("Something") { } // Omit buttons entirely for default "OK"
} message: {
    Text(errorMessage)
}
```

## Animation
### Implicit
```
.scaleEffect(animationAmount)
.blur(radius: (animationAmount - 1) * 3)
.animation(.default, value: animationAmount)
```

## Classes
```
@Observable
class MyDataClass
```

## Sheets
```
@Environment(\.dismiss) private var dismiss
```

## UserDefaults & AppStorage
```
UserDefaults.standard.set(tapCount, forKey: "Tap")
@AppStorage("tapCount") private var tapCount = 0
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