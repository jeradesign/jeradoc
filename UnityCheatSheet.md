# Unity Cheat Sheet

## Basics
* (X, Y, Z) = (right, up, forward) (left-handed)
* There is no "default unit", but...
    * Physics system constants assume 1 unit = 1 meter
    * Model building apps vary in scale. To be sure:
        * Create a 1x1x1 meter cube in your modeling software
        * Import the cube into Unity
        * Create a second cube in Unity (default size is 1x1x1)
        * Verify the two cubes are the same size.

## Scene View
* ` to show the **overlay** pop-up
* ~ to show/hide all **overlays**
* middle-button pan
* ⌥-left-button rotate around center of screen
* right-button rotate around viewpoint (and wasd)
* ⌥-right-button zoom in and out
* f center on currently selected object
* shift-F lock the view on currently selected object

## Hierarchy
* drag object tree to Project to create prefab

## Inspector
* right-click on "Transform" to reset

## GameObject
* Every GameObject has a transform component

## MonoBehavior
* Start() and Update()
* [SerializeField]

# VisionOS PolySpatial Setup
* Create new Universal 3d Project (URP)
* Open Project Settings
* Select “XR Plugin Management”
* “Install XR Plugin Management” if needed
* Select Vision Pro
* Under Apple visionOS, select Mixed Reality
* Install PolySpatial
* Create a Volume Camera in your scene
    * From the **GameObjects > XR > Setup** menu or the **XR Building Blocks** overlay, click **Volume Camera**.
    * Add a **VolumeCameraWindowConfiguration** asset to your project with **Create > PolySpatial > Volume Camera Window Configuration**. You must store this asset in one of your project's **Resources** folders.
* Assign the volume camera for bounded or unbounded mode and adjust the dimensions (if bounded).
    * Dimensions adjust the rendering scale of your content.
    * For bounded apps, make sure something icy visible within the dimensions of the volume camera.
* Open the **Build Settings** window (menu: **File > Build Settings**.
    * Select the **visionOS** platform.
    * If necessary, click **Switch Platform** to change to the visionOS platform.
    * Add and select any Scenes you want to include in the build. (For example SampleScene.)
    * Click the **Build** button.

**Unbounded Apps** For unbounded apps that use ARKit features, add the **com.unity.xr.arfoundation** package to your project. To use skeletal hand tracking data, add the **com.unity.xr.hands** package to your project.

## Hand Tracking
There is one necessary GameObject to have in each hand-tracking XR scene in your app: an **XR Origin**. 

To create an XR Origin, right-click in the Hierarchy window, and select the following option from the context menu.
