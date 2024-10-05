# Unity Cheat Sheet

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
