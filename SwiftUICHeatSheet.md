# SwiftUI Cheat Sheet

## @ Tags

    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    @State var myVar = initialValue
    @Binding var myBinding: Type
    @Environment(\.someName) var someName: SomeNameType // EnvironmentValues
    @MainActor
    @Observer

## #Preview

    #Preview("Fixed size", traits: .fixedLayout(width, height) {}
    #Preview("Size that fits", traits: .sizeThatFitsLayout) {}
    #Preview("Orientation", traits: .landscapeLeft) {}
    
### Old Style

	struct MapAnnotationView_Previews: PreviewProvider {
	    static let locations: [NationalParkLocation] =
	    	Bundle.main.decode("locations.json")

	    static var previews: some View {
    	    MapAnnotationView(location: locations[0])
        	    .previewLayout(.sizeThatFits)
            	.padding()
 	    }
    }
 
## Tweaking Views

    .padding()
    .background(.black.opacity(0.50))
    .foregroundStyle(.white)
    .clipShape(Circle())

    Spacer()

## Sheets

	// Show sheet when optionalItem is non-nil
    .sheet(item: $optionalItem) { item in
        // Build view of item
    }

## Debugging
In your body { } :

	let _ = Self._printChanges()