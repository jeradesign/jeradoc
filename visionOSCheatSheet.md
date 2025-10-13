#visionOS Cheat Sheet

Scene Types
* Window - 2D, Resizable
* Volume - Fixed Size
* Space

Immersive Spaces — Full Space
* Mixed - Objects against pass-through background
* Progressive - Approx 180º Immersive View
* Full

~~Reality Composer Pro~~ [GLTFKit2](https://github.com/warrenm/GLTFKit2)

Game Controllers
* Use the game controller as a *game controller*
```
GCRequiresControllerUserInteraction
<dict>
	<key>visionOS</key>
	<true/>
</dict>
```
