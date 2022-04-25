# iOS Cheat Sheet

## Project Settings

### Launch in Landscape Mode

There are 3 different "Supported interface orientations" settings in Info.plist. Changing the one for the Project only changes the default one. You need to go in and also change the ones for iPhone and iPad manually (or delete them so they use the default).

## Basic Launch Screen

* Add image to launch screen
* Add constraints: Align Vertically and Horizontally in Container
* Select **both** ImageView and top-level view
* Add constraints: Equal Widths & Equal Heights
* Inspect width and height constraints in Size Inspector
  * Ensure top-level view is **second** parameter
  * Change comparison from "Equal" to "Less Than or Equal"
  * Use the Multiplier field to specify the percentage of screen width and height. (I like 0.8 horizontally, and 0.6 vertically.)
* Optional: You can also specify absolute height and width constraints to prevent image from getting too big on big screens. Just be sure and change the absolute size constraints from "Equal" to "Less Than or Equal" in the Size Inspector. Otherwise you'll get a conflicting constraints error.

## Save a Snapshot

```
UIImageWriteToSavedPhotosAlbum(snapshot, self, #selector(saveImageComplete(image:err:context:)), nil)
@objc private func saveImageComplete(image:UIImage, err:Error?, context:UnsafeMutableRawPointer?) {
```

## Run Code on Main Thread

```
DispatchQueue.main.async {
    // UI code
}
```

```
DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
    // your code here
}
```

## Why won't buttons work?

If subview lies outside of superview then control events do not fire. For sake of convenience set clipSubviews property of the superview to YES, so that you can identify the subviews frame visually. [dev gr](https://stackoverflow.com/questions/21128517/why-is-my-touch-up-inside-event-for-my-uibutton-not-being-called#comment34569319_21128871)

## CGRect

A CGRect's origin is in the upper left in UIKit. (But lower-left in default Core Graphics coordinate space!)

## Segues

```
    performSegue(withIdentifier: "myIdentifier", sender: self)
```
```
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier != "myIdentifier" {
        return
    }
    guard let myVC = segue.destination as? MyViewController else {
        return
    }
    // set up myVC here
}
```        
```
    self.dismiss(animated: true, completion: nil)
```

## SF Symbols (iOS 13 or later)

## Computed Properties

```
var property: Type {
	return aType
}
```

## pow()

***The pow function returns a Decimal when given an integer power!!! Cast to Double if you want a Double result!***

## Protocols and Extensions

* You can create an extension with the same name as a protocol to provide a default implementation.

## Networking

```
func performRequest(with urlString: String) {
    guard let url = URL(string: urlString) else {
        return
    }
    let session = URLSession(configuration: .default)
    let task = session.dataTask(with: url) { (maybeData, maybeResponse, maybeError) in
        if let error = maybeError {
            delegate?.didFailWithError(error: error)
            return
        }
        if let data = maybeData {
            if let parsedData = parseJSON(data) {
                delegate?.didUpdateData(parsedData)
            } else {
                return // delegate already received error
            }
        }
    }
    task.resume()
}

func parseJSON(_ data: Data) -> ParsedData? {
    let decoder = JSONDecoder()
    do {
        let parsedData = try decoder.decode(ParsedData.self, from: data)
        return parsedData
    } catch {
        delegate?.didFailWithError(error: error)
        return nil
    }
}
```

## UITableView

### UITableViewDataSource *plist-storable objects only!*
``func tableView(_ tableView: UITableView, numberOfRowsInSection: Int) -> Int``  
``func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell``

### UITableViewDelegate
``func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)``  

## Finding the Simulator Directory
Stop in debugger, then type:
`po NSHomeDirectory()`
